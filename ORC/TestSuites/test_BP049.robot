*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/PostingDetail.robot
Documentation  Pipeline requisition (Add linked requisition to pipeline requisition and post pipeline requisition)
...            Prerequisite:  Standard Requisition and Pipeline Requisition
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Expiry date
...            Dynamic Data: Pipeline Requisition ID;Standard Requisition ID
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP049.json
${csv_path}  ./CSV/td_BP049.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Pipeline requisition (Add linked requisition to pipeline requisition and post pipeline requisition)
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
    Search for requisition id  ${data}[Pipeline Requisition ID]
    Log  Step 11 - 15
    Add a linked requisition  ${data}[Standard Requisition ID]
    Sleep  3s
    Log  Step 16
    Click on Actions dropdown
    Log  Step 17
    Click on Move to Posting
    Sleep  3s
    Log  Step 18 - 23
    Edit Internal Career Site Posting Information   ${data}[Expiry date]
    Log  Step 24 - 30
    Edit External Career Site Posting Information Section  ${data}[Expiry date]
    Sleep  2s
    Logout




