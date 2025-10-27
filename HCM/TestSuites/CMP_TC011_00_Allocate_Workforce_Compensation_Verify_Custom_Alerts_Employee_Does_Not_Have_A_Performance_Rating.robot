*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Resource  ../PageObjects/ConfigureAlerts.robot
Documentation  Allocate Workforce Compensation - Verify custom alerts - Employee does not have a performance rating
...            Prerequisite:  Not Applicable
...            Environment Specific Data: Login User
...            Reusable Data:  Worksheet Name,Alert Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC011_00_Allocate_Workforce_Compensation_Verify_Custom_Alerts_Employee_Does_Not_Have_A_Performance_Rating.json
${csv_path}  ./CSV/td_CMP_TC011_00_Allocate_Workforce_Compensation_Verify_Custom_Alerts_Employee_Does_Not_Have_A_Performance_Rating.csv

*** Test Cases ***
Scenario: Allocate Workforce Compensation - Verify custom alerts - Employee does not have a performance rating
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
    Click on Pay for Performance
    Log  Step 8 - 9
    Click Go To Task From given Worksheet Task List  ${data}[Worksheet Name]
    Log  Step 10 - 13
    Verify Alerts Checkbox is Checked  ${data}[Alert Name]