*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalCandidateProfileHomePage.robot
Documentation  Candidate withdrawn application status & delete profile
...            Prerequisite:  Candidate should apply to position/requistion
...            Environment Specific Data:  Not Applicable
...            Reusable Data: Delete Profile
...            Dynamic Data: Requisition_ID To Withdraw,Email
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}  ./TestData/td_BP036.json
${csv_path}  ./CSV/td_BP036.csv

*** Test Cases ***
Scenario: Manage Application (Candidate withdrawn application status & delete profile)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 2
    Click on Manage Profile
    Log  Step 3 - 5
    Login with email  ${data}[Email]
    Log  Step 6 - 7
    Change Status  ${data}[Requisition_ID To Withdraw]
    Log  Step 13
    Delete Profile  ${data}[Delete Profile]

