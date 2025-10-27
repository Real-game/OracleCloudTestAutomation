*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/Promotion.robot
Documentation  Quick Actions - Promote an employee (Current Date)
...            Prerequisite:  HR-81
...            Environment Specific Data: Login User,Employee Number
...            Reusable Data: Group,Promotion Start Date,Way to Promote,Reason for Promotion,Position,Percentage
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_86_Quick_Actions_Promote_An_Employee.json
${csv_path}  ./CSV/td_HR_86_Quick_Actions_Promote_An_Employee.csv
*** Test Cases ***

Scenario: Quick Actions - Promote an employee (Current Date)
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
    Click Option under Employment Section  ${data}[Group]
    Log  Step 8
    Search And Select Person  ${data}[Employee Number]
    Log  Step 9 - 10
    Check Salary And Compensation Then Click Contiue
    Log  Step 11 - 14
    Fill details of When and Why  ${data}[Promotion Start Date]  ${data}[Way to Promote]  ${data}[Reason for Promotion]
    Log  Step 15 - 17
    Select Position On Promotion Page  ${data}[Position]
    Log  Step 18 - 19
    Select Salary Adjustment Percentage  ${data}[Percentage]
    Log  Step 20
    Submit Details
