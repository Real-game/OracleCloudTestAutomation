*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Run_Hours_and_Dollars_Report_PAY_REP_029
...            Prerequiste:  Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data:  Folder Name; Report Name; Job Name
...            Dynamic Data: Pay Period; mail_notification

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/Payroll_Payroll_Run_Hours_and_Dollars_Report_PAY_REP_029.json
${csv_path}  ./CSV/td_Payroll_Run_Hours_and_Dollars_Report_PAY_REP_029.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Run_Hours_and_Dollars_Report_PAY_REP_029
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
    Select Pay Period for Report Run in Hours and Dollars Report  ${data}[Pay Period]
    Log  Step 25
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Log  Step 26
    Select Notification  ${data}[mail_notification]  Notification
    Log  Step 27
#    Select Schedule  Output
    Log  Step 28
    Verify Save Output Check_Box in report
    Log  Step 29
#    Select Report Layout as Excel
    Select Report Format as Excel
    Log  Step 30
    Select Schedule Report Job Tab  Schedule
    Log  Step 31
    Verify Run Now Radio Button
    Log  Step 32
    Click Submit Button On Schedule Report Job
    Log  Step 33 - 34
    Set Report Job Name And Click Button  ${data}[Job Name]  OK
    Sleep  10s
    unselect frame
    Log  Step 35
    Click Analytics Home Option
    Log  Step 35 - 36
    Wait And Click Element  link: Report Job History
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
#    Verify Status Of Report Job And Select On Success  ${data}[Job Name]
#    Download Report Of Given Format  EXCEL
    Sleep  20s
    Capture page screenshot

#    ${flag}=  ExcelReportUtility.compare_excel_all_columns  ${data}[Report Name]  ${data}[Report Name]  10  10
#    IF  '${flag}'!='True'
#        Fail  Reports are not matching
#    END
#    Log  result is ${flag}