*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/Transfer.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_87.json
${csv_path}  ./CSV/td_HR_87.csv
*** Test Cases ***

Scenario: Quick Actions -Transfer an employee (Retro)

    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Option under Employment Section  ${data}[Group]
    Log  Step 8
    Search And Select Person  ${data}[Employee Number]
    Log  Step 9
    Select Continue
    Log  Step 10 - 11
    Fill The Details In When and Why  ${data}[Transfer Start Date]  ${data}[Reason for Transfer]
    Log  Step 12
    Continue
    Log  Step 13 - 14
    Select Position On Transfer Page  ${data}[Position]
    Log  Step 15
    Submit Details
