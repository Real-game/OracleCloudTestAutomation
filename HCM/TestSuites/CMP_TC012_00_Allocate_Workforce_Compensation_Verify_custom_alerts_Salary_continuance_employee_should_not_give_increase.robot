*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Documentation  Allocate Workforce Compensation - Verify custom alerts - Salary continuance employee - should not give increase
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Plan,Task Name,Alert Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC012_00_Allocate_Workforce_Compensation_Verify_custom_alerts_Salary_continuance_employee_should_not_give_increase.json
${csv_path}  ./CSV/td_CMP_TC012_00_Allocate_Workforce_Compensation_Verify_custom_alerts_Salary_continuance_employee_should_not_give_increase.csv

*** Test Cases ***
Scenario: Allocate Workforce Compensation - Verify custom alerts - Salary continuance employee - should not give increase
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5 - 6
    Click on WorkForce Compensation Plans
    Log  Step 7
    Click Given Plan Link  ${data}[Plan]
    Log  Step 8 - 9
    Click Go To Task From given Worksheet Task List  ${data}[Task Name]
    Log  Step 10 - 11
    Verify Checkbox Checked  ${data}[Alert Name]