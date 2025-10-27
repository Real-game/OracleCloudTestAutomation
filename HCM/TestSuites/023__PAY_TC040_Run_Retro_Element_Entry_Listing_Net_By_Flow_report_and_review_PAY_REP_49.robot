*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AnalyticsHomePage.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Run Payroll report for 'Run Retro Element Entry Listing Net By Flow'
...            Prerequisite:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name; Retro Flow Name
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite Analytics
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC040_Run_Retro_Element_Entry_Listing_Net_By_Flow_report_and_review_PAY_REP_49.json
${csv_path}  ./CSV/td_PAY_TC040_Run_Retro_Element_Entry_Listing_Net_By_Flow_report_and_review_PAY_REP_49.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***

Scenario: Run Payroll report for 'Run Retro Element Entry Listing Net By Flow'
    [Tags]  PayrollTestCase  ModifyData  PAY22D
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
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand Payroll Reports
    Select PAY-REP-049_Payroll Retro generated Entries Report
    Log  Step 6-7
    Select And Open Report  ${data}[Report Name]
    Log  Step 8
    Set Retro Flow Name  ${data}[Retro Flow Name]
    Log  Step 9
    Click Apply