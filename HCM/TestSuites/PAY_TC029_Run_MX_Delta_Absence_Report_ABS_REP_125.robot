*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AnalyticsHomePage.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Manager adds a Participant feedback for an Employee
...            Prerequisite:  TABS-REP-125
...            Environment Specific Data:  Login User
...            Reusable Data:  Not Applicable
...            Dynamic Data: Not Applicable


*** Settings ***
Suite Setup  Before Suite Analytics
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC029_Run_MX_Delta_Absence_Report_ABS_REP_125.json
${csv_path}  ./CSV/td_PAY_TC029_Run_MX_Delta_Absence_Report_ABS_REP_125.csv

*** Test Cases ***
Scenario: Run MX Delta Absence Report (ABS-REP-125)
    [Tags]  PayrollTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    Click On Catalog Link
    Log  Step 5
    Expand Shared Folders
    Log  Step 6 - 7
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand Absence Reports
    Select ABS-REP-125 MX_Delta Absence report
    Select And Open ABS_REP-125 MX_Delta Absence Report
    #Log  Step 8
    #Click Apply


