*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AnalyticsHomePage.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Run Payroll report for reto genration entried PAY-REP-024
...            Prerequisite:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name
...            Dynamic Data: Not Applicable


*** Settings ***
Suite Setup  Before Suite Analytics
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC039_Run_Payroll_Retro_Generated_Entries_Report_PAY_REP_024.json
${csv_path}  ./CSV/td_PAY_TC039_Run_Payroll_Retro_Generated_Entries_Report_PAY_REP_024.csv

*** Test Cases ***
Scenario: Run Payroll report for reto genration entried PAY-REP-024
    [Tags]  PayrollTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    Click On Catalog Link
    Log  Step 5-7
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand Payroll Reports
    Select PAY-REP-024_Payroll Retro generated Entries Report
    Select And Open Report  ${data}[Report Name]
    Log  Step 8
    Click Apply
