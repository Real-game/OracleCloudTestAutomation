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
${json_path}    ./TestData/td_HR_15.json
${csv_path}  ./CSV/td_HR_15.csv
*** Test Cases ***

Scenario: Admin update Personal information - Address - E - FT
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 6
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 7 - 12
    Modify Address in Personal Information  ${data}[Effective Date]  ${data}[Address Line 1]  ${data}[Address Line 2]
