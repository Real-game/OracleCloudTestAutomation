*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/PreviewJobRequisition.robot
Resource  ../PageObjects/JobRequisitionDetail.robot
Documentation  Recruiter should be able to Suspend requisition
...            Prerequisite: Requisition ID with Open Status
...            Environment Specific Data: Recruiter user
...            Reusable Data: Not Applicable
...            Dynamic Data: Requisition ID
...            Automation Data: Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP030.json
${csv_path}  ./CSV/td_BP030.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***
Scenario: Recruiter should be able to suspend requisition
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
    Log  Step 11 - 17
    Suspend Job Requisition
    Sleep  15s
    Log  Step 18 - 19
    Verify requisition status  Suspended
#    Sleep  15s
#    Search for requisition id  ${data}[Requisition ID]
#    Cancel Job Requisition
#    Sleep  15s
#    Search for requisition id    ${data}[Requisition ID]
#    Sleep  3s
#    Click on Actions dropdown
#    Click on Reopen Job Requisition
#    Sleep  3s
#    Click on Actions dropdown
#    Click on Redraft Job Requisition
#    Sleep  4s
#    Redraft Job Requisition  ${data}
#    Sleep  15s
    Logout