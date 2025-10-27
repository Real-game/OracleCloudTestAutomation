*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Payroll.robot
Documentation  Manage Calculation Card - Garnishment and Family Support
...            Prerequisite: Existing employee number
...            Environment Specific Data:  Login User, Person Number
...            Reusable Data: Calculation Card Name; Calculation Component Name 1;Reference Code 1; Calculation Component Name 2; Reference Code 2; Display Name on Value 1; Amount; Display Name on Value 2
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC074_Manage_Calculation_Card_Garnishment_And_Family_Support.json
${csv_path}  ./CSV/td_PAY_TC074_Manage_Calculation_Card_Garnishment_And_Family_Support.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***

Scenario: Manage Calculation Card - Garnishment and Family Support
    [Tags]  PayrollTestCase  ModifyData  PAY22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Payroll Calculation under Payroll via Navigator
    Log  Step 6
    Click Search Person on Left Side Panel
    Log  Step 7 - 8
    Enter Person number and search in Keywords field  ${data}[Person Number]
    Log  Step 9
    Click Calculation Cards under Action button
    Log  Step 10
    Click Add button for Calculation Card
    Log  Step 11 - 12
    Enter Calculation Card date and Name  ${data}[Calculation Card Name]
    Log  Step 13
    Click Calculation Card Continue
    Log  Step 14
    Click Involuntary Deduction
    Log  Step 15
    Click Add button for Calculation Component
    Log  Step 16 - 18
    Select Calculation Component  ${data}[Calculation Component Name 1]  ${data}[Reference Code 1]
    Log  Step 19
    Select Order Amount Payee in Calculation Component Detail
    Log  Step 20
    Enter Reference date in Calculation Component Detail
    Log  Step 21
    Click on Enter Calculation Value
    Log  Step 22
    Click Add button on Calculation Values
    Log  Step 23 - 25
    Select Display value and Amount in Calculation values  ${data}[Display Name on Value 1]  ${data}[Amount]
    Log  Step 26
    Select Save and Close on Calculation Component page
    Log  Step 27
    Click Involuntary Deduction on Calculation Card
    Log  Step 28
    Click Add button for Calculation Component
    Log  Step 29 - 31
    Select Calculation Component  ${data}[Calculation Component Name 2]  ${data}[Reference Code 2]
    Log  Step 32
    Select Order Amount Payee in Calculation Component Detail
    Log  Step 33
    Enter Reference date in Calculation Component Detail
    Log  Step 34
    Click on Enter Calculation Value
    Log  Step 35
    Click Add button on Calculation Values
    Log  Step 36 - 38
    Select Display value and Amount in Calculation values  ${data}[Display Name on Value 2]  ${data}[Amount]
    Log  Step 39
    Select Save and Close on Calculation Component page
    Log  Step 40
    Click on Payroll Calculation under Payroll via Navigator
    Log  Step 41
    Click Search Person on Left Side Panel
    Log  Step 42
    Enter Person number and search in Keywords field  ${data}[Person Number]
    Log  Step 43
    Click Element Entries under Action button
    Log  Step 44
    Check Calculation Component present in Element Entries  ${data}[Calculation Component Name 1]  ${data}[Calculation Component Name 2]
