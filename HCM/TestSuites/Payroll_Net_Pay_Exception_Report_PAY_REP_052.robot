*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Library  ../Helpers/ExcelReportUtility.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  MX Payroll Net Pay Exception Report (PAY-REP-052)
...            Prerequiste:  Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data:  Folder Name; Report Name; Job Name
...            Dynamic Data: Pay Period

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_Payroll_Net_Pay_Exception_Report_PAY_REP_052.json
${csv_path}  ./CSV/td_Payroll_Net_Pay_Exception_Report_PAY_REP_052.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: MX Payroll Net Pay Exception Report (PAY-REP-052)
    [Tags]  PayrollReportTestCase
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
    Log  Step 10
    Click Expand Metrolinx Folder
    Log  Step 11
    Click Expand Reports Folder
    Log  Step 12
    Click Expand Payroll Reports Folder
    Log  Step 13
    Click Expand option under the Folder  ${data}[Folder Name]
    Log  Step 14 - 15
    Select More Action On Report  ${data}[Report Name]  Schedule
    Log  Step 16
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Log  Step 17 - 24
    Select Pay Period for Report 052 Run  ${data}[Pay Period]
    Log  Step 25
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Log  Step 26
    Select Notification 052 Report  ${data}[Notification mail]  Notification
    Select Schedule Report Job Tab  Output
    Log  Step 27
    Verify Save Output Check Box
    Log  Step 28
    Select Report Layout as Excel
    Log  Step 29
    Select Schedule Report Job Tab  Schedule
    Log  Step 30
    Verify Run Now Radio Button
    Log  Step 31
    Click Submit Button On Schedule Report Job
    Log  Step 32 - 33
    Set Report Job Name And Click Button  ${data}[Job Name]  OK
    Sleep  10s
    unselect frame
    Log  Step 34
    Click Analytics Home Option
    Log  Step 35 - 36
    Wait And Click Element  link: Report Job History
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
#    Verify Status Of Report Job And Select On Success  ${data}[Job Name]
#    Download Report Of Given Format  EXCEL
    Sleep  20s
    Capture page screenshot

#    ${flag}=  ExcelReportUtility.compare_excel_mine_all_columns  MX_PAYROLL_NET_PAY_EXCEPTION_REPORT  MX_PAYROLL_NET_PAY_EXCEPTION_REPORT  7  7
#    IF  '${flag}'!='True'
#        Fail  Reports are not matching
#    END
#    Log  result is ${flag}