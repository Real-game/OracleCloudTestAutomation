*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/DocumentRecords.robot
Documentation  Employee updates views Document Records
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login
...            Reusable Data: Document Type
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_29_Employee_Updates_Views_Document_Records_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_29_Employee_Updates_Views_Document_Records_ESS_NU_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Employee updates views Document Records
    [Tags]   CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click On Personal Information
    Log  Step 5
    Click My Documents
    View Document Types  ${data}[Document Type]
    Sleep  25s