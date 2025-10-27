*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee Adds a Duplicate Payment Mentod
...            Prerequisite:  ESSPAY_TC001_employee_adds_a_payment_method
...            Environment Specific Data:  Login User
...            Reusable Data:  Bank, Branch Code, What do you want to call this payment method?, Payment Method, Payment Amount, Payment Amount Type
...            Dynamic Data:  Account Number, Search Bank Account

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC001_employee_adds_a_payment_method.json
${csv_path}  ./CSV/td_ESSPAY_TC001_employee_adds_a_payment_method.csv

*** Test Cases ***
Scenario: Employee Adds a Duplicate Payrment Mentod
    [Tags]  NegativeTestCase
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
    Verify Warning Message With Negative Scenario
    Sleep  5s