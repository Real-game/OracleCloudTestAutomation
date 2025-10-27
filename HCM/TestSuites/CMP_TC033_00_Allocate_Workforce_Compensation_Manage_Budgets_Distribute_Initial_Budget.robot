*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Resource  ../PageObjects/ManageBudgets.robot
Documentation  Allocate Workforce Compensation - Manage Budgets - Distribute Initial Budget
...            Prerequisite:  User with Proxy manager access; CMP_TC001.01 - Workforce Compensation - Configuration - Create new plan cycle; CMP_TC001.10 - Workforce Compensation - Standard Functionality - Run Batch Processes - Start Workforce Compensation Cycle
...            Environment Specific Data: Manager Login(PFP_common_test_data.csv)
...            Reusable Data:  Budget Pool;Reason;Budget Amount;Distribution Option
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
Scenario: Allocate Workforce Compensation - Manage Budgets - Distribute Initial Budget
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
    Click on Act as Proxy Manager
    Log  Step 8
    Select the Manager To Act as Proxy Manager  ${data}[Manager Name]
    Log  Step 9
    Click on Manage Budgets
    Log  Step 10
    Click on Adjust Budget
    Adjust the budget  ${data}[Budget Pool]  ${data}[Reason]  ${data}[Budget Amount]

