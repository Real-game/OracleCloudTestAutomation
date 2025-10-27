*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ViewCompensationHistory.robot
Resource  ../PageObjects/Payroll.robot
Documentation  Verify Quick Pay for Tax Card (ESSPAY_TC008)
...            Prerequisite: ESSPAY_TC008
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Not applicable
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC088_Verify_Quick_Pay_for_Tax_Card_ESSPAY_TC008.json
${csv_path}  ./CSV/td_PAY_TC088_Verify_Quick_Pay_for_Tax_Card_ESSPAY_TC008.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***

Scenario: Verify Quick Pay for Tax Card (ESSPAY_TC008)
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Payroll Calculation under Payroll via Navigator
    Log  Step 6
    Click Search Person on Left Side Panel
    Log  Step 7 - 8
    Enter Person number and search in Keywords field  ${data}[Person Number]
    Log  Step 9 - 10
    Click Calculation Cards under Action button
    Log  Step 11
    Click Tax Credit Information and check Total Claim Amount  Federal  ${data}[Federal Total Claim Amount]
    Log  Step 12
    Click on Payroll from Navigator
    Wait And Click Element  link: Simplified QuickPay
    Log  Step 13 - 14
    Search and click on Person  ${data}[Person Number]
    Log  Step 15 - 16
    Payroll Submit Button
    Sleep  120s
    Log  Step 17 - 18
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