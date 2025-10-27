*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Documentation  Update Absence plan enrollment - Promotion/transfer/ Demotion
...            Prerequisite:  HR-16, HR-86, HR-17
...            Environment Specific Data:  Login User, Person Name, Person Number
...            Reusable Data:  Parent Action, Child Action, Accurals, Date, Status
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ABS_TC002_Update_absence_plan_enrollment_due_to_promotion_demotion_transfer_etc_for_an_employee.json
${csv_path}  ./CSV/td_ABS_TC002_Update_absence_plan_enrollment_due_to_promotion_demotion_transfer_etc_for_an_employee.csv

*** Test Cases ***
Scenario: Update Absence plan enrollment - Promotion/transfer/ Demotion
    [Tags]  AbsenceHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
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
    Log  Step 10
    Select date  ${data}[Date]
    Select Yes Button
    Log  Step 11
    Select Accruals Status  ${data}[Status]
    Click Plan Balances Go Arrow
    Take Plan Balances Table Screenshot
    Sleep  5s