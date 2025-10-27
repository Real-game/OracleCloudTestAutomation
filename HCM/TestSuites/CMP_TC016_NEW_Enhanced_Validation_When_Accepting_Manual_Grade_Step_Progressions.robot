*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/RunGradeStepProgression.robot
Documentation  NEW Enhanced Validation when Accepting Manual Grade Step Progressions
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Specialist Login(Compensation_common_test_data.csv)
...            Reusable Data:  Grade Ladder; Grade Ladder Group
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${common_json_path}  ./TestData/Compensation_common_test_data.json
${common_csv_path}  ./CSV/Compensation_common_test_data.csv

*** Test Cases ***
Scenario: NEW Enhanced Validation when Accepting Manual Grade Step Progressions
    [Tags]  CompensationTestCase  ReadOnly
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Log  Step 5
    Click Compensation
    Log  Step 6
    Click Run Grade Step Progression
    Log  Step 7
    Verify Presence of Actions and Action Reasons Section