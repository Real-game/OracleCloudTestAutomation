*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/ProcessWorkforceCompensationChangeStatements.robot
Resource  ../PageObjects/RunGradeStepProgression.robot
Documentation  Workforce Compensation - Standard Functionality - Run Batch Processes - Start Workforce Compensation Cycle
...            Prerequisite:  CMP_TC001_01_Workforce_Compensation_Configuration_Create_New_Plan_Cycle
...            Environment Specific Data:  Login User
...            Reusable Data:  Plan,Cycle,Batch Process
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_10_Workforce_Compensation_Standard_Functionality_Run_Batch_Processes_Start_Workforce_Compensation_Cycle.json
${csv_path}  ./CSV/td_CMP_TC001_10_Workforce_Compensation_Standard_Functionality_Run_Batch_Processes_Start_Workforce_Compensation_Cycle.csv

*** Test Cases ***
Scenario: Workforce Compensation - Standard Functionality - Run Batch Processes - Start Workforce Compensation Cycle
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5 - 6
    Click on Run Batch Processes Reports
    Log  Step 7
    Click On Run Icon Of Given Process  ${data}[Batch Process]
    Log  Step 8
    Select Plan  ${data}[Plan]
    Log  Step 9 - 10
    Select Cycle  ${data}[Cycle]
    Log  Step 11
    Click Submit Button
    Select Warning Button  No
    Log  Step 12
    ${process_id}=  Get And Return Process Id
    Click Ok To Confirm
    Monitor Status Of Given Process Id  ${process_id}