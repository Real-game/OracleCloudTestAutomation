*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/SynchronizeGradeStepRates.robot
Resource  ../PageObjects/MonitorProcesses.robot
Documentation  Compensation Admin able to run Synchronize Grade Step Rates Process
...            Prerequisite:  Not applicable
...            Environment Specific Data:  HR Specialist Login(Compensation_common_test_data.csv)
...            Reusable Data:  Grade Ladder Group(Compensation_common_test_data.csv)
...            Dynamic Data:  None

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${common_json_path}  ./TestData/Compensation_common_test_data.json
${common_csv_path}  ./CSV/Compensation_common_test_data.csv

*** Test Cases ***
Scenario: Synchronize Grade Step Rates Process
    [Tags]  CompensationTestCase  ReadOnly
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    click on homepage
    Log  Step 4-5
    Go To My Client Group
    Click Compensation
    Log  Step 6
    Click on Synchronize Grade Step Rates
    Log  Step 7
    Check Grade Ladder Group from Batch Type
    Log  Step 8
    Under Grade Ladder Group dropdown Select  ${common_data}[Grade Ladder Group]
    Log  Step 9
    Effective date to remain as current date
    Log  Step 10
    Verify active checkbox is enabled
    Verify Suspended checkbox is disabled
    Log  Step 11
    Click Submit Button
    Log  Step 12
    Click Ok To Confirm
    Wait And Verify Page Contains Text  Manage Scheduled Processes  30s  Monitor Processes page not found
    Log  Step 13
    Verify Progress And Confirm Status for SGSR





