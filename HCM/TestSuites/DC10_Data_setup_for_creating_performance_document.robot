*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/PerformanceTemplates.robot
Documentation  Data setup for creating performance document
...            Prerequisite:  Not Applicable
...            Environment Data:  Login User
...            Reusable Data:  Role1; Employee Questionnaires; Role2; Manager Questionnaires
...            Dynamic Data: Document Period Name; Review Period; Short Name and Document Template(Depend on your requirement)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC10_Data_setup_for_creating_performance_document.json
${csv_path}  ./CSV/td_DC10_Data_setup_for_creating_performance_document.csv
#New Annual PMP - Senior Managers (FY23-24 Onwards)
#MX Mid-Year Check-In 2023 Onwards
*** Test Cases ***
Scenario: Data setup for creating performance document
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 6
    click on homepage
    Go To My Client Group
    Click On Performance
    Log  Step 7 - 9
    Click on Performance Templates link
    Select Performance Template  ${data}[Document Template]
    Log  Step 10
    Wait And Click Element  link: Document Periods
    Sleep  3s
    Log  Step 11 - 13
    Click Add Icon In Document Periods
    Add Document Period Name  ${data}[Document Period Name]
    Add Document Review Period  ${data}[Review Period]
    Add Document Period Short Name  ${data}[Short Name]
#    IF  "${data}[Document Template]"=="MX Mid-Year Check-In NEW"
    IF  "${data}[Document Template]"=="MX Mid-Year Check-In 2023 Onwards"
        Log  Step 14 - 17
        Click Add Icon In Questionnaires For The Period
        Add Role In Questionnaires  ${data}[Role1]
        Add Questionnaires  ${data}[Employee Questionnaires]
        Log  Step 18 - 20
        Click Add Icon In Questionnaires For The Period
        Add Role In Questionnaires  ${data}[Role2]
        Add Questionnaires  ${data}[Manager Questionnaires]
        Log  Step 21
    END
    Click Save And Close Performance Template
    Sleep    5s
    wait until page does not contain  Error  10s  Error Displayed

