*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/Payroll.robot
Resource  ../PageObjects/ViewCompensationHistory.robot
Documentation  Verify Payroll Relationship
...            Prerequisite: Need Existing Employee details
...            Environment Specific Data:  Login User; Person Name; Person Number
...            Reusable Data: Parent Action; Child Action; Payroll Status
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC084_Verify_Payroll_Relationship.json
${csv_path}  ./CSV/td_PAY_TC084_Verify_Payroll_Relationship.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***

Scenario: Verify Payroll Relationship
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
    Log  Step 7
    Search Person in person management  ${data}[Person Name]  ${common_data}[Person Number]
    Log  Step 8
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 9
    Check Relatioship Type has value
    Log  Step 10
    ${end_date_value}   Get Salary History End Date Value
    Check Salary History Future value  ${end_date_value}
    Log  Step 11
    Check Payroll details has value  ${data}[Payroll Status]







