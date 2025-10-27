*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreateWorkRelationship.robot
Documentation  Quick Actions -Rehire Manual (Current Date)
...            Prerequisite:  Functional to pick ex-employee person number - in dynamic test data input sheet
...            Environment Specific Data:  HR Login; Person Number; Person Name
...            Reusable Data:  Relationship Start Date; Legal Employer; Way To Relationship; Why Adding Relationship; Business Unit; Tax Reporting Unit; Time Card Required; Currency; Salary Basis; Salary Amount
...            Dynamic Data:  Position ID

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_84_Quick_Actions_Rehire_Manual_Current_Date.json
${csv_path}  ./CSV/td_HR_84_Quick_Actions_Rehire_Manual_Current_Date.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Quick Actions -Rehire Manual (Current Date)
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Create Work Relationship Under Employment Section
    Log  Step 8 - 9
    Advance Search For Person With Filters  ${data}[Person Number]  ${data}[Person Name]
    Log  Step 10
    Select Manage Info Checkbox
    Manage Info Continue Button
    Log  Step 11-14
    Fill When And Why Details For Create Work Relationship  ${data}[Relationship Start Date]  ${data}[Legal Employer]  ${data}[Way To Relationship]  ${data}[Why Adding Relationship]
    Log  Step 15 - 16
    Click Continue Button
    wait until page contains  Person Number  20s
    Click Continue Button
    Log  Step 17-19
    Fill Employment Details For Create Work Relationship    ${common_data}[Business Unit]  ${data}[Position ID]
    Log  Step 20-21
    Click Continue Button
    wait until page contains  NAICS Override Code  20s
    Click Continue Button
    wait until page contains  Payroll Frequency  20s
    Log  Step 22-23
    Fill Payroll Details For Create Work Relationship  ${data}[Tax Reporting Unit]  ${data}[Time Card Required]
    Log  Step 24
    Click Continue Button
    Log  Step 25-27
    Select Salary Details For Create Work Relationship  ${data}[Currency]  ${data}[Salary Basis]  ${data}[Salary Amount]
    Log  Step 28
    Click Continue Button
    Sleep  5s
    Log  Step 29
    Click Submit Button
    page should not contain  Error
