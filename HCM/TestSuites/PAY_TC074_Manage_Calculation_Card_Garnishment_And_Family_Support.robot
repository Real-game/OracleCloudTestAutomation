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
...            Reusable Data: Calculation Card Name; Calculation Component Name 1;Reference Code 1; Calculation Component Name 2; Reference Code 2; Display Name on Value 1; Amount; Display Name on Value 2; Payroll Group1; Payroll Group2
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
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 7
    Go to my client group Payroll  ${data}[Payroll Group1]
    Log  Step 8
#    Click Search Person on Left Side Panel
#    Log  Step 7 - 8
    Enter Person number and select first row  ${data}[Person Number]
    Log  Step 9
#    Click Calculation Cards under Action button
#    Log  Step 10
    Click Add button for Calculation Card
    Log  Step 10 - 11
    Enter Calculation Card date and Name  ${data}[Calculation Card Name]
    Log  Step 12
    Click Calculation Card Continue
    Log  Step 13
    Click Involuntary Deduction
    Log  Step 14
    Click Add button for Calculation Component
    Log  Step 15 - 17
    Select Calculation Component  ${data}[Calculation Component Name 1]  ${data}[Reference Code 1]
    Log  Step 18
    Select Order Amount Payee in Calculation Component Detail
    Log  Step 19
    Enter Reference date in Calculation Component Detail
    Log  Step 20
    Click on Enter Calculation Value
    Log  Step 21
    Click Add button on Calculation Values
    Log  Step 22 - 24
    Select Display value and Amount in Calculation values  ${data}[Display Name on Value 1]  ${data}[Amount]
    Log  Step 25
    Select Save and Close on Calculation Component page
    Log  Step 26
    Click Involuntary Deduction on Calculation Card
    Log  Step 27
    Click Add button for Calculation Component
    Log  Step 28 - 30
    Select Calculation Component  ${data}[Calculation Component Name 2]  ${data}[Reference Code 2]
    Log  Step 31
    Select Order Amount Payee in Calculation Component Detail
    Log  Step 32
    Enter Reference date in Calculation Component Detail
    Log  Step 33
    Click on Enter Calculation Value
    Log  Step 34
    Click Add button on Calculation Values
    Log  Step 35 - 37
    Select Display value and Amount in Calculation values  ${data}[Display Name on Value 2]  ${data}[Amount]
    Log  Step 38
    Select Save and Close on Calculation Component page
    Log  Step 39
#    Click on Payroll Calculation under Payroll via Navigator
    click on homepage
    Log  Step 40
    Go to my client group Payroll  ${data}[Payroll Group2]
    Log  Step 41
#    Click Search Person on Left Side Panel
#    Log  Step 7 - 8
    Enter Person number and select first row  ${data}[Person Number]
#    Log  Step 43
#    Click Search Person on Left Side Panel
#    Log  Step 42
#    Enter Person number and search in Keywords field  ${data}[Person Number]
#    Log  Step 43
#    Click Element Entries under Action button
    Log  Step 42
    Check Calculation Component present in Element Entries  ${data}[Calculation Component Name 1]  ${data}[Calculation Component Name 2]
