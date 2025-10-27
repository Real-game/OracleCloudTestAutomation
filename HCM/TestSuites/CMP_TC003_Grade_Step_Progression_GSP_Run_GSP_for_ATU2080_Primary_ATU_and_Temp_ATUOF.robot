*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/RunGradeStepProgression.robot
Documentation  Grade Step Progression (GSP) - Run GSP for ATU2080 (Primary ATU and Temp ATUOF)
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data: Grade Ladder and Grade Ladder Group
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC003_Grade_Step_Progression_GSP_Run_GSP_for_ATU2080_Primary_ATU_and_Temp_ATUOF.json
${csv_path}  ./CSV/td_CMP_TC003_Grade_Step_Progression_GSP_Run_GSP_for_ATU2080_Primary_ATU_and_Temp_ATUOF.csv
*** Test Cases ***

Scenario: Grade Step Progression (GSP) - Run GSP for ATU2080 (Primary ATU and Temp ATUOF)
    [Tags]  CompensationTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 5
    click on homepage
    Go To My Client Group
    Log  Step 5
    Click Compensation
    Log  Step 6
    Click Run Grade Step Progression
    Log  Step 7
    Select Grade Ladder Menu  ${data}[Grade Ladder]
    Log  Step 8
    Check Grade Ladder Group Radio Button
    Log  Step 9
    Select Grade Ladder Group Menu  ${data}[Grade Ladder Group]
    Log  Step 10 - 11
    Click Submit Button
    Log  Step 12
    ${process_id}=  Get And Return Process Id
    Click Ok To Confirm
    Wait And Verify Page Contains Text  Manage Scheduled Processes  30s  Monitor Processes page not found
    Log  Step 13
    Sleep  10s
    Monitor Status Of Given Process Id  ${process_id}
