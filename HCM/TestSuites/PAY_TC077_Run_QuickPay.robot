*** Settings ***
Library    OperatingSystem
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Payroll.robot
Resource  ../PageObjects/FlowSubmission.robot

Documentation  Run QuickPay
...            Prerequisite:  SME intervention need to provide person number -Can take any exisiting employee number
...            Environment Specific Data:  Login User;Person Number
...            Reusable Data:  Not applicable
...            Dynamic Data:  Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC077_Run_QuickPay.json
${csv_path}  ./CSV/td_PAY_TC077_Run_QuickPay.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Run QuickPay
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4 - 9
    Click on Payroll from Navigator
    Wait And Click Element  link: Simplified QuickPay
    Log  Step 10 - 11
    Search and click on Person  ${data}[Person Number]
    Log  Step 12 - 13
    Payroll Submit Button
    Sleep  60s
    Log  Step 14 - 15
    Payroll Submit Button
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    wait until element is visible  xpath: //a[text()="Calculate QuickPay"]/following::img[@title="Completed"]  120s
    FOR  ${loop_count}  IN RANGE  7
        ${element_count}=  get element count  xpath: //a[text()="Calculate QuickPay"]/following::img[@title="Completed"]
        Capture Page Screenshot And Retry If Required
        EXIT FOR LOOP IF  "${element_count}"=="2"
        reload page
        Sleep  15s
    END