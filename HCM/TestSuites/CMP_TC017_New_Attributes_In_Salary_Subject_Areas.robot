*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot

Documentation  New Attributes In Salary Subject Areas
...            Prerequisite:
...            Environment Specific Data:  Login User
...            Reusable Data:
...            Dynamic Data:

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC017_New_Attributes_In_Salary_Subject_Areas.json
${csv_path}  ./CSV/td_CMP_TC017_New_Attributes_In_Salary_Subject_Areas.csv
*** Test Cases ***

Scenario: CMP-TC017 New Attributes In Salary Subject Areas
    [Tags]  CompensationTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 4
    Login Using  ${data}[Login User]
    Log  Step 5 - 6
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 7
    Click Browse Catalog Button
    Log  Step 8 - 9
    Click on Create and Select an Option  Analysis
    Log  Step 10 - 11
    Click on Salary Details Real Time Link
    Log  Step 12
    Click Grade Ladder Folder
    Log  Step 13
    Add Grade Ladder Column
    Log  Step 14 - 15
    Click on Results Tab