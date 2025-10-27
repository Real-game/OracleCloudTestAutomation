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

Documentation  Run Payroll Activity Report for Current Pay Period
...            Prerequisite:  Not Applicable
...            Environment Data:  Login User is environment specific, Legislative Data Group,FLow Pattern,Payroll Flow,Start Date,End Date,Scope,Report Category,Log Name and Estimated Time
...            Reusable Data: Not Applicable
...            Dynamic Data: System Environment Variable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC002_Run_Payroll_Activity_Report_For_Current_Pay_Period.json
${csv_path}  ./CSV/td_PAY_TC002_Run_Payroll_Activity_Report_For_Current_Pay_Period.csv
*** Test Cases ***

Scenario: Run Payroll Activity Report for Current Pay Period
    [Tags]  PayrollTestCase  ReadOnly
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    ${updatedProcessName}=  get_process_name  ${data}[PayrollFlow]
    Log To Console  Process Name is ${updatedProcessName}
    click on homepage
    Log  Step 4-5
    Click on Payroll from Navigator
    Click Submit a Flow
    Select Legislative data group as  ${data}[LegislativeDataGroup]
    Enter Flow Pattern Value and search  ${data}[FLowPattern]
    Enter Payroll flow as  ${updatedProcessName}
    Enter Process Start Date  ${data}[StartDate]
    Enter Process End Date  ${data}[EndDate]
    Select Scope from dropdown  ${data}[Scope]
    Select Report Category from dropdown  ${data}[ReportCategory]
    Click on Submit
    select refresh untill process status is completed  ${data}[FLowPattern]  ${data}[EstimatedTime]
    Wait And Click Element  xpath: //span[text()="${data}[FLowPattern]"]
    Wait And Verify Page Contains Text  Run Payroll Activity Report - Report  40s  Run Payroll Activity Report - Report Page is not loaded
    Sleep  5s
    Expand the Output And Log Files
    ${user_home}=    Get Environment Variable    UserProfile
    ${process_id}=    Get Process Id  ${data}[Log Name]
    Download Log File  ${data}[Log Name]  ${process_id}
    ${log_data}=  readLogFile  ${user_home}\\Downloads\\${process_id}.log
    Log To Console  ${log_data}
    should contain  ${log_data}  ${data}[FLowPattern]

