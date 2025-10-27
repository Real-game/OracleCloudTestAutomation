*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Documentation  Verify Absence - Employee with position change
...            Prerequisite:  SME intervention needed to change position for an emp
...            Environment Specific Data:  Login User; Person Name; Person Number
...            Reusable Data:  Parent Action; Child Action; Accurals; Date; Status
...            Dynamic Data: Latest Assignment Name

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC070_Verify_Absence_Employee_with_position_change.json
${csv_path}  ./CSV/td_PAY_TC070_Verify_Absence_Employee_with_position_change.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Verify Absence - Employee with position change
    [Tags]  PayrollAbsenceTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4 - 5
    click on homepage
    Go to my client group person management
    Log  Step 6
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 7
    Select Result Row With Active Payroll Eligible
    Log  Step 8
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Wait And Verify Page Contains Text  Manage Absences and Entitlements  20  Manage Absences and Entitlements page not found
    Log  Step 9
    Select Accruals  ${data}[Accurals]
    Select date  ${data}[Date]
    Select Yes Button
    Sleep  10s
    Log  Step 10
    Select Accruals Status  ${data}[Status]
    Click Plan Balances Go Arrow
    Take Plan Balances Table Screenshot
    Sleep  5s
    page should contain  ${data}[Latest Assignment Name]