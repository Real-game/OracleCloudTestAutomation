*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Documentation  Employee updates personal Infomration(Address)
...            Prerequisite:  No data dependency
...            Environment Specific Data:  Login User
...            Reusable Data:  Start Date, Address Line 1, Address Line 2
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_25_Employee_updates_personal_information_Address_ESS_E_FT.json
${csv_path}  ./CSV/td_HR_25_Employee_updates_personal_information_Address_ESS_E_FT.csv

*** Test Cases ***
Scenario: Employee updates personal Infomration(Address)
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click On Personal Information
    Log  Step 5
    Click My Contact Information
    Log  Step 6
    Click Adderess Edit Icon
    Log  Step 7
    Select Start Date  ${data}[Start Date]
    Log  Step 8
    Enter Address1  ${data}[Address Line 1]
    Log  Step 9
    Enter Address2  ${data}[Address Line 2]
    Log  Step 10
    Click Submit
    Sleep  5s
    page should not contain  Error
    Wait Until Page Contains  Contact Info  20s  Contact Info page is not displayed
    page should contain  ${data}[Address Line 1]
    page should contain  ${data}[Address Line 2]
    Logout