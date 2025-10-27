*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AbsenceAdministration.robot
Resource  ../PageObjects/ScheduleAndMonitorAbsenceProcess.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Absence plan enrollment of a newly hired employee (HR)
...            Prerequisite:  HR-81 and  Employee should be an new hire
...            Environment Specific Data:  Login User; Person Name
...            Reusable Data: Not Applicable
...            Dynamic Data: Employee Hired Date is should be an hired date of an employee

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ABS_TC001_Absence_plan_enrollment_of_newly_hired_employee(HR).json
${csv_path}  ./CSV/td_ABS_TC001_Absence_plan_enrollment_of_newly_hired_employee(HR).csv
${common_json_path}    ./TestData/Absence_common_test_data.json
${common_csv_path}  ./CSV/Absence_common_test_data.csv

*** Test Cases ***
Scenario: Absence plan enrollment of a newly hired employee (HR)
    [Tags]  AbsenceHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Search employee in person management  ${data}[Person Name]
    Verify initial Plan Balance in person management
    click on homepage
    Log  Step 5 - 6
    Go to my client group absence
    Log  Step 7
    Click on schedule and monitor absence process
    Log  Step 8 - 9
    Click on update accural plan enrollments run button
    Log  Step 10 - 14
    New absence Submission for employee  ${data}[Employee Hired Date]  ${data}[Person Name]
    Sleep  5s
    Log  Step 15 - 16
    Click on calculate accurals and balances run button
    Log  Step 17 - 20
    New absence Submission for employee  ${data}[Employee Hired Date]  ${data}[Person Name]
    Sleep  5s
    Log  Step 21
    Click on the homepage
    Log  Step 22
    Go to my client group person management
    Log  Step 23 - 25
    Search employee in person management  ${data}[Person Name]
    Verify Plan Balance in person management
