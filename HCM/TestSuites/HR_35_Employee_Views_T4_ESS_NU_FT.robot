*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/DocumentRecords.robot
Documentation  Employee views T4 ESS NU FT
...            Prerequisite:
...            Environment Specific Data:  Employee Login
...            Reusable Data: Document Type
...            Dynamic Data: NA


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_33_Employee_Views_Payslips_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_33_Employee_Views_Payslips_ESS_NU_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Employee views T4 ESS - NU - FT
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    Click on Personal info
    Log  Step 5
    Click My Documents
    Log  Step 6-8
    View Document Types  ${data}[Document Type]