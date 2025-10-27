*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ChangeAssignment.robot
Resource  ../PageObjects/EmploymentInfo.robot
Resource  ../PageObjects/EmploymentHistoryRecordCorrection.robot
Documentation  Quick Actions - Record Correction
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Login; Person Name
...            Reusable Data:  Hourly Paid or Salaried
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_94_Quick_Actions_Record_Correction.json
${csv_path}  ./CSV/td_HR_94_Quick_Actions_Record_Correction.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Quick Actions - Record Correction
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Go to my client groups show more
    Log  Step 7
    Click Employment Info Under Employment Section
    Log  Step 8
    Search And Select Person  ${data}[Person Name]  ${data}[Assignment Number]
    Log  Step 9
    Expand Employment History
    Log  Step 10
    Click Link Of First Row From Employment Info
    Log  Step 11-12
    Expand Assignment And Click Pencil Icon
    Log  Step 13
    Edit Hourly Paid Or Salaried Parameter  ${data}[Hourly Paid or Salaried]
    Log  Step 14
    Click Save
    Log  Step 15
    Click Submit
#    page should not contain  Error
    wait until page does not contain  Error  10s  Error Displayed
