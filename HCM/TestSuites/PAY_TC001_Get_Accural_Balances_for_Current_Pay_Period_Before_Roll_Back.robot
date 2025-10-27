*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AbsenceAdministration.robot
Resource  ../PageObjects/ScheduleAndMonitorAbsenceProcess.robot
Documentation  Run 'Get Accrual balnces' before payroll rollback for upgrade testing
...            Prerequisite:  No data dependancy
...            Environment Specific Data:  Login User
...            Reusable Data: Plan Type;Business Unit;Time Range;Execution Time(min);Refresh Cycle(sec)
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC001_Get_Accural_Balances_for_Current_Pay_Period_Before_Roll_Back.json
${csv_path}  ./CSV/td_PAY_TC001_Get_Accural_Balances_for_Current_Pay_Period_Before_Roll_Back.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Run 'Get Accrual balnces' before payroll rollback for upgrade testing
    [Tags]  PayrollAbsenceTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go to my client group absence
    Log  Step 6
    Click on schedule and monitor absence process
    Log  Step 7-8
    Click on calculate accurals and balances run button
    Log  Step 9
    Select Plan Type  ${data}[Plan Type]
    Select Business Unit  ${data}[Business Unit]
    Click Submit Button
    ${process_id}=  Get And Return Process Id
    Click Confirmation Ok Button
    Select Time Range  ${data}[Time Range]
    #Verify Process Succeeded Status  ${process_id}  ${data}[Execution Time(min)]  ${data}[Refresh Cycle(sec)]