*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Journeys.robot

Library           Collections
Library           OperatingSystem

Documentation  HR Specialist checks Person's Journey Tasks
...            Prerequisite: Not Applicable
...            Environment Specific Data:  HR Specialist Login, Employee Login Name
...            Reusable Data: Task Name
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${csv_path}  ./CSV/HR_Specialist_Check_Person_Journey_Tasks.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR Specialist checks Person's Journey Tasks
    Set Log Level    NONE
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    ${matched}    ${missing}    ${unexpected}    Login and Select Employee from Journeys   ${common_data}    ${csv_path}

    Log     \n Matched Tasks: ${matched}
    Log     \n Missing Tasks: ${missing}
    Log     \n️ Unexpected Tasks: ${unexpected}

    # 5. Fail test if any task is missing
    Should Be Empty    ${missing}    Custom message: Some expected tasks are missing: ${missing}
