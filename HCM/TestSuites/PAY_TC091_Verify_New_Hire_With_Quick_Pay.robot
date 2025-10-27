*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/ViewCompensationHistory.robot
Resource  ../PageObjects/Payroll.robot
Documentation  Verify New Hire with Quick Pay
...            Prerequisite: HR-81 (Need New hire Employee details)
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Not applicable
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC091_Verify_New_Hire_With_Quick_Pay.json
${csv_path}  ./CSV/td_PAY_TC091_Verify_New_Hire_With_Quick_Pay.csv
*** Test Cases ***

Scenario: Verify New Hire with Quick Pay
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Payroll Calculation under Payroll via Navigator
    Log  Step 6
    Click Search Person on Left Side Panel
    Log  Step 7 - 8
    Enter Person number and search in Keywords field  ${data}[Person Number]
    Log  Step 9 - 10
    Click Simplified Quick Pay under Action button
    Log  Step 11
    Check elements are checked
    Log  Step 12
    Click on Quick Pay Submit Button
    Log  Step 13 - 14
    Check Statement of earning
    Log  Step 15
    Click on Quick Pay Submit Button
