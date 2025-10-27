*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Documentation  Employee updates views - Contacts Information
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login
...            Reusable Data: Home Number; Address Line 1 and Address Line 2
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_28_Employee_Updates_Views_Contacts_Information_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_28_Employee_Updates_Views_Contacts_Information_ESS_NU_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Employee updates views - Contacts Information - ESS - NU - FT
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click on Personal info
    Log  Step 5
    Click My Contact Information
    Log  Step 6
    Click Home Phone Edit Icon
    Log  Step 7
    Enter Number  ${data}[Home Number]
    Log  Step 8
    Click Submit
    Log  Step 9
    Click Adderess Edit Icon
    Log  Step 10
    Select Start Date
    Log  Step 11
    Enter Address1  ${data}[Address Line 1]
    Log  Step 12
    Enter Address2  ${data}[Address Line 2]
    Log  Step 13
    Click Submit
    Sleep  5s
    Logout