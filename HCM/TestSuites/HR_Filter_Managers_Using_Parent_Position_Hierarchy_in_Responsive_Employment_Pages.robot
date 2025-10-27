*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ChangeAssignment.robot
Resource  ../PageObjects/HireAnEmployeeActions.robot
Documentation  Filter Managers Using Parent Position Hierarchy in Responsive Employment Pages
...            Prerequisite: Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data: Employee Person Number; Position Code(Which has Parent position with more incumbents)
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_Filter_Managers_Using_Parent_Position_Hierarchy_in_Responsive_Employment_Pages.json
${csv_path}  ./CSV/td_HR_Filter_Managers_Using_Parent_Position_Hierarchy_in_Responsive_Employment_Pages.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Filter Managers Using Parent Position Hierarchy in Responsive Employment Pages
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Change Assignment Under Employment Section
    Log  Step 8
    Search And Select Person From Result   ${common_data}[Employee Person Number]
    Wait And Verify Page Contains Text  What info do you want to manage?  20s  Change Assignment Page Not Foud
    Log  Step 9
    Verify And Select Maintain Manager Checkbox
    Log  Step 10
    Contiue Without Check
    Log  Step 11
    Continue
    Log  Step 12
    Change Position Code in Change Assignment  ${data}[Position Code]
    Log  Step 13
    Continue
    Log  Step 14
    Verify Maintain Manager has Multiple option
    Log  Step 15
    click on homepage
    Log  Step 16
    Verify Page throws Warning
    Log  Step 17
    Logout
