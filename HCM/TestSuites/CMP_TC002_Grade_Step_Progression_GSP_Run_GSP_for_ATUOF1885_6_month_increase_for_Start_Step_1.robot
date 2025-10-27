*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/RunGradeStepProgression.robot
Documentation  Comp Admin run GSP for ATUOF 1885
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Grade Ladder and Grade Ladder Group
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC002_Grade_Step_Progression_GSP_Run_GSP_for_ATUOF1885_6_month_increase_for_Start_Step_1.json
${csv_path}  ./CSV/td_CMP_TC002_Grade_Step_Progression_GSP_Run_GSP_for_ATUOF1885_6_month_increase_for_Start_Step_1.csv

*** Test Cases ***
Scenario: Comp Admin run GSP for ATUOF 1885
    [Tags]  CompensationTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
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
    page should not contain  Error
    Log  Step 12
    Click Ok To Confirm
    Wait And Verify Page Contains Text  Manage Scheduled Processes  30s  Monitor Processes page not found
    Log  Step 13
    Sleep  10s
    Verify Progress And Confirm Status