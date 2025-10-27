*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalCandidateProfileHomePage.robot
Documentation  Candidate application status & personal info update
...            Prerequisite:  Candidate details already present in environment
...            Environment Specific Data:  Email
...            Reusable Data: Menu Option
...            Dynamic Data: Title; First Name; Last Name; Country Code; Phone Number
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}  ./TestData/td_BP031.json
${csv_path}  ./CSV/td_BP031.csv

*** Test Cases ***
Scenario: Manage Application (Candidate application status & personal info update)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 2 - 3
    Click on Manage Profile
    Login with email  ${data}[Email]
    Log  Step 4
    Go back to career site
    Log  Step 5 - 6
    Click on Manage Profile
    Log  Step 7
    Show menu options and select  ${data}
    Log  Step 8
    Click on Update

