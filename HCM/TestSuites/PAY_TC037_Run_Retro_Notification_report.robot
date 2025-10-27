*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PayrollDetail.robot
Resource  ../PageObjects/FlowSubmission.robot
Resource  ../PageObjects/SubmitPayrollFlow.robot
Resource  ../PageObjects/MonitorProcesses.robot
Library    OperatingSystem

Documentation  Run Retro Notification report
...            Prerequisite:  Not Applicable
...            Environment Data:  Login User is environment specific, Legislative Data Group, FLow Pattern, Payroll Flow, Process Date
...            Reusable Data: Not Applicable
...            Dynamic Data: System Environment Variable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC037_Run_Retro_Notification_report.json
${csv_path}  ./CSV/td_PAY_TC037_Run_Retro_Notification_report.csv
*** Test Cases ***

Scenario: Run Retro Notification report
    [Tags]  PayrollTestCase  Read Only
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    ${payroll_flow}=  get_process_name  ${data}[PayrollFlow]
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    click on homepage
    Log  Step 4-5
    Go To My Client Group
    Click on Payroll
    Click Submit a Flow
    Select Legislative data group as  ${data}[LegislativeDataGroup]
    Enter Flow Pattern Value and search  ${data}[FLowPattern]
    Enter Payroll flow as  ${payroll_flow}
    Enter Process Date as  ${data}[ProcessDate]
    Select Payroll from dropdown  ${data}[Payroll]
    Click on Submit
    Click refresh untill process status is completed  ${data}[FLowPattern]
    Wait And Click Element  xpath: //span[text()="${data}[FLowPattern]"]
    Expand Output And Log Files
    ${user_home}=    Get Environment Variable    UserProfile
    ${process_id}=    Get Process Id  ${data}[Log Name]
    Download Log File  ${data}[Log Name]  ${process_id}
    ${log_data}=  readLogFile  ${user_home}\\Downloads\\${process_id}.log
    Log To Console  ${log_data}
    should contain  ${log_data}  ${data}[FLowPattern]
