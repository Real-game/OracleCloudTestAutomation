*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Documentation  External Candidate - Apply to job
...            Prerequisite:  Requisition in Posted Status
...            Environment Specific Data:  Not Applicable
...            Reusable Data: Title;Country Code;Phone Number;Country;Address;City;Postal Code;Province;Were you previously employed by Metrolinx?;Are you a Family Member of a current Metrolinx Employee?;Resume Path;Sexual Orientation;Race and Ethnicity;Are you eligible to work in Canada?;Indigenous Persons or Indigeneity;criminal offence;vaccinated;Persons with Disabilities;Gender Identity;Source type;Do you have valid work visa?
...            Dynamic Data: Email;First Name;Last Name
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP057.json
${csv_path}  ./CSV/td_BP057.csv
*** Test Cases ***
Scenario:Job Application Flow - External Candidates (Apply to a job (External Candidate))
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 3 - 4
    Search Requisition  ${data}[Requisition ID]
    Log  Step 5
    Click on Apply Now
    Log  Step 6 -8
    Enter Email  ${data}[Email]
    Log  Step 9 - 18
    Fill Personal Info  ${data}
    Log  Step 19
#    Click on Submit Application
#    Go Back to Job Details