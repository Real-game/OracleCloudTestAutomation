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
...            Environment Data:  Login User is environment specific, Grade Ladder Group
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC005_Synchronize_Grade_Step_Rates_Upload_updated_salary_records_in_HCM.json
${csv_path}  ./CSV/td_CMP_TC005_Synchronize_Grade_Step_Rates_Upload_updated_salary_records_in_HCM.csv
*** Test Cases ***

Scenario: Synchronize Grade Step Rates - Upload updated salary records in HCM
    [Tags]  CompensationTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    click on homepage
    Log  Step 4-5
    Go To My Client Group
    Click Compensation
    Log  Step 6
    Click on Synchronize Grade Step Rates
    Log  Step 7
    Check Grade Ladder Group from Batch Type
    Log  Step 8
    Under Grade Ladder Group dropdown Select  ${data}[GradeLadderGroup]
    Log  Step 9
    Effective date to remain as current date
    Log  Step 10 - 11
    Click Submit Button
    Log  Step 12
    Click Ok To Confirm
    Wait And Verify Page Contains Text  Manage Scheduled Processes  30s  Monitor Processes page not found
    Log  Step 13
    Sleep  10s
    Verify Progress And Confirm Status for SGSR





