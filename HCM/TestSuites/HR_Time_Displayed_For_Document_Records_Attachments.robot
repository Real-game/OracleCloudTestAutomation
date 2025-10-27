*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/DocumentRecords.robot
Documentation  Time Displayed for Document Records Attachments
...            Prerequisite: Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data: Employee Person Number
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Time Displayed for Document Records Attachments
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7 -8
    Click on Quick Actions - Document Records and search   ${common_data}[Employee Person Number]
    Log  Step 9
    Clear Document Type Filter
    Log  Step 10
    Click on View Document Detail
    Log  Step 11
    View Document Attached Date
    Log  Step 12
    Logout