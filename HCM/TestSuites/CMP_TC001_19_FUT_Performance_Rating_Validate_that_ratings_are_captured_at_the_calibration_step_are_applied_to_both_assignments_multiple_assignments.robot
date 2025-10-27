*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensation.robot
Resource  ../PageObjects/PayForPerformance.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/PerformanceDocuments.robot

Documentation  Validate that the ratings captured at the captured at the calibration step are applied to both assignments
...            Prerequisite:  User with Proxy manager access; CMP_TC001.01 - Workforce Compensation - Configuration - Create new plan cycle; CMP_TC001.10 - Workforce Compensation - Standard Functionality - Run Batch Processes - Start Workforce Compensation Cycle
...            Environment Specific Data: Manager Login(PFP_common_test_data.csv); Proxy Manager Name
...            Reusable Data:  Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC033_00_Allocate_Workforce_Compensation_Manage_Budgets_Distribute_Initial_Budget.json
${csv_path}  ./CSV/td_CMP_TC033_00_Allocate_Workforce_Compensation_Manage_Budgets_Distribute_Initial_Budget.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Performance Rating - Validate that the ratings captured at the captured at the calibration step are applied to both assignments
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Click on My Client Compensation from Navigator
    Log  Step 7
    Click on Act as Proxy Manager
    Log  Step 8
    Select the Manager To Act as Proxy Manager  Ehren Saiko
    Log  Step 10
    Click on Pay for Performance
    Apply Filter for Eligible Employees
    Log  Step 11
    ${person_number_value}  ${person_name_value}  ${person_rating_value}  Extract eligible person number and person name
    Log  Step 13
    click on homepage
    Log  Step 14
    Go To My Client Group
    Log  Step 15
    Click On Performance
    Log  Step 16
    Click on Performance Documents Link
    Log  Step 17
    Search for Performance Document for a Person  ${person_number_value}

