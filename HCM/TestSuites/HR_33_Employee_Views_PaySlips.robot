*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Pay.robot
Documentation  Employee views payslips
...            Prerequisite: Payroll process executed to generate payslip
...            Environment Specific Data:  Login User as an Employee
...            Reusable Data:Payslip Duration,From Date,To Date
...            Dynamic Data:Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_33_Employee_Views_Payslips_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_33_Employee_Views_Payslips_ESS_NU_FT.csv
*** Test Cases ***

Scenario: Employee views Payslips ESS - NU - FT
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    Click on Pay from Navigator
    Log  Step 5
    Click on My Payslips
    Log  Step 6
    View Payslips  ${data}[Payslip Duration]  ${data}[From Date]  ${data}[To Date]
    Verify Presence Of Payslip