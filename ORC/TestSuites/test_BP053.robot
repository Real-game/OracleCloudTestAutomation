*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Resource  ../Helpers/Config.robot
*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}  ./TestData/td_BP053.json
${csv_path}  ./CSV/td_BP053.csv

*** Test Cases ***
Scenario: Career Portals ( Apply to a job (External Candidate) )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
#    Search Requisition  ${data}[Requisition ID]
#    Click on Apply Now
#    Enter Email  ${data}[Email]
#    Fill Personal Info  ${data}
#    Click on Submit Application
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
