*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Documentation  Quick Actions -Admin update Personal information - Address
...            Prerequisite:  HR-84
...            Environment Specific Data: Login User,Employee Name
...            Reusable Data: Start Date,Area Code,Home Number,Address Line 1,City,Postal Code
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_85_Quick_Actions_Admin_Update_Personal_Information_Address.json
${csv_path}  ./CSV/td_HR_85_Quick_Actions_Admin_Update_Personal_Information_Address.csv
*** Test Cases ***

Scenario: Quick Actions -Admin update Personal information - Address
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Contact Info Under Employment Section
    Log  Step 8
    Search for a person  ${data}[Employee Name]
    Log  Step 9
    Click Home Phone Edit Icon
    Log  Step 10
    Enter Area Code  ${data}[Area Code]
    Enter Home Number  ${data}[Home Number]
    Log  Step 11
    Click Submit
    Log  Step 12
    Click Adderess Edit Icon
    Log  Step 13
    Select Start Date  ${data}[Start Date]
    Log  Step 14
    Enter Address1  ${data}[Address Line 1]
    Log  Step 15
    Enter City  ${data}[City]
    Log  Step 15
    Enter Postal Code  ${data}[Postal Code]
    Log  Step 17
    Click Submit
    Sleep  5s
    Logout