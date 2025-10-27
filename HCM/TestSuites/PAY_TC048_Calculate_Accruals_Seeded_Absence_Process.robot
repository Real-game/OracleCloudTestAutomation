*** Settings ***
Library    OperatingSystem
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Payroll.robot
Resource  ../PageObjects/FlowSubmission.robot
Documentation  Calculate Payroll
...            Prerequisite:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Flow Pattern, Todays Date, Payroll, Log Name
...            Dynamic Data: Payroll Flow should be unique and should not be used in past for each run

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC048_Calculate_Accruals_Seeded_Absence_Process.json
${csv_path}  ./CSV/td_PAY_TC048_Calculate_Accruals_Seeded_Absence_Process.csv

*** Test Cases ***
Scenario: Submit flow for 'Calculate Accruals'
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    ${payroll_flow}=  get_process_name  ${data}[Payroll Flow]
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4-5
    Click on Payroll from Navigator
    Log  Step 6
    Click Submit A Flow
    Log  Step 7
    Select CA Legislative Data Group
    Log  Step 8
    Search And Select Specific Flow Pattern  ${data}[Flow Pattern]
    Log  Step 9
    Set Payroll Flow  ${payroll_flow}
    Log  Step 10
    Set Effective Date  ${data}[Todays Date]
    Log  Step 11
    #Input Person Number  ${data}[Person Number]
    Select Payroll  ${data}[Payroll]
    Log  Step 12
    Click Submit Button
    Check Successful Submission Status
    Wait And Verify Page Contains Text  Payroll Checklist  30s  Payroll Checklist page not found
    Log  Step 13
    Verify Process Status  ${data}[Flow Pattern]
    Select Pattern  ${data}[Flow Pattern]
    Log  Step 14
    Expand Output And Log Files
    ${user_home}=    Get Environment Variable    UserProfile
    ${process_id}=    Get Process Id  ${data}[Log Name]
    Download Log File  ${data}[Log Name]  ${process_id}
    ${log_data}=  readLogFile  ${user_home}\\Downloads\\${process_id}.log
    Log To Console  ${log_data}
    should contain  ${log_data}  ${data}[Flow Pattern]