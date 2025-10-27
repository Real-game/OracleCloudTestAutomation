*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot

Documentation  Download Departure Report
...            Prerequisite:  Data Creation DC09
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name
...            Dynamic Data:  Terminated Employee Number

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_910_Departure.json
${csv_path}  ./CSV/td_HR_910_Departure.csv
*** Test Cases ***

Scenario: HR-910 Departure Report
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 4
    Login Using  ${data}[Login User]
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
    Select HR-REP-134_MX Departures Report
    Log  Step 16
    Select And Open Report  ${data}[Report Name]
    Log  Step 17
    Set Termination Start and End Date  ${data}[Termination Start Date]
    Log  Step 18
    #Delete existing report
    delete_File  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  20s
    Validate Employee Number in Departure Report  HR-REP-134_MX_Departures_Report_HR-REP-134_MX_Departures_Report  Employee Number  Employee Number  ${data}[Employee Number]