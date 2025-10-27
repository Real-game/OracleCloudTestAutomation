*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  MX_Complement and Vacancy Report
...            Prerequisite:  HR02 - Create a position
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name,Downloaded Report Name,Ref Column Name,Validation Column Name,Validation Value
...            Dynamic Data:  Ref Value(It is getting auto read from HR_02 json file)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_907_MX_Complement_and_Vacancy_Report.json
${csv_path}  ./CSV/td_HR_907_MX_Complement_and_Vacancy_Report.csv
${pre_req_json_path}    ./TestData/td_HR_02.json

*** Test Cases ***
Scenario: MX_Complement and Vacancy Report
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    ${pre_req_data}=  readJson  ${pre_req_json_path}
    Log  Step 1 - 4
    # Pre-Requisites must trigger before 2 to 5 minutes of starting HR_907_MX_Complement_and_Vacancy_Report execution
    Sleep  120
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
    Select HR-REP-007 - MX_Position Occupancy and Vacancy Report
    Log  Step 16
    Select And Open Report  ${data}[Report Name]
    delete_File  ${data}[Downloaded Report Name]
    Log  Step 17
    Select Aplly Button Frame
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  10s
    log  Reference Input For Data Validation${\n} Column Name: ${data}[Ref Column Name]${\n} Value: ${pre_req_data}[Code]${\n} Report Name: ${data}[Downloaded Report Name]${\n}
    log  Data To Be Validated${\n} Validation Column: ${data}[Validation Column Name]${\n} Validation Value: ${data}[Validation Value]${\n}
    ${result}=  validate_single_column_data  ${data}[Ref Column Name]  ${pre_req_data}[Code]  ${data}[Validation Column Name]  ${data}[Validation Value]  ${data}[Downloaded Report Name]
    IF  "${result}"!="Validation Successful"
        fail  ${result}
    END