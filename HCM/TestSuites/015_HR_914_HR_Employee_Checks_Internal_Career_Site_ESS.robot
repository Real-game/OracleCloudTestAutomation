*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot

Documentation  HR - Employee checks Internal Career Site - ESS
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login
...            Reusable Data:  Not Applicable
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR - Employee checks Internal Career Site - ESS
    [Tags]  CoreHRTestCase  ReadOnly  CoreHR22D
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Me
    Log  Step 6
    Click on Current Jobs
    Log  Step 7
    Click Search button on Current jobs page
    Log  Step 8
    Verify job posted in jobs page

