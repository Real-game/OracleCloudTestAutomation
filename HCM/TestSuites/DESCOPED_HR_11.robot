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
${json_path}    ./TestData/td_HR_11.json
${csv_path}  ./CSV/td_HR_11.csv
*** Test Cases ***

Scenario: Temp Assignment End to M - FT (Current Date)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5 - 6
    Search person number in person management  ${data}[Person Number]   ${data}[Assignment Number]
    Log  Step 7 - 9
    Update action for employee  ${data}[Effective Date]  ${data}[Action Name]  ${data}[Action Reason]
    Log  Step 10
    Assignment End Warning