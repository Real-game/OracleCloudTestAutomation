*** Settings ***
Library    OperatingSystem
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/FlowSubmission.robot
Resource  ../PageObjects/Payroll.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC048_Calculate_Accruals_Seeded_Absence_Process.json
${csv_path}  ./CSV/td_PAY_TC048_Calculate_Accruals_Seeded_Absence_Process.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Submit flow for 'Calculate Accruals' With Duplicate Payroll Flow Name
    [Tags]  NegativeTestCase
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    Log  Step 4-5
    Click on Payroll from Navigator
    Log  Step 6
    Click Submit A Flow
    Log  Step 7
    Select CA Legislative Data Group
    Log  Step 8
    Search And Select Specific Flow Pattern  ${data}[Flow Pattern]
    Log  Step 9
    Set Payroll Flow  ${data}[Payroll Flow]
    Log  Step 10
    Set Effective Date  ${data}[Todays Date]
    Log  Step 11
    Select Payroll  ${data}[Payroll]
    Log  Step 12
    Click Submit Button
    Check Submission Status With Error