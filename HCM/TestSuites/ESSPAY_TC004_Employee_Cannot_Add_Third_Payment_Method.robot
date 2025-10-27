*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee Cannot Add a Third Payment Method
...            Prerequisite:  ESSPAY_TC001
...            Environment Specific Data:  Login User
...            Reusable Data:  Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Verify Employee Cannot Add a Third Payment Method
    [Tags]  PayrollTestCase  ReadOnly
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[ESSPAY Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click On Pay Under Me
    Log  Step 6
    Click My Banking Information
    Log  Step 7
    Verify Presence Of My Banking Information
    Log  Step 8
    Verify Add Banking Information should not Present
    Log  Step 9
    Verify Presence Of Reorder Option
    Sleep  5s
    Logout