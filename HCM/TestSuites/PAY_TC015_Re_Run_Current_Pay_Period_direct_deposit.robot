*** Settings ***
Library    OperatingSystem
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/FlowSubmission.robot
Resource  ../PageObjects/Payroll.robot
Documentation  Re-Run process of Direect Deposit for current pay period
...            Prerequisite:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Flow Pattern; Start Date; End Date; Payroll; Log Name; Organization Payment Method; Consolidation Group; Task Name
...            Dynamic Data: Payroll Flow should be unique and should not be used in past for each run

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC015_Re_Run_Current_Pay_Period_direct_deposit.json
${csv_path}  ./CSV/td_PAY_TC015_Re_Run_Current_Pay_Period_direct_deposit.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Re-Run process of Direect Deposit for current pay period
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    Log  Step 4-5
    Click on Payroll from Navigator
    Log  Step 6
    Click Submit A Flow
    Log  Step 7
    Select CA Legislative Data Group
    Log  Step 8
    Search And Select Specific Flow Pattern  ${data}[Flow Pattern]
    Log  Step 9
    ${unique_flow_name}=  get_process_name  ${data}[Payroll Flow]
    Set Payroll Flow  ${unique_flow_name}
    Log  Step 10
    Select Organization Payment Method  ${data}[Organization Payment Method]
    Log  Step 11
    Set Process Start Date  ${common_data}[Start Date]
    Log  Step 12
    Set Process End Date  ${common_data}[End Date]
    Log  Step 13
    Select Payroll  ${data}[Payroll]
    Log  Step 14
    Select Consolidation Group  ${data}[Consolidation Group]
    Log  Step 15
    Click Submit Button
    Check Successful Submission Status
    Wait And Verify Page Contains Text  Payroll Checklist  30s  Payroll Checklist page not found
    Log  Step 16
    Verify Process Status  ${data}[Task Name]
    Select Pattern  ${data}[Task Name]
    Log  Step 17
    Expand Output And Log Files
    ${user_home}=    Get Environment Variable    UserProfile
    ${process_id}=    Get Process Id  ${data}[Log Name]
    Download Log File  ${data}[Log Name]  ${process_id}
    ${log_data}=  readLogFile  ${user_home}\\Downloads\\${process_id}.log
    Log To Console  ${log_data}
    should contain  ${log_data}  ${process_id}
