*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Resource  ../PageObjects/AnalyticsHomePage.robot
Documentation  Metrolinx Employee List Report with Addresses and Email (added to manager hierarchy in the Parent Managers folder)
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data:  Folder Name; Report Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_44_Metrolinx_Employee_List_Report_with_Addresses_and_Email_added_to_manager_hierarchy_in_the_Parent_Managers_folder.json
${csv_path}  ./CSV/td_HR_44_Metrolinx_Employee_List_Report_with_Addresses_and_Email_added_to_manager_hierarchy_in_the_Parent_Managers_folder.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Metrolinx Employee List Report with Addresses and Email (added to manager hierarchy in the Parent Managers folder)
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
    Log  Step 16
    Select And Open Report  ${data}[Report Name]
    Click Ok Button
    wait until element is visible  xpath: //a[text()="Export"]  120s
    Sleep  2s
    ${count1}=  Get Text Count with tag  td  Regular Full Time
    ${count2}=  Get Text Count with tag  td  Regular Part Time
    ${count}=  evaluate  ${count1}+${count2}
    Log  Row count:${count}
    IF  "${count}"=="0"
        log  No employee data found
    END
    Capture Page Screenshot And Retry If Required