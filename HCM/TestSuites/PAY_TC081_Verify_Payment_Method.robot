*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PayrollDetail.robot
Resource  ../PageObjects/PersonalPaymentMethod.robot
Documentation  Verify Payemnt method of an employee
...            Prerequiste:  ESSPAY_TC001
...            Environment Specific Data:  Login User, Person Number
...            Reusable Data: Actions, Child Action
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC081_Verify_Payment_Method.json
${csv_path}  ./CSV/td_PAY_TC081_Verify_Payment_Method.csv

*** Test Cases ***

Scenario: Verify Payment Method
    [Tags]  PayrollTestCase  Read Only
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go To My Client Group
    Log  Step 6
    Click on Payroll
    Click Personal Payment Methods
    Log  Step 7 - 8
    Select Employee in Personal Payment Method  ${data}[Person Number]
    Log  Step 9
    Select Action from Dropdown  ${data}[Actions]  ${data}[Child Action]
    Log  Step 10
    Verify Employee has Bank Account
    Select Cancel button
    Log  Step 11
    click on homepage