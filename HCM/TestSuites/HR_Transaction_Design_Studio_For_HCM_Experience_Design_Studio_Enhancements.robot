*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/HireAnEmployeeActions.robot
Documentation  Transaction Design Studio For HCM Experience Design Studio Enhancements
...            Prerequisite: Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data: Hire an Employee Option1; Hire an Employee Option2
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_Transaction_Design_Studio_For_HCM_Experience_Design_Studio_Enhancements.json
${csv_path}  ./CSV/td_HR_Transaction_Design_Studio_For_HCM_Experience_Design_Studio_Enhancements.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Transaction Design Studio For HCM Experience Design Studio Enhancements
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click on Hire An Employee
    Log  Step 8
    Verify Hire an Employee page has option  ${data}[Hire an Employee Option1]
    Log  Step 9
    Verify Hire an Employee page has option  ${data}[Hire an Employee Option2]
    Log  Step 10
    click on homepage
    Log  Step 11
    Verify Page throws Warning
    Log  Step 12
    Logout