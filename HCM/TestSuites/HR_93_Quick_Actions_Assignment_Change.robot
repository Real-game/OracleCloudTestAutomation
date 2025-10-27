*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ChangeAssignment.robot
Documentation  Assignment Change - Quick Actions
...            Prerequisite:  HR-81
...            Environment Specific Data:  Login User and Person Name
...            Reusable Data:  Probation Period Value and Probation Period Unit
...            Dynamic Data:  Assignment Number

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_93_Quick_Actions_Assignment_Change.json
${csv_path}  ./CSV/td_HR_93_Quick_Actions_Assignment_Change.csv

*** Test Cases ***
Scenario: Assignment Change - Quick Actions
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Go to my client groups show more
    Log  Step 7
    Click Change Assignment Under Employment Section
    Sleep  5s
    Log  Step 8
    Search And Select Person  ${data}[Person Name]  ${data}[Assignment Number]
    Log  Step 9
    Contiue Without Check
    Log  Step 10
    Continue
    Log  11
    Change Probation Period  ${data}[Probation Period Value]  ${data}[Probation Period Unit]
    Log  Step 12
    Submit Details
    page should not contain  Error
    Wait And Verify Page Contains Text  My Client Groups  120s  Submittion is in progress
    Sleep  5s
    Logout