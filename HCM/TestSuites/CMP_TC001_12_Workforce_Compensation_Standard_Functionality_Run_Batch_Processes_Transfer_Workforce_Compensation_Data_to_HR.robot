*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/MonitorProcesses.robot
Resource  ../PageObjects/ProcessWorkforceCompensationChangeStatements.robot
Resource  ../PageObjects/RunGradeStepProgression.robot
Resource  ../PageObjects/Payroll.robot
Documentation  Workforce Compensation - Standard Functionality - Run Batch Processes - Transfer Workforce Compensation Data to HR
...            Prerequisite:  CMP_TC001.10
...            Environment Specific Data:  Manager Login(PFP_common_test_data.csv)
...            Reusable Data:  Plan(PFP_common_test_data.csv);Cycle(PFP_common_test_data.csv);Batch Process;Radio Button;Action;Action Reason;Element Posting Date;Mark Assignments as Processed
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_12_Workforce_Compensation_Standard_Functionality_Run_Batch_Processes_Transfer_Workforce_Compensation_Data_to_HR.json
${csv_path}  ./CSV/td_CMP_TC001_12_Workforce_Compensation_Standard_Functionality_Run_Batch_Processes_Transfer_Workforce_Compensation_Data_to_HR.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Workforce Compensation - Standard Functionality - Run Batch Processes - Transfer Workforce Compensation Data to HR
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5 - 6
    Click on Run Batch Processes Reports
    Log  Step 7
    Click On Run Icon Of Given Process  ${data}[Batch Process]
    Log  Step 8 - 9
    Select Radio Button On Plan Details  ${data}[Radio Button]
    Log  Step 10
    Select Plan  ${common_data}[Plan]
    Log  Step 11
    Select Cycle  ${common_data}[Cycle_plan]
    Log  Step 12
    Select Action Value  ${data}[Action]
    Log  Step 13
    Select Action Reason Value  ${data}[Action Reason]
    Log  Step 14
    Click Next Button
    Wait And Verify Page Contains Text  Element Details  20s  Element Details page not found
    Log  Step 15
    Select Element Posting Date  ${data}[Element Posting Date]
    Log  Step 16
    Click Next Button
    Wait And Verify Page Contains Text  Salary Details  20s  Salary Details page not found
    Log  Step 17
    Select Element Posting Date  ${data}[Element Posting Date]
    Log  Step 18
    Click Next Button
    Wait And Verify Page Contains Text  Stock Details  20s  Stock Details page not found
    Log  Step 19
    Click Next Button
    Wait And Verify Page Contains Text  Promotion Details  20s  Promotion Details page not found
    Log  Step 20
    Click Next Button
    Wait And Verify Page Contains Text  Other Details  20s  Other Details page not found
    Log  Step 21
    Select Mark Assignment As Processed  ${data}[Mark Assignments as Processed]
    Verify Pop Up And Click Ok Button
    Log  Step 22
    Click Next Button
    Wait And Verify Page Contains Text  Submit Process  20s  Submit Process page not found
    Log  Step 23
    Click Submit Button
    Select Warning Button  No
    ${process_id}=  Get And Return Process Id
    Click Ok To Confirm
    Log  Step 24
#    Click Monitor Process Button
    Monitor Status Of Given Process Id  ${process_id}
    click on homepage
    Sleep  3s
    Click on Payroll Calculation under Payroll via Navigator
    Click Search Person on Left Side Panel
    Enter Person number and search in Keywords field  ${data}[Person Number]
    Sleep  3s
    Wait And Click Element  xpath: //button[@title="Actions"]
    Wait And Click Element  xpath: //td[text()="Element Entries"]
    Sleep  5s
    Capture Page Screenshot And Retry If Required
    Sleep  5s
