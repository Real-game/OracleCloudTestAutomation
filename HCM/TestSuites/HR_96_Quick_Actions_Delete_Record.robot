*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/EmploymentInfo.robot
Resource  ../PageObjects/EmploymentHistoryRecordCorrection.robot
Documentation  Quick Actions - Delete Record
...            Prerequisite:  Employee details should get from ORC
...            Environment Specific Data: Login User,Employee Name
...            Reusable Data: Group
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_96_Quick_Actions_Delete_Record.json
${csv_path}  ./CSV/td_HR_96_Quick_Actions_Delete_Record.csv

*** Test Cases ***
Scenario: Quick Actions - Delete Record
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Option under Employment Section  ${data}[Group]
    Log  Step 8
    Search for a person  ${data}[Employee Name]
    Log  Step 9
    Expand Employment History
    Log  Step 10
    Click Link Of First Row From Employment Info
    Log  Step 11
    Click Delete button
    Log  Step 12
    Click Warning OK
    Sleep  5s
    Logout