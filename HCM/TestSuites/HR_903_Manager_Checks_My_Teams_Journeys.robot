*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Journeys.robot

Documentation  HR Specialist checks Employee Journeys
...            Prerequisite: HR Specialist checks Employee Journeys
...            Environment Specific Data:  Manager Login
...            Reusable Data: Journeys option
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_903_Manager_Checks_My_Teams_Journeys.json
${csv_path}  ./CSV/td_HR_903_Manager_Checks_My_Teams_Journeys.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR-903 HR Specialist checks Employee Journeys
    [Tags]  CoreHRTestCase  Read-only
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go to my client group Journey
    Log  Step 6
    Select Employee on Journeys    ${common_data}[Employee Login Name]
#    Click on Journeys
    Log  Step 7
#    Click on a Journey Tab  ${data}[Journeys option]
#    Log  Step 8
#    Click on Direct Reports
    Click on Open Journeys tab
    Log  Step 8
    Get MX Cultural Census Task List