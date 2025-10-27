*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Sick Absence Report
...            Prerequiste:  ABS_TC005
...            Environment Specific Data:  HR Login
...            Reusable Data:  Folder Name; Report Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_911_Sick_Absence_Report.json
${csv_path}  ./CSV/td_HR_911_Sick_Absence_Report.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Sick Absence Report
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Tools
    Log  Step 6
    Click Reports and Analytics
    Log  Step 7
    Click Browse Catalog Button
    Log  Step 8
    Click Shared Folder
    Log  Step 9
    Click Expand Custom Folder
    Log  Step 10 - 11
    Click Expand Metrolinx Folder
    Log  Step 12
    Click Expand Reports Folder
    Log  Step 13
    Click Expand Absence Reports Folder
    Log  Step 14
    Click Expand option under the Folder  ${data}[Folder Name]
    Log  Step 15
    Select More Action On Report  ${data}[Report Name]  Schedule
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Select Schedule Report Job Tab  Output
    Verify Save Output Check Box
    Select Schedule Report Job Tab  Schedule
    Verify Run Now Radio Button
    Click Submit Button On Schedule Report Job
    Set Report Job Name And Click Button  ${data}[Job Name]  OK
    Sleep  10s
    unselect frame
    Click Analytics Home Option
    Wait And Click Element  link: Report Job History
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Verify Status Of Report Job And Select On Success  ${data}[Job Name]
    Download Report Of Given Format  EXCEL
    Sleep  20s

#***Scenario: Validate total report value***

    #    @{column_list}=  Create List  Temp Assignment Start Date
    #${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  ${column_list}  10  10
    ${flag}=  ExcelReportUtility.compare_excel_all_columns  ${data}[Report Name]  ${data}[Report Name]  10  10
    IF  '${flag}'!='True'
        Fail  Reports are not matching
    END
    Log  result is ${flag}