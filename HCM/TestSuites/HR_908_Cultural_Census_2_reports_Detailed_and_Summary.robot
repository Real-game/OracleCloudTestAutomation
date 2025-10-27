*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Resource  ../PageObjects/AnalyticsHomePage.robot
Documentation  Cultural Census (2 reports - Detailed and Summary)
...            Prerequisite:  SME Intervention Needed to provide document type
...            Environment Specific Data:  HR Login
...            Reusable Data:  Folder Name; Report Name1; Report Name2; Job Name1; Job Name2
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_908_Cultural_Census_2_reports_Detailed_and_Summary.json
${csv_path}  ./CSV/td_HR_908_Cultural_Census_2_reports_Detailed_and_Summary.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Cultural Census (2 reports - Detailed and Summary)
    [Tags]  CoreHRTestCase  ReadOnly  DryRun
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
    Select More Action On Report  ${data}[Report Name1]  Schedule
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Select Schedule Report Job Tab  Output
    Verify Save Output Check Box
    Select Schedule Report Job Tab  Schedule
    Verify Run Now Radio Button
    Click Submit Button On Schedule Report Job
    Set Report Job Name And Click Button  ${data}[Job Name1]  OK
    Sleep  10s
    unselect frame
    Log  Step 18 - 19
#    Click On Catalog Link
#    Select More Action On Report  ${data}[Report Name2]  Schedule
#    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
#    Select Schedule Report Job Tab  Output
#    Verify Save Output Check Box
#    Select Schedule Report Job Tab  Schedule
#    Verify Run Now Radio Button
#    Click Submit Button On Schedule Report Job
#    Set Report Job Name And Click Button  ${data}[Job Name2]  OK
#    Sleep  10s
#    unselect frame
    Click Analytics Home Option
    Wait And Click Element  link: Report Job History
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Verify Status Of Report Job And Select On Success  ${data}[Job Name1]
    Download Report Of Given Format  EXCEL
    UNSELECT FRAME
    Sleep  3s
#    Click Analytics Home Option
#    Wait And Click Element  link: Report Job History
#    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
#    Verify Status Of Report Job And Select On Success  ${data}[Job Name2]
#    Download Report Of Given Format  EXCEL
#    Sleep  20s
#***Scenario: Validate All Value in First Report***
#    @{column_list}=  Create List  Temp Assignment Start Date
    #${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-129_MX_Employee_List_Report  HR-REP-129_MX_Employee_List_Report  ${column_list}  13  13
    ${flag}=  ExcelReportUtility.compare_excel_all_columns  ${data}[Report Name1]  ${data}[Report Name1]  8  8
    IF  '${flag}'!='True'
        Fail   ${data}[Report Name1] are not matching
    END
    Log  result is ${flag}

#***Scenario: Validate All Value in Second Report***
#    @{column_list}=  Create List  Temp Assignment Start Date
    #${flag}=  ExcelReportUtility.compare_excel_skip_columns  HR-REP-129_MX_Employee_List_Report  HR-REP-129_MX_Employee_List_Report  ${column_list}  13  13
    ${flag}=  ExcelReportUtility.compare_excel_all_columns  ${data}[Report Name2]  ${data}[Report Name2]  8  8
    IF  '${flag}'!='True'
        Fail  Reports 2 are not matching
    END
    Log  result is ${flag}
