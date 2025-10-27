*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Quick Actions - Edit Seniority Dates
...            Prerequisite:  HR-84 or Rehire Person Name from ORC
...            Environment Specific Data: HR Login; Employee Name
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_91_Quick_Actions_Edit_Seniority_Dates.json
${csv_path}  ./CSV/td_HR_91_Quick_Actions_Edit_Seniority_Dates.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Quick Actions - Edit Seniority Dates
    [Tags]  CoreHRTestCase  ModifyData
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
    Click on Seniority Dates
    Log  Step 8
    Search for a person  ${data}[Employee Name]
    Log  Step 9
    Select Recalculate Seniority Dates
