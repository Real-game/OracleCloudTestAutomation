*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Documentation  Employee updateds Biographical Infomration - Phone Number
...            Prerequisite:  No data dependency
...            Environment Specific Data:  Login User
...            Reusable Data:  Type,Area Code
...            Dynamic Data:  Number

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_26_Employee_updates_Person_Information_Biographical_Information_Phone_Number_ESS_E_FT.json
${csv_path}  ./CSV/td_HR_26_Employee_updates_Person_Information_Biographical_Information_Phone_Number_ESS_E_FT.csv

*** Test Cases ***
Scenario: Employee updateds Biographical Infomration - Phone Number
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
    Wait Until Page Contains  Contact Info  20s  Contact Info page is not displayed
    page should contain  ${data}[Number]
    Logout