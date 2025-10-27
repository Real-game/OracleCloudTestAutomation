*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/DocumentRecords.robot
Documentation  Employee views T4 ESS NU FT
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

Scenario: Employee views T4 ESS - NU - FT
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    Click on Personal info
    Log  Step 5
    Click My Documents
    Log  Step 6-8
    View Document Types  ${data}[Document Type]