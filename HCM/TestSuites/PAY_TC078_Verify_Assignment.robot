*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/ViewCompensationHistory.robot
Documentation  Verify Assignment
...            Prerequisite: Need Existing Employee details
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data:  Assignment Status
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC078_Verify_Assignment.json
${csv_path}  ./CSV/td_PAY_TC078_Verify_Assignment.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***

Scenario: Verify Assignment
    [Tags]  PayrollTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group person management
    Log  Step 7 - 8
    Search employee number in person management  ${common_data}[Person Number]
    Log  Step 9
    Click Assignment details option
    Log  Step 10
    ${end_date_value}   Get Effective End Date Value
    Check Salary History Future value  ${end_date_value}
    Log  Step 11
    Verify Assignment status has given value  ${data}[Assignment Status]
    Log  Step 12
    Check Working hours has value
    Log  Step 13
    Check Assignment Category has value
    Log  Step 14
    Check Standard working hours has value
    Log  Step 15
    Check Primary flag has value
    Log  Step 16
    Check People Group has value




