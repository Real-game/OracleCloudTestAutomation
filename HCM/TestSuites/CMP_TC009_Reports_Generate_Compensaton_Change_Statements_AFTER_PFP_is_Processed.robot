*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/AdministrationReports.robot
Resource  ../PageObjects/GenerateRealTimeStatements.robot

Documentation  Administrative Report showing comp change Statements
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Manager Login(Compensation_common_test_data.csv)
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC009_Reports_Generate_Compensaton_Change_Statements_AFTER_PFP_is_Processed.json
${csv_path}  ./CSV/td_CMP_TC009_Reports_Generate_Compensaton_Change_Statements_AFTER_PFP_is_Processed.csv
${common_json_path}  ./TestData/Compensation_common_test_data.json
${common_csv_path}  ./CSV/Compensation_common_test_data.csv

*** Test Cases ***
Scenario: Administrative Report showing comp change Statements
    [Tags]  CompensationTestCase  ReadOnly
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Log  Step 5
    Click Compensation
    Log  Step 6
    Click on View Administrative Reports
    Log  Step 7
    Select Compensation Plan Cycle as  ${data}[CompensationPlanCycle]
    Log  Step 8
    Click on Generate Real Time Statements
    Log  Step 9
    Select Manager as  ${data}[Manager]
    Log  Step 10
    Select Template from dropdown  ${data}[Templates]
    Log  Step 11
    Click Generate Real Time Statements Button
    Log  Step 12
    Click OK button for Confirmation
    Click OK button for Job ID Confirmation



