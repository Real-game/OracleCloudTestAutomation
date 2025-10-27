*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_17.json
${csv_path}  ./CSV/td_HR_17.csv

*** Test Cases ***
Scenario: HR Specialist Transfer an Employee(Retro)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5
    Search Person in person management  ${data}[Employee Name]  ${data}[Employee Number]
    Log  Step 6
    Select Person With Assignment Status As Active Payroll Eligible
    Log  Step 7
    Click Edit Dropdown
    Select Update Option
    Log  Step 8
    Enter Effective Start Date  ${data}[Effective Start Date]
#    Select Action
#    Select Action Reason
#    Click Ok

