*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/PersonManagementDetail.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_24.json
${csv_path}  ./CSV/td_HR_24.csv
*** Test Cases ***

Scenario: Reverse termination
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5 - 6
    Search employee number in person management  ${data}[Person Number]
    Log  Step 7 - 9
    Terminate the employee  ${data}[Termination Reason]  ${data}[Notification Date]  ${data}[Termination Date]  ${data}[Processing Options]  ${data}[Process Change Date]
    Sleep  10s