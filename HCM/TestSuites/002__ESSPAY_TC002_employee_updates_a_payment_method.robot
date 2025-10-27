*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee updates a payment method
...            Prerequisite:  001__ESSPAY_TC001_employee_adds_a_payment_method
...            Environment Specific Data:  Login User
...            Reusable Data:  Payment Method Name and Payment Amount
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC002_employee_updates_a_payment_method.json
${csv_path}  ./CSV/td_ESSPAY_TC002_employee_updates_a_payment_method.csv

*** Test Cases ***
Scenario: employee updates a payment method
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
    Click Edit Payment Method  ${data}[Payment Method Name]
    Log  Step 8
    Set Amount Value  ${data}[Payment Amount]
    Log  Step 9
    Click Save
    Sleep  5s
    Verify Amount  ${data}[Payment Method Name]  ${data}[Payment Amount]
