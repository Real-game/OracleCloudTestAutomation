*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/AddAssignment.robot
Documentation  HR Specialist Temp Assignment Start - Quick Actions
...            Prerequisite:  HR-81
...            Environment Specific Data:  Login User and Person Name
...            Reusable Data:  Assignment Start Date, Assignment Type, Assignment Way, Assignment Reason, Tax Reporting Unit, Time Card Required, Salary Basics, Salary Amount
...            Dynamic Data:  Position ID

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_82_Quick_Actions_Temp_Assignment_Start.json
${csv_path}  ./CSV/td_HR_82_Quick_Actions_Temp_Assignment_Start.csv

*** Test Cases ***
Scenario: HR Specialist Temp Assignment Start - Quick Actions
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Go to my client groups show more
    Log  Step 7
    Click Add Assignment Under Employment Section
    Sleep  5s
    Log  Step 8-9
    Search And Select Person  ${data}[Person Name]
    Log  Step 10
    Check Payroll Salary And Compensation Then Click Contiue
    Log  Step 11
    Fill Details In When and Why  ${data}[Assignment Start Date]  ${data}[Assignment Type]  ${data}[Assignment Way]  ${data}[Assignment Reason]
    Log  Step 12
    Continue
    Log  Step 13-14
    Select Position On Assignment Page  ${data}[Position ID]
    Log  Step 15
    continue
    Log  Step 16-17
    Select Payroll Details  ${data}[Tax Reporting Unit]  ${data}[Time Card Required]
    Log  Step 18
    continue
    Log  Step 19-22
    Select Salary Details  ${data}[Salary Basics]  ${data}[Salary Amount]
    Log  Step 23
    continue
    Log  Step 24
    Submit Details
    page should not contain  Error
    Wait And Verify Page Contains Text  My Client Groups  40s  Failed to submit
    Sleep  5s
    Logout
