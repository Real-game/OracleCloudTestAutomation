*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/EligibilityBatchProcess.robot
Resource  ../PageObjects/MonitorProcesses.robot
Documentation  HR Assigns Mid year Performance Documents
...            Prerequisite:  Mid year performance document Created
...            Environment Data:  HR Specialist Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Setup Maintenance Group;Batch Type;Review Period;Performance Document Name
...            Dynamic Data: NA

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC117_HR_Assigns_Mid_Year_Performance_Documents.json
${csv_path}  ./CSV/td_TC117_HR_Assigns_Mid_Year_Performance_Documents.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: HR Assigns Mid year Performance Documents
    [Tags]  PMPTalentTestCase130701  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    Click on homepage
    Log  Step 5
    Go To My Client Group
    Log  Step 6
    Click On Performance
    Log  Step 7
    Select Setup Maintenance group  ${data}[Setup Maintenance Group]
    Log  Step 8
    Select Batch Type  ${data}[Batch Type]
    Select Eligibility Review Period  ${data}[Review Period]
    Log  Step 9
    Select Performance Document Name  ${data}[Performance Document Name]
    Log  Step 10
    Select Eligible Performance Document checkbox
    Log  Step 11
    Select Submit
    ${process_id}=  Get And Return Process Id
    Log  Step 12
    Click Ok To Confirm
    Log  Step 13
    Click Monitor Process Button
    Log  Step 14
    Monitor Status Of Given Process Id  ${process_id}