*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Resource  ../Helpers/Config.robot
Documentation  External Candidate - Apply to job
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
${json_path}    ./TestData/td_BP017B.json
${csv_path}  ./ExternalNewHireSecondCSV/td_BP017B.csv
${prerequisites_json_path}  ./TestData/td_BP001B.json  #If we want to run BP017B seperately - Update BP001B Json

*** Test Cases ***
Scenario: Carrer Portals ( Apply to a job (External Candidate) )
    [Tags]  ExternalNewHireB
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
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
    Sleep  20s
    ${candidate_name}=  convertToCandidateName  ${data}[First Name]  ${data}[Last Name]
    Log to console  name: ${candidate_name}
    appendtojson  ${json_path}  Candidate Name  ${candidate_name}
    generatecsv  ${json_path}  ${csv_path}

