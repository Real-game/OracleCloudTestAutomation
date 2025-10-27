*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/ProcessWorkforceCompensationChangeStatements.robot
Resource  ../PageObjects/RunGradeStepProgression.robot
Documentation  Workforce Compensation - Standard Functionality - Run Batch Processes - Back Out Workforce Compensation Data
...            Prerequisite:  CMP_TC001.10
...            Environment Specific Data:  Login User
...            Reusable Data:  Plan,Cycle,Batch Process, Back Out Level
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_13_Workforce_Compensation_Standard_Functionality_Run_Batch_Processes_Back_Out_Workforce_Compensation_Data.json
${csv_path}  ./CSV/td_CMP_TC001_13_Workforce_Compensation_Standard_Functionality_Run_Batch_Processes_Back_Out_Workforce_Compensation_Data.csv

*** Test Cases ***
Scenario: Workforce Compensation - Standard Functionality - Run Batch Processes - Back Out Workforce Compensation Data
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
    Log  Step 9
    Select Cycle  ${data}[Cycle]
    Log  Step 10
    Select Back Out Level  ${data}[Back Out Level]
    Log  Step 11
    Click Submit Button
    Select Warning Button  No
    Log  Step 12 - 13
    ${process_id}=  Get And Return Process Id
    Click Ok To Confirm
    Log  Step 14 - 15
    Monitor Status Of Given Process Id  ${process_id}