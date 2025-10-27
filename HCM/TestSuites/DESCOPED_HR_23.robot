*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_23.json
${csv_path}  ./CSV/td_HR_23.csv
*** Test Cases ***

Scenario: Position Occupancy and vacancy report
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 5
    Click Browse Catalog Button
    Log  Step 6
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand HR Reports
    Select HR-REP-007 - MX_Position Occupancy and Vacancy Report
    Log  Step 7-8
    Select And Open MX_Position_Occupancy_and_Vacancy
    Log  Step 9
    Select Aplly Button Frame
    Click Apply Button
    Sleep  20s
    Log  Step 10
    Select Parameter  ${data}[Division Param1]  ${data}[Division Param2]  ${data}[Division Param3]  ${data}[Division Param4]
    Sleep  7s
    Log  Step 11
    Click Apply Button
    Verify Report Completed Message

