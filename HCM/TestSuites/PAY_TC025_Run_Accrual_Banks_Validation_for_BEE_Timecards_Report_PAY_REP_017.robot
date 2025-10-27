*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AnalyticsHomePage.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Run Accrual Banks Validation for BEE Timecards Report (PAY-REP-017)
...            Prerequisite:  PAY-REP-17
...            Environment Specific Data:  Login User
...            Reusable Data:  Not applicable
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite Analytics
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC025_Run_Accrual_Banks_Validation_for_BEE_Timecards_Report_PAY_REP_017.json
${csv_path}  ./CSV/td_PAY_TC025_Run_Accrual_Banks_Validation_for_BEE_Timecards_Report_PAY_REP_017.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Run Accrual Banks Validation for BEE Timecards Report (PAY-REP-017)
    [Tags]  PayrollTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    Click On Catalog Link
    Log  Step 5
    Expand Shared Folders
    Log  Step 6 - 7
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand Payroll Reports
    Select PAY-REP-017_MX_Accrual Banks validation for BEE Timecards_v2
    Select And Open MX_Accrual Banks validation for BEE Report
    Log  Step 8
    Click Apply

