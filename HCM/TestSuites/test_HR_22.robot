*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Termination.robot
Resource  ../PageObjects/PersonManagement.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_22.json
${csv_path}  ./CSV/td_HR_22.csv
*** Test Cases ***

Scenario: Edit Seniority Dates
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
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 7 - 8
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 9
    Select Recalculate Seniority Dates  ${data}[Current Date]
