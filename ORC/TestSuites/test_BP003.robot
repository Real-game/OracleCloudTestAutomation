*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/PreviewJobRequisition.robot
Documentation  Recruiter should be able to Cancel Requisition
...            Prerequisite: Requisition ID with Open Status or Job Formating In Progress Status
...            Environment Specific Data: Recruiter user
...            Reusable Data: Not Applicable
...            Dynamic Data: Requisition ID
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP003.json
${csv_path}  ./CSV/td_BP003.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***
Scenario: Recruiter should be able to Cancel Requisition
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Recruiter user]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7 - 10
    Search for requisition id  ${data}[Requisition ID]
#    Suspend Job Requisition
#    Sleep  15s
#    Verify requisition status  Suspended
#    Click on the Requisition title  ${data}[Requisition ID]
#    Preview Job Requisition
#    Sleep  2s
#    Verify Preview Page
#    Sleep  5s
#    Click on the Requisition title  ${data}[Requisition ID]
    Log  Step 11 - 17
    Cancel Job Requisition
    Sleep  15s
    Logout