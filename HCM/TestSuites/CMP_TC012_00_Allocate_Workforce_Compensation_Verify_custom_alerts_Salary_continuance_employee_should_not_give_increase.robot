*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Documentation  Allocate Workforce Compensation - Verify custom alerts - Salary continuance employee - should not give increase
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Manager Login(PFP_common_test_data.csv)
...            Reusable Data:  Plan(PFP_common_test_data.csv);Task Name;Alert Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC012_00_Allocate_Workforce_Compensation_Verify_custom_alerts_Salary_continuance_employee_should_not_give_increase.json
${csv_path}  ./CSV/td_CMP_TC012_00_Allocate_Workforce_Compensation_Verify_custom_alerts_Salary_continuance_employee_should_not_give_increase.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Allocate Workforce Compensation - Verify custom alerts - Salary continuance employee - should not give increase
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5 - 6
    Click on WorkForce Compensation Plans
    Log  Step 7
    Click Given Plan Link  ${common_data}[Plan]
    Log  Step 8 - 9
#    Click Go To Task From given Worksheet Task List  ${data}[Task Name]
    Click on Alerts in Task List
    Log  Step 10 - 11
    Verify Checkbox Checked  ${data}[Alert Name]