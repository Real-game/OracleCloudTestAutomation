*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Benefits.robot
Documentation  Employee views benefits information
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login
...            Reusable Data: Dental; Basic Life; Long Term Disablity
...            Dynamic Data: Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_31_Employee_Views_Benefits_Information_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_31_Employee_Views_Benefits_Information_ESS_NU_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv
*** Test Cases ***

Scenario: Employee views benefits information - ESS - NU - FT
    [Tags]  CoreHRTestCase  ReadOnly  CoreHR22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click on Benefits
    Log  Step 5
    Select Your Benefits
    Log  Step 6
    See My Benefits
    Verify My Benefits  ${data}[Dental]  ${data}[Basic Life]  ${data}[Long Term Disablity]