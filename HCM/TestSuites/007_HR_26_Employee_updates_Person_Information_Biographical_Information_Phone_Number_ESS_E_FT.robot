*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Documentation  Employee updateds Biographical Infomration - Phone Number
...            Prerequisite:  No data dependency
...            Environment Specific Data:  Employee Login
...            Reusable Data:  Type; Area Code
...            Dynamic Data:  Number

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_26_Employee_updates_Person_Information_Biographical_Information_Phone_Number_ESS_E_FT.json
${csv_path}  ./CSV/td_HR_26_Employee_updates_Person_Information_Biographical_Information_Phone_Number_ESS_E_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Employee updateds Biographical Infomration - Phone Number
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click On Personal Information
    Log  Step 5
    Click My Contact Information
    Log  Step 6
    Click Communication Edit Icon
    Log  Step 7
    Select Type  ${data}[Type]
    Log  Step 8
    Enter Area Code  ${data}[Area Code]
    Log  Step 9
    Enter Number  ${data}[Number]
    Log  Step 10
    Click Submit
    Sleep  5s
    page should not contain  Error
    Wait Until Page Contains  Contact Info  30s  Contact Info page is not displayed
    Sleep  5s
    page should contain  ${data}[Number]
    Logout