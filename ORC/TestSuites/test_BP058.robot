*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP058.json
${csv_path}  ./CSV/td_BP058.csv
*** Test Cases ***
Scenario: Carrer Portals ( Apply to a job (External Candidate) )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 2 - 3
    Search Requisition  ${data}[Requisition ID]
    Log  Step 4
    Click on Apply Now
    Log  Step 5 - 7
    Enter Email  ${data}[Email]
    Log  Step 8
    Go Back to Job Details