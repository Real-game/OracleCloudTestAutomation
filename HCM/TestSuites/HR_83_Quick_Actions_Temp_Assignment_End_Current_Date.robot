*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ChangeAssignment.robot
Resource  ../PageObjects/PersonManagement.robot
Library  ../Keywords/CommonKeywords.py
Documentation  Temp Assignment End - Quick Actions
...            Prerequisite:  HR-82
...            Environment Specific Data:  HR Login; Person Name
...            Reusable Data:  Assignment Start Date; Assignment Way
...            Dynamic Data:  Assignment Number from HR-82

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_83_Quick_Actions_Temp_Assignment_End_Current_Date.json
${csv_path}  ./CSV/td_HR_83_Quick_Actions_Temp_Assignment_End_Current_Date.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Temp Assignment End - Quick Actions
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1-3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Go to my client groups show more
    Log  Step 7
    Click Change Assignment Under Employment Section
    Sleep  5s
    Log  Step 8-10
    Search And Select Person  ${data}[Person Name]  ${data}[Assignment Number]
    Log  Step 11
    Contiue Without Check
    Log  Step 12-13
    Fill Details In When and Why  ${data}[Assignment Start Date]  ${data}[Assignment Way]
    Log  Step 14
    Continue
    Log  Step 15
    Submit Details
    page should not contain  Error
    Sleep  20s
    #Validation
    Log  Step 16
    click on homepage
    Go to my client group person management
    Log  Step 17
    Search Person Number and input effective Date  ${data}[Person Number]  ${data}[Assignment Start Date]
    Fetch Assignment Status  ${data}[Assignment Number]

