*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Vacation Leave Balance
...            Prerequisite:  No data Dependency
...            Environment Specific Data:  Login User
...            Reusable Data:  Folder Name, Report Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_912_Vacation_Leave_Balance.json
${csv_path}  ./CSV/td_HR_912_Vacation_Leave_Balance.csv

*** Test Cases ***
Scenario: Vacation Leave Balance
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 6
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 7
    Click Browse Catalog Button
    Log  Step 8 - 15
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand Absence Reports
    Select Folder  ${data}[Folder Name]
    Select And Open Report  ${data}[Report Name]
    Log  Step 16
    Select Aplly Button Frame
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  7s