*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_TC_107.json
${csv_path}  ./CSV/td_HR_TC_107.csv
*** Test Cases ***

Scenario: HR Specialist update contact relationship start date when hire date is changed
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go to my client groups show more
    Log  Step 6
    Click Contact Info Under Employment Section
    Log  Step 7 - 8
    Search for a person  ${data}[Person Number]
    Log  Step 9
    Click Adderess Edit Icon
    Select Start Date  ${data}[Start Date]
    Click Submit
    Log  Step 10
    click on homepage