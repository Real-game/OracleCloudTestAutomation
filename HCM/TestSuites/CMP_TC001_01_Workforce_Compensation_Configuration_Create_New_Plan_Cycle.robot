*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Resource  ../PageObjects/ConfigurePlanCycles.robot
Documentation  Create New Plan Cycle
...            Prerequisite:  Not Applicable
...            Environment Data:  Manager Login(PFP_common_test_data.csv)
...            Reusable Data:  Not Applicable
...            Dynamic Data: Plan Cycle Name; Evaluation Period Start Date; Evaluation Period End Date; Plan Access Start Date; Plan Access End Date; Plan Short Name; HR Data Extraction Date

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_01_Workforce_Compensation_Configuration_Create_New_Plan_Cycle.json
${csv_path}  ./CSV/td_CMP_TC001_01_Workforce_Compensation_Configuration_Create_New_Plan_Cycle.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Create New Plan Cycle
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go To My Client Group
    Log  Step 6
    Click Compensation
    Log  Step 7
    Click on WorkForce Compensation Plans
    Log  Step 8
    Click on Pay for Performance
    Log  Step 9
#    Click Go To Task From given Worksheet Task List  Configure Plan Cycles
    Click on Plan cycles
    Log  Step 10 - 19
    Create Plan Cycle  ${data}[Plan Cycle Name]  ${data}[Evaluation Period Start Date]   ${data}[Evaluation Period End Date]  ${data}[Plan Access Start Date]    ${data}[Plan Access End Date]   ${data}[Plan Short Name]     ${data}[HR Data Extraction Date]
    Log  Step 20
#    Click Go To Task From given Worksheet Task List  Configure Plan Cycles
    Click on Plan cycles
    Log  Step 21
    Verify Plan Cycle  ${data}[Plan Cycle Name]