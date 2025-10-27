*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Resource  ../PageObjects/AnalyticsHomePage.robot
Documentation  Mandatory Vaccination Reports (Admin and MSS)
...            Prerequisite:  Data setup test cases DC08
...            Environment Specific Data:  HR Login; Manager Login
...            Reusable Data:  Folder Name; Report Name1; Report Name2
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_909_Mandatory_Vaccination_Reports_Admin_and_MSS.json
${csv_path}  ./CSV/td_HR_909_Mandatory_Vaccination_Reports_Admin_and_MSS.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Mandatory Vaccination Reports (Admin and MSS)
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
    Select Folder  ${data}[Folder Name]
    Log  Step 16
    Select And Open Report  ${data}[Report Name1]
    Log  Step 17
    Select Aplly Button Frame
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  7s
    unselect frame
    Log  Step 18 - 19

#*** Scenario: Validate for Single Person data***

#    log  Reference Input For Data Validation${\n} Column Name: Person Number${\n} Value: ${data}[Person Number]${\n} Report Name: ${data}[Downloaded Report Name]${\n}
#    log  Data To Be Validated${\n} Validation Column: Vaccination Status${\n} Validation Value: ${data}[Vaccination Status]${\n}
#    ${result}=  validate_single_column_data  Person Number  ${data}[Person Number]  Vaccination Status  ${data}[Vaccination Status]  ${data}[Downloaded Report Name]
#    IF  "${result}"!="Validation Successful"
#        fail  ${result}
#    END
#    Log  Step 20
#    switch window  Reports and Analytics - Oracle Fusion Cloud Applications
#    Logout
#    Login Using  ${common_data}[Manager Login]
#    click on homepage
#    Go To My Team
#    Select MX Mandatory Vaccination Report
#    Sleep  10s
#    ${status}=  Run Keyword and Return Status  switch window  MX_Mandatory_Vaccination_Report - Oracle Analytics Publisher
#    IF  '${status}'!='True'
#        Select MX Mandatory Vaccination Report
#        Sleep  20s
#        ${status1}=  Run Keyword and Return Status  switch window  MX_Mandatory_Vaccination_Report - Oracle Analytics Publisher
#        IF  '${status1}'!='True'
#            Select MX Mandatory Vaccination Report
#            Sleep  20s
#            switch window  MX_Mandatory_Vaccination_Report - Oracle Analytics Publisher
#        END
#    END
#    Select Aplly Button Frame
#    Sleep  5s
#    Click Apply Button
#    Select Report Or Data Frame
#    Sleep  8s
#    Log  Step 22
#    page should not contain  ${data}[Person Name]

#***Scenario: Validate total report value***

#    @{column_list}=  Create List  Temp Assignment Start Date
    #${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-129_MX_Employee_List_Report  HR-REP-129_MX_Employee_List_Report  ${column_list}  13  13
    ${flag}=  ExcelReportUtility.compare_excel_all_columns  ${data}[Downloaded Report Name]  ${data}[Downloaded Report Name]  6  6
    IF  '${flag}'!='True'
        Fail  Reports are not matching
    END
    Log  result is ${flag}