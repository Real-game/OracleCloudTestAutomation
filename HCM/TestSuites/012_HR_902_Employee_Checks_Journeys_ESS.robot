*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Journeys.robot

Documentation  Employee Checks Journeys
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login
...            Reusable Data:  Journey Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_902_Employee_Checks_Journeys_ESS.json
${csv_path}  ./CSV/td_HR_902_Employee_Checks_Journeys_ESS.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Employee Checks Journeys ESS
    [Tags]  CoreHRTestCase  ModifyData  CoreHR22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Me
    Log  Step 6-7
    Click on Journeys in Home Page
    Log  Step 8
    Click on Open Journeys tab
    Log  Step 9
    Click on Journey  ${data}[Journeys Name]
    Log  Step 10
    Verify task status
