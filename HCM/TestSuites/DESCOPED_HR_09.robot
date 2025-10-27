*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_09.json
${csv_path}  ./CSV/td_HR_09.csv
*** Test Cases ***

Scenario: Temp Assignment Start to M - FT (Current Date)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5 - 6
    Search employee number in person management  ${data}[Person Number]
    Log  Step 7 - 9
    Update action for employee  ${data}[Effective Date]  ${data}[Action Name]  ${data}[Action Reason]
    Log  Step 10
    Select Assignment Status   ${data}[Assign Status]
    Log  Step 11 - 24
    Create New Assignment  ${data}[Business Unit]  ${data}[Position]  ${data}[Payroll]  ${data}[Salary Basics]  ${data}[Salary Amount]