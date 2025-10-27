*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ChangeSalary.robot
Documentation  Salary change of an Employee
...            Prerequisite:  Employee details should be present in environment or use person number from available list (SME Intervention Needed)
...            Environment Specific Data:  Login User, Person number
...            Reusable Data: Action and Salary Amount
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_Manage_Salary_Update_Salary_NA_Employee_Type_E_FT.json
${csv_path}  ./CSV/td_CMP_TC001_Manage_Salary_Update_Salary_NA_Employee_Type_E_FT.csv

*** Test Cases ***
Scenario: Salary change of an Employee
    [Tags]  CompensationTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 5
    click on homepage
    Go to my client groups show more
    Click Change Salary Under Compensation Section
    Log  Step 6 - 7
    Search Person In Change Salary Page  ${data}[Person Number]
    Log  Step 8
    Click Propose New Salary Button
    Log  Step 9
    Select Current Date
    Log  Step 10
    Select Action  ${data}[Action]
    Log  Step 11
    Click Ok Button
    Log  Step 12
    Update salary Amount  ${data}[Salary Amount]
    Log  Step 13
    Click Continue Button
    Review Updated salary Amount  ${data}[Salary Amount]
    Sleep  7s
    Log  Step 14
    Click Submit Button
    Click Warning Yes Button
    page should not contain  Error
