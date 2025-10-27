*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee Adds a Payment Method with a new bank account
...            Prerequisite:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Account Number, Bank, Branch Code, What do you want to call this payment method?, Payment Method, Payment Amount, Search Bank Account and Payment Amount Type
...            Dynamic Data: Account Number and Search Bank Account(last 4 digit of account number)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC001_employee_adds_a_payment_method.json
${csv_path}  ./CSV/td_ESSPAY_TC001_employee_adds_a_payment_method.csv

*** Test Cases ***
Scenario: Employee Adds a Payment Method
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
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
    Verify Warning Message
    Select Warning Ok
    Log  Step 13
    Click Add Under My Banking Information
    Log  Step 14
    Call This Payment Method  ${data}[What do you want to call this payment method?]
    Log  Step 15
    Select Payment Type  ${data}[Payment Method]
    Log  Step 16
    Select Amount Type  ${data}[Payment Amount Type]
    Set Amount Value  ${data}[Payment Amount]
    Log  Step 17
    Select Bank Account  ${data}[Search Bank Account]
    Log  Step 18
    Sleep  5s
    Click Save
    Sleep  5s