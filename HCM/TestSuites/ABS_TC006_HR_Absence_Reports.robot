*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  HR Absence Reports
...            Prerequiste: Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Folder Name; Report Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ABS_TC006_HR_Absence_Reports.json
${csv_path}  ./CSV/td_ABS_TC006_HR_Absence_Reports.csv
${common_json_path}    ./TestData/Absence_common_test_data.json
${common_csv_path}  ./CSV/Absence_common_test_data.csv

*** Test Cases ***
Scenario: HR Absence Reports
    [Tags]  AbsenceHRTestCase  ModifyData  DryRun
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4 - 6
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 7 - 12
    Click Browse Catalog Button
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Log  Step 13 - 14
    Select Folder  ${data}[Folder Name]
    Select And Open Report  ${data}[Report Name]
    Log  Step 15 - 16
    Click Ok Button
    wait until element is visible  xpath: //a[text()="Export"]  120s
    Sleep  2s
    Capture Page Screenshot And Retry If Required
