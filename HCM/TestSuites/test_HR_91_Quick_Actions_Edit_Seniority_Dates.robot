*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Quick Actions - Edit Seniority Dates
...            Prerequisite:  HR-84
...            Environment Specific Data: Login User,Employee Name
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_91_Quick_Actions_Edit_Seniority_Dates.json
${csv_path}  ./CSV/td_HR_91_Quick_Actions_Edit_Seniority_Dates.csv
*** Test Cases ***

Scenario: Quick Actions - Edit Seniority Dates
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click on Seniority Dates
    Log  Step 8
    Search for a person  ${data}[Employee Name]
    Log  Step 9
    Select Recalculate Seniority Dates
