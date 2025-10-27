*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ChangeAssignment.robot
Documentation  Payroll Section in Change Assignment Flow
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Login; Person Number
...            Reusable Data:  Person Number
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_901_Payroll_Section_in_Change_Assignment_Flow.json
${csv_path}  ./CSV/td_HR_901_Payroll_Section_in_Change_Assignment_Flow.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Payroll Section in Change Assignment Flow
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Go to my client groups show more
    Click Change Assignment Under Employment Section
    Sleep  5s
    Log  Step 7 - 8
    Search And Select Person From Result  ${data}[Person Number]
    Log  Step 9 -10
    Wait And Verify Page Contains Text  What info do you want to manage?  20s  Change Assignment Page Not Foud
    Verify And Select Payroll Details Checkbox
    Log  Step 11
    Contiue Without Check
    Log  Step 12 -13
    Continue
    Continue
    Log  Step 14
    Verify Payroll Details Section
    Log  Step 15
    Select Action Type  ${data}[Action Type]
    Log  Step 16
    Select Time Card  ${data}[Time Card For Payroll]
    Log  Step 17
    Submit Details
    page should not contain  Error
    Wait And Verify Page Contains Text  My Client Groups  40s  Failed to submit