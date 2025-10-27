*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Documentation  Verify Person
...            Prerequisite: Need Existing Employee details
...            Environment Specific Data:  Login User; Person Name; Person Number
...            Reusable Data: Parent Action; Child Action
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC082_Verify_Person.json
${csv_path}  ./CSV/td_PAY_TC082_Verify_Person.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***

Scenario: Verify Person
    [Tags]  PayrollTestCase  ReadOnly  PAY22D
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
    Log  Step 7
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 8
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 9
    Click Person Information
    Log  Step 10
    Check Social Insurance Number has value
    Log  Step 11
    Check Date Of Birth has Value
    Log  Step 12
    Check Home and Primary address has value
    Log  Step 13
    Click Extra Information
    Click Adjustment Dates under Extra Information
    Check Vacation Entitlement Adjustment Date has value

