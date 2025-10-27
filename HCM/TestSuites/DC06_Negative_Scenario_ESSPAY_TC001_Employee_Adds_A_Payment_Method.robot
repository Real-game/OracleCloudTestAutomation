*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee Adds a Duplicate Payment Mentod
...            Prerequisite:  ESSPAY_TC001_employee_adds_a_payment_method
...            Environment Specific Data:  Login User
...            Reusable Data:  Bank; Branch Code; What do you want to call this payment method?; Payment Method; Payment Amount; Payment Amount Type
...            Dynamic Data:  Account Number; Search Bank Account

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC001_employee_adds_a_payment_method.json
${csv_path}  ./CSV/td_ESSPAY_TC001_employee_adds_a_payment_method.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Employee Adds a Duplicate Payment Method
    [Tags]  NegativeTestCase
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
    Click Add Under Bank Account
    Log  Step 8
    Add Account Number  ${data}[Account Number]
    Log  Step 9
    Select Bank  ${data}[Bank]
    Log  Step 10
    Select Branch Code  ${data}[Branch Code]
    Log  Step 11
    Click Save
    Log  Step 12
    Verify Warning Message With Negative Scenario
    Sleep  5s