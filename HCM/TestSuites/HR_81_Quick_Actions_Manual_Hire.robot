*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HireAnEmployeeActions.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/HireAnEmployeeDetail.robot
Documentation  Create a manual hire through quick actions
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User, Assignment Number
...            Reusable Data: Address Type,Address line 1,City, Postal Code, Date of Birth and Gender
...            Dynamic Data: First Name and Last Name

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_81_Quick_Actions_Manual_Hire.json
${csv_path}  ./CSV/td_HR_81_Quick_Actions_Manual_Hire.csv
*** Test Cases ***

Scenario: Quick Actions - Manual Hire
    [Tags]  NewHire  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go to my client groups show more
    Log  Step 6
    Click on Hire An Employee
    Log  Step 7
    Select an Action in hire an employee page
    Fill When and Why in Hire an employee page
    Fill personal details in Hire an Employee page   ${data}[Last Name]    ${data}[First Name]    ${data}[Date of Birth]     ${data}[Gender]
    Fill Addresses   ${data}[Address Type]  ${data}[Address Line 1]  ${data}[City]  ${data}[Postal Code]
    Fill Citizenship Info in Hire an employee page
    Fill Assignment Details in Hire an employee page  ${data}[Assignment Number]
    Fill Salary Details
    Sleep  15s