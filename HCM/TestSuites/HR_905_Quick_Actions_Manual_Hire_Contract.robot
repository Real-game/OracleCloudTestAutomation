*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AddContingentEmployeeDetail.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Create a manual hire(contract) through quick actions
...            Prerequisite: Create a new position using HR-78
...            Environment Specific Data:  HR Login
...            Reusable Data: Address line 1; City; Postal Code; Phone Type; Phone Number; First Name; Last Name; Date of Birth; Gender
...            Dynamic Data: Social Insurance Number(Has to be unique for every run; test team used to generate SIN from Google)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_905_Quick_Actions_Manual_Hire_Contract.json
${csv_path}  ./CSV/td_HR_905_Quick_Actions_Manual_Hire_Contract.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR-905 Quick Actions - Manual Hire - Contract
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    ${last_name}=  get_process_name  ${data}[Last Name]
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7 - 8
    Click on Add a Contingent Employee
    Log  Step 8 - 11
    Fill Basic Details in Add a contingent employee page
    Log  Step 12 - 15
    Fill personal details in Add a contingent Employee page   ${last_name}    ${data}[First Name]    ${data}[Date of Birth]     ${data}[Gender]
    Log  Step 16 - 20
    Fill National Identifier Details   ${data}[Social Insurance Number]
    Log  Step 21 - 28
    Fill Addresses   ${data}[Address Line 1]  ${data}[City]  ${data}[Postal Code]
    Fill Phone Details   ${data}[Phone Type]  ${data}[Phone Number]
    Fill Assignment Details in Hire an employee page   ${common_data}[Position Name]
    Fill Salary Details
    Review and Submit
