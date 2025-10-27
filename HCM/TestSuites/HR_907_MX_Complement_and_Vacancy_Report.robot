*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  MX_Complement and Vacancy Report
...            Prerequisite:  HR-78 - Create a position
...            Environment Specific Data:  HR Login
...            Reusable Data:  Report Name; Downloaded Report Name; Ref Column Name; Validation Column Name; Validation Value
...            Dynamic Data:  Ref Value(It is getting auto read Position Code from common json file)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_907_MX_Complement_and_Vacancy_Report.json
${csv_path}  ./CSV/td_HR_907_MX_Complement_and_Vacancy_Report.csv
#${pre_req_json_path}    ./TestData/td_HR_02.json
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: MX_Complement and Vacancy Report
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
#    ${pre_req_data}=  readJson  ${pre_req_json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 4
    # Pre-Requisites must trigger before 2 to 5 minutes of starting HR_907_MX_Complement_and_Vacancy_Report execution
#    Sleep  120
    Login Using  ${common_data}[HR Login]
    Log  Step 5 - 7
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 8
    Click Browse Catalog Button
    Log  Step 9 - 15
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand HR Reports
    Select HR-REP-007 - MX_Position Occupancy and Vacancy Report
    Log  Step 16
    Select And Open Report  ${data}[Report Name]
    Excel_Helpers.delete_File  ${data}[Downloaded Report Name]
    Log  Step 17
    Select Aplly Button Frame
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  20s
#***Scenario: Validate single column value***
#    log  Reference Input For Data Validation${\n} Column Name: ${data}[Ref Column Name]${\n} Value: ${common_data}[Position Code]${\n} Report Name: ${data}[Downloaded Report Name]${\n}
#    log  Data To Be Validated${\n} Validation Column: ${data}[Validation Column Name]${\n} Validation Value: ${data}[Validation Value]${\n}
#    ${result}=  validate_single_column_data  ${data}[Ref Column Name]  ${common_data}[Position Code]  ${data}[Validation Column Name]  ${data}[Validation Value]  ${data}[Downloaded Report Name]
#    IF  "${result}"!="Validation Successful"
#        fail  ${result}
#    END

#***Scenario: Validate total report value***
#    @{column_list}=  Create List  Temp Assignment Start Date
    #${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-129_MX_Employee_List_Report  HR-REP-129_MX_Employee_List_Report  ${column_list}  13  13
#    ${flag}=  ExcelReportUtility.compare_excel_all_columns  ${data}[Downloaded Report Name]  ${data}[Downloaded Report Name]  7  7
#    IF  '${flag}'!='True'
#        Fail  Reports are not matching
#    END
#    Log  result is ${flag}