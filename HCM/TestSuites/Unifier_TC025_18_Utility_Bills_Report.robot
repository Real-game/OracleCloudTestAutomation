*** Settings ***
Library  DataDriver  ../CSV/td_TC025_18_Utility_Bills_Report.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_User_Defined_Reports.robot
Library  ../Helpers/Excel_Helpers.py
Documentation  Run the Utility Bills Report
...            Prerequisite: NA
...            Environment Specific Data:  Login User
...            Reusable Data:  Not applicable
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Run the Utility Bills Report

*** Variables ***
${json_path}    ./TestData/td_TC025_18_Utility_Bills_Report.json
${csv_path}  ./CSV/td_TC025_18_Utility_Bills_Report.csv

*** Test Cases ***
Run Utility Bills Report with - ${Id} ${Login_User}
    [Tags]  Reports  ReadOnly

*** Keywords ***
Run the Utility Bills Report
    [Arguments]  ${Login_User}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Select MX Company in the Home Page
    Log  Step 3
    Select User Defined from Reports
    Select User Defined Reports Frame
    Log  Step 4
    Open Utility Bills Report
    Log  Step 5
    Select Excel Radio Button
    Select Record Count
    Log  Step 6
    delete_File  report
    Click Run Report
    Validate Presence of File

