*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/MyCompensation.robot
Resource  ../PageObjects/MyTeamOverview.robot
Documentation  Employee views salary information ESS NU FT
...            Prerequisite: Employee details should get from ORC
...            Environment Specific Data:  Employee Login; Manager Login; Employee Login Name(which name of employee login)
...            Reusable Data: NA
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

Scenario: Employee views Salary Information ESS - NU - FT
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Login Using  ${common_data}[Manager Login]
    click on homepage
    Go To My Team
    Click My Team Icon
    Select Employee By Name  ${common_data}[Employee Login Name]
    Log  Step 14
    Click Show More
    Click On Compensation
    ${current_salary}  ${annual_salary}  Get Compensation page Info
    click on homepage
    Logout From Profile


    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    Click on Personal info
    Log  Step 5
    Click on My Compensation
    Log  Step 6
    Verify Salary and Annual Salary Amount in Current Salary section  ${current_salary}  ${annual_salary}
    Log  Step 7
    Show Prior Salary