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
${json_path}    ./TestData/td_HR_16.json
${csv_path}  ./CSV/td_HR_16.csv
*** Test Cases ***

Scenario: Promote an employee - M - FT (Current Date)

    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on My Client Group  ${data}[Client Group selection]
    Log  Step 6
    Search person number in person management  ${data}[Person Number]  ${data}[Assignment number]
    Log  Step 7 - 11
    Update action for employee  ${data}[Effective Date]  ${data}[Action Name]  ${data}[Action Reason]

