*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee deletes a payment method
...            Prerequiste:  001__ESSPAY_TC001_employee_adds_a_payment_method
...            Environment Specific Data:  Login User
...            Reusable Data:  Payment Method Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC003_employee_deletes_a_payment_method.json
${csv_path}  ./CSV/td_ESSPAY_TC003_employee_deletes_a_payment_method.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: employee deletes a payment method
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[ESSPAY Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click On Pay Under Me
    Log  Step 6
    Click My Banking Information
    Log  Step 7
    Click Edit Payment Method  ${common_data}[Payment Method Name]
    Log  Step 8
    Click Delete Button
    Click Warning Ok for Delete record
    page should not contain  ${common_data}[Payment Method Name]
    Logout From Profile