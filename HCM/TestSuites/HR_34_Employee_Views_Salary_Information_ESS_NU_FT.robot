*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/MyCompensation.robot
Resource  ../PageObjects/MyTeamOverview.robot
Documentation  Employee views salary information ESS NU FT
...            Prerequisite:
...            Environment Specific Data:  Login User as an Employee
...            Reusable Data:
...            Dynamic Data:


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_33_Employee_Views_Payslips_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_33_Employee_Views_Payslips_ESS_NU_FT.csv
*** Test Cases ***

Scenario: Employee views Salary Information ESS - NU - FT
    [Tags]  CoreHRTestCase4569088  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Login Using  ${data}[Manager User]
    click on homepage
    Go To My Team
    Click My Team Icon
    Select Employee By Name  ${data}[Employee Name]
    Log  Step 14
    Click Show More
    Click On Compensation
    ${current_salary}  ${annual_salary}  Get Compensation page Info
    click on homepage
    Logout From Profile


    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    Click on Personal info
    Log  Step 5
    Click on My Compensation
    Log  Step 6
    Verify Salary and Annual Salary Amount in Current Salary section  ${current_salary}  ${annual_salary}
    Log  Step 7
    Show Prior Salary