*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ChangeSalary.robot
Documentation  Salary change of an Employee
...            Prerequisite:  Employee details should be present in environment or use person number from available list (SME Intervention Needed)
...            Environment Specific Data:  Manager Login(Compensation_common_test_data.csv); Person number
...            Reusable Data: Action; Salary Amount
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_Manage_Salary_Update_Salary_NA_Employee_Type_E_FT.json
${csv_path}  ./CSV/td_CMP_TC001_Manage_Salary_Update_Salary_NA_Employee_Type_E_FT.csv
${common_json_path}  ./TestData/Compensation_common_test_data.json
${common_csv_path}  ./CSV/Compensation_common_test_data.csv

*** Test Cases ***
Scenario: Salary change of an Employee
    [Tags]  CompensationTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Change Salary Under Compensation Section
    Log  Step 8 - 9
    Search Person In Change Salary Page  ${data}[Person Number]
    Log  Step 10
    Click Propose New Salary Button
    Log  Step 11 - 12
    Select Current Date
    Log  Step 13
    Select Action  ${data}[Action]
    Log  Step 14
    Click Ok Button
    Log  Step 15
    Update salary Amount  ${data}[Salary Amount]
    Log  Step 16
    Click Continue Button
    Log  Step 17
    Review Updated salary Amount  ${data}[Salary Amount]
    Sleep  7s
    Log  Step 18
    Click Submit Button
    Log  Step 19
    Click Warning Yes Button
    page should not contain  Error
