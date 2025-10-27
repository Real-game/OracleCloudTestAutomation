*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Resource  ../PageObjects/ConfigurePlanCycles.robot

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_01_Workforce_Compensation_Configuration_Create_New_Plan_Cycle.json
${csv_path}  ./CSV/td_CMP_TC001_01_Workforce_Compensation_Configuration_Create_New_Plan_Cycle.csv

*** Test Cases ***
Scenario: Create New Plan Cycle
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Log  Step 5
    Click Compensation
    Log  Step 6
    Click on WorkForce Compensation Plans
    Log  Step 7
    Click on Pay for Performance
    Log  Step 8 - 9
    Click Go To Task From given Worksheet Task List  Configure Plan Cycles
    Create Plan Cycle  ${data}[Plan Cycle Name]  ${data}[Evaluation Period Start Date]   ${data}[Evaluation Period End Date]  ${data}[Plan Access Start Date]    ${data}[Plan Access End Date]   ${data}[Plan Short Name]     ${data}[HR Data Extraction Date]
    Click Go To Task From given Worksheet Task List  Configure Plan Cycles
    Verify Plan Cycle  ${data}[Plan Cycle Name]