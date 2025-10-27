*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Resource  ../Helpers/Config.robot
Documentation  Ex Employee Candidate - Apply to job
...            Prerequisite:  Requisition in Posted Status
...            Environment Specific Data:  Not Applicable
...            Reusable Data: Title;Country Code;Phone Number;Country;Address;City;Postal Code;Province;Were you previously employed by Metrolinx?;Are you a Family Member of a current Metrolinx Employee?;Resume Path;Sexual Orientation;Race and Ethnicity;Are you eligible to work in Canada?;Indigenous Persons or Indigeneity;criminal offence;vaccinated;Persons with Disabilities;Gender Identity;Source type;Do you have valid work visa?
...            Dynamic Data: Email;First Name;Last Name
...            Automation Data: Requisition ID (Get from BP001);Candidate Name

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP017_rehire.json
${csv_path}  ./RehireCSV/td_BP017_rehire.csv
${prerequisites_json_path}  ./TestData/td_BP001_rehire.json  #If we want to run BP017 seperately - Update BP001 Json
${prerequisites_json_path2}  ./TestData/td_Get_Details_of_Candidate.json  #If we want to run BP017 seperately - Update td_Get_Details_of_Candidate Json
#Yes - I remember my employee number
*** Test Cases ***
Scenario: Carrer Portals ( Apply to a job (Ex Employee Candidate) )
    [Tags]  RehireProcess
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
    ${prerequisites_data2}=  readJson  ${prerequisites_json_path2}
    appendtojson  ${json_path}  Candidate Person Number  ${prerequisites_data2}[Candidate Person Number]
    appendtojson  ${json_path}  First Name  ${prerequisites_data2}[First Name]
    appendtojson  ${json_path}  Last Name  ${prerequisites_data2}[Last Name]
    appendtojson  ${json_path}  Email  ${prerequisites_data2}[Email]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Step 2 - 5
    Search Requisition  ${data}[Requisition ID]
    Log  Step 6
    Click on Apply Now
    Log  Step 7 - 9
    Enter Email  ${data}[Email]
    Log  Step 10 - 22
    Fill Personal Info  ${data}
    Log  Step 23
    Click on Submit Application
    Sleep  3s
    Check Error Popup
    Sleep  20s
    ${candidate_name}=  convertToCandidateName  ${data}[First Name]  ${data}[Last Name]
    Log to console  name: ${candidate_name}
    appendtojson  ${json_path}  Candidate Name  ${candidate_name}
    generatecsv  ${json_path}  ${csv_path}