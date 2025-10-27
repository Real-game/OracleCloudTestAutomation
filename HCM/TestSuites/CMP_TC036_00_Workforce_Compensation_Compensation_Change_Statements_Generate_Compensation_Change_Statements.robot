*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/ProcessWorkforceCompensationChangeStatements.robot
Resource  ../PageObjects/RunGradeStepProgression.robot

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC036_00_Workforce_Compensation_Compensation_Change_Statements_Generate_Compensation_Change_Statements.json
${csv_path}  ./CSV/td_CMP_TC036_00_Workforce_Compensation_Compensation_Change_Statements_Generate_Compensation_Change_Statements.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Select Plan as 'Pay for performance'
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Log  Step 5
    Click Compensation
    Log  Step 6
    Click on Run Batch Processes Reports
    Log  Step 7
    Click On Run Process Workforce Compensation Change Statements
    Log  Step 8
    Select Plan  ${common_data}[Plan]
    Log  Step 9
    Select Cycle  ${data}[Cycle]
    Log  Step 10
    Select Mode  ${data}[Mode]
    Log  Step 11
    Select Template  ${data}[Template]
    Log  Step 12
    Select Visibility  ${data}[Visibility]
    Log  Step 13
    Click Submit Button
    Log  Step 14
    Click Ok To Confirm
    Log  Step 15
    Monitor Status Of Process  Process Workforce Compensation Change Statements