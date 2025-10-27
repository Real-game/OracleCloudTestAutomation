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
Documentation  Run Employee Termination Report (OTBI) and validate all columns
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data:  Folder Name; Report Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_43_Run_Employee_Termination_Report_OTBI_and_validate_all_columns.json
${csv_path}  ./CSV/td_HR_43_Run_Employee_Termination_Report_OTBI_and_validate_all_columns.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Run Employee Termination Report (OTBI) and validate all columns
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
    Select Folder  ${data}[Folder Name]
    Select And Open Report  ${data}[Report Name]
    Log  Step 16
    Set Termination Start Date  ${data}[Start Date]
    Set Termination End Date  ${data}[End Date]
    Log  Step 17
    Click Ok Button
    wait until element is visible  xpath: //a[text()="Export"]  300s
    Sleep  2s
    Capture Page Screenshot And Retry If Required