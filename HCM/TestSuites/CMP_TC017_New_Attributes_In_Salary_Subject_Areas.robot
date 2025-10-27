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
...            Environment Specific Data:  HR Specialist Login(Compensation_common_test_data.csv)
...            Reusable Data: NA
...            Dynamic Data: NA

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC017_New_Attributes_In_Salary_Subject_Areas.json
${csv_path}  ./CSV/td_CMP_TC017_New_Attributes_In_Salary_Subject_Areas.csv
${common_json_path}  ./TestData/Compensation_common_test_data.json
${common_csv_path}  ./CSV/Compensation_common_test_data.csv

*** Test Cases ***
Scenario: CMP-TC017 New Attributes In Salary Subject Areas
    [Tags]  CompensationTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 4
    Login Using  ${common_data}[HR Specialist Login]
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