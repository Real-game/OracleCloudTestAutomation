*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Employee deletes a Performance Goal
...            Prerequisite:  TC12_Manager_Creates_Performance_Goals.robot
...            Environment Specific Data:  Login User
...            Reusable Data:  Not Applicable
...            Dynamic Data: FY Year, Goal Name

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC17_Employee_Delete_Performance_Goals.json
${csv_path}  ./CSV/td_TC17_Employee_Delete_Performance_Goals.csv

*** Test Cases ***
Scenario: Employee deletes a Performance Goal
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click Career And Performance
    Log  Step 5
    Click Performance
    Log  Step 6
    Click On Current Financial Year Goal Plan  ${data}[FY Year]
    Log  Step 7
    Click Performance Goals
    Log  Step 8-9
    Delete Goal  ${data}[Goal Name]
    Log  Step 10
    Select Warning Yes Button
    Sleep  5s
    Log  Step 11
    page should not contain  ${data}[Goal Name]