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
...            Environment Specific Data:  Login User
...            Reusable Data:  Folder Name,Report Name
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_911_Sick_Absence_Report.json
${csv_path}  ./CSV/td_HR_911_Sick_Absence_Report.csv

*** Test Cases ***
Scenario: Sick Absence Report
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
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
    Click open under the report  ${data}[Report Name]
    Log  Step 16
    Enter Report From Date  ${data}[From Date]
    Enter Report To Date  ${data}[To Date]
    Log  Step 17
    Click Report Apply Button
    Verify Report Completed

