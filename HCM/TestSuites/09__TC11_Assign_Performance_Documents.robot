*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/EligibilityBatchProcess.robot
Documentation  Assign Performance documents
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Specialist Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Setup Maintenace Group; Batch Type; Review Period;Performance Document Name; Maximum Threads Create for Performance Document
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PMP_TC11_Assign_Performance_Documents.json
${csv_path}  ./CSV/td_PMP_TC11_Assign_Performance_Documents.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Assign Performance documents
    [Tags]  PMPTalentTestCase  ModifyData  PMP22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click On Performance
    Sleep  5s
    Log  Step 5
    Select Setup Maintenance group  ${data}[Setup Maintenace Group]
    Log  Step 6
    Select Batch Type  ${data}[Batch Type]
    Log  Step 7
    Select Current date check box
    Log  Step 8
    Select Eligibility Review Period  ${data}[Review Period]
    Log  Step 9
    Select Performance Document Name  ${data}[Performance Document Name]
    Log  Step 10
    Select Eligible Performance Document checkbox
    Log  Step 11
    Enter Maximum Number of Threads Created  ${data}[Maximum Threads Create for Performance Document]
    Log  Step 12
    Select Purge Historic Performance Management Eligibility Data
    Log  Step 13
    Select Submit
    Log  Step 14
    Select Warning Ok