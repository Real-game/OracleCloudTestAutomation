*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/DocumentRecords.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_29.json
${csv_path}  ./CSV/td_HR_29.csv
*** Test Cases ***

Scenario: Employee updates views Document Records
    [Tags]   CoreHRTestCase
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click On Personal Information
    Log  Step 5
    Click My Documents
    View Document Types  T4 Original
    Sleep  25s