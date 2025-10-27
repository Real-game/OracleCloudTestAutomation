*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/FlowSubmission.robot
Resource  ../PageObjects/PayrollDetail.robot
Resource  ../PageObjects/SubmitPayrollFlow.robot
Resource  ../PageObjects/MonitorProcesses.robot
Library    OperatingSystem

Documentation  Re-run 'Calculate Payroll' by running process - after rollback
...            Prerequisite:  Not Applicable
...            Environment Data:  Login User is environment specific; Legislative Data Group; FLow Pattern; Payroll Flow; Payroll; Payroll Period; Run Type
...            Reusable Data: Not Applicable
...            Dynamic Data: System Environment Variable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC012_Re_Run_Current_Pay_Period_calculate_payroll.json
${csv_path}  ./CSV/td_PAY_TC012_Re_Run_Current_Pay_Period_calculate_payroll.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***

Scenario: Re-run 'Calculate Payroll' by running process - after rollback
    [Tags]  PayrollTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
#    ${payroll_flow}=  get_process_name  ${data}[PayrollFlow]
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    click on homepage
    Log  Step 4-5
    Go To My Client Group
    Click on Payroll
    Click Submit a Flow
    Select Legislative data group as  ${data}[LegislativeDataGroup]
    Enter Flow Pattern Value and search  ${data}[FLowPattern]
    Enter Payroll flow as   ${data}[PayrollFlow]
#    Enter Payroll flow as  ${payroll_flow}
    Select Payroll from dropdown  ${data}[Payroll]
    #Select Payroll Period from dropdown  ${data}[PayrollPeriod]
    Select Payroll Period Value from dropdown  ${data}[PayrollPeriod]
    Select Payroll Relationship Group from dropdown  ${data}[Object Name]
    Select Run Type from dropdown  ${data}[RunType]
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


