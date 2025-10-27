*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Library  ../Helpers/ExcelReportUtility.py


Documentation  Download Staff List BI Report
...            Prerequisite:  HR81 - Create an employee record
...            Environment Specific Data:  HR Login
...            Reusable Data:  Report Name
...            Dynamic Data:  Employee Number

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_913_Staff_List_BI.json
${csv_path}  ./CSV/td_HR_913_Staff_List_BI.csv
${common_json_path}  ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR-913 Staff List BI
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 4
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
    Select Folder  ${data}[Folder Name]
    Log  Step 16
    Select And Open Report  ${data}[Report Name]
    Log  Step 17
    #Delete existing report
    Excel_Helpers.delete_File  HR-REP-129_MX_Employee_List_Employee_Assignment_Table
    Select Aplly Button Frame
    Sleep  15s
    Click Apply Button
    Verify Report Completed Message
    Sleep  20s
#***Scenario: Validate single report value***
#    Validate Employee Number in StaffList BI Report  HR-REP-129_MX_Employee_List_Employee_Assignment_Table  Employee Number  Employee Number  ${data}[Employee Number]

#***Scenario: Validate total report value***

#    @{column_list}=  Create List  Temp Assignment Start Date
#    ${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-129_MX_Employee_List_Report  HR-REP-129_MX_Employee_List_Report  ${column_list}  13  13
#    ${flag}=  ExcelReportUtility.compare_excel_all_columns  HR-REP-129_MX_Employee_List_Employee_Assignment_Table  HR-REP-129_MX_Employee_List_Employee_Assignment_Table  13  13
#    IF  '${flag}'!='True'
#        Fail  Reports are not matching
#    END
#    Log  result is ${flag}