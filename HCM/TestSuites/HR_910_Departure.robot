*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot

Documentation  Download Departure Report
...            Prerequisite:  Data Creation DC09
...            Environment Specific Data:  HR Login
...            Reusable Data:  Report Name
...            Dynamic Data:  Terminated Employee Number

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_910_Departure.json
${csv_path}  ./CSV/td_HR_910_Departure.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR-910 Departure Report
    [Tags]  CoreHRTestCase  ReadOnly  ReportDemo
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
    Select HR-REP-134_MX Departures Report
    Log  Step 16
    Select And Open Report  ${data}[Report Name]
    Log  Step 17
    Set Termination Start and End Date  ${data}[Termination Start Date]    ${data}[Termination End Date]
    Log  Step 18
    #Delete existing report
    Excel_Helpers.delete_File  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  20s

#***Scenario: Validate fro Single Employee data***
#    Validate Employee Number in Departure Report  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  Employee Number  Employee Number  ${data}[Employee Number]

#***Scenario: Validate total report value***

    #    @{column_list}=  Create List  Temp Assignment Start Date
    #${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  ${column_list}  10  10
    ${flag}=  ExcelReportUtility.compare_excel_all_columns  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  10  10
    IF  '${flag}'!='True'
        Fail  Reports are not matching
    END
    Log  result is ${flag}