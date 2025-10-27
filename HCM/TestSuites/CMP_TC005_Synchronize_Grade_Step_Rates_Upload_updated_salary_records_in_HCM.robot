*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/SynchronizeGradeStepRates.robot
Resource  ../PageObjects/MonitorProcesses.robot

Documentation  Synchronize Grade Step Rates - Upload updated salary records in HCM
...            Prerequisite:  No Data Dependency
...            Environment Data:  HR Specialist Login(Compensation_common_test_data.csv); Grade Ladder Group(Compensation_common_test_data.csv)
...            Reusable Data: Compensation Process Effective Date
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC005_Synchronize_Grade_Step_Rates_Upload_updated_salary_records_in_HCM.json
${csv_path}  ./CSV/td_CMP_TC005_Synchronize_Grade_Step_Rates_Upload_updated_salary_records_in_HCM.csv
${common_json_path}  ./TestData/Compensation_common_test_data.json
${common_csv_path}  ./CSV/Compensation_common_test_data.csv

*** Test Cases ***
Scenario: Synchronize Grade Step Rates - Upload updated salary records in HCM
    [Tags]  CompensationTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
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
    Set Effective Date in Synchronize Grade Step Rates  ${data}[Compensation Process Effective Date]
    Log  Step 10 - 11
    Click Submit Button
    Log  Step 12
    Click Ok To Confirm
    Wait And Verify Page Contains Text  Manage Scheduled Processes  30s  Monitor Processes page not found
    Log  Step 13
    Sleep  10s
    Verify Progress And Confirm Status for SGSR





