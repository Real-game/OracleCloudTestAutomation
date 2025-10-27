*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HireAnEmployeeActions.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/HireAnEmployeeDetail.robot
Documentation  Create a manual hire for union through quick actions
...            Prerequisite:  Create a new position using HR-78
...            Environment Specific Data:  HR Login; Position Name
...            Reusable Data: Address Type; Address line 1; City; Postal Code; Date of Birth; Gender; First Name; Last Name
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_906_Quick_Actions_Manual_Hire_Union.json
${csv_path}  ./CSV/td_HR_906_Quick_Actions_Manual_Hire_Union.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR-906 Quick Actions - Manual Hire (Union)
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    ${Last_Name}=  get_process_name  ${data}[Last Name]
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go to my client groups show more
    Log  Step 6
    Click on Hire An Employee
    Log  Step 7
    Select an Action in hire an employee page
    Fill When and Why in Hire an employee page
    Fill personal details in Hire an Employee page   ${Last_Name}    ${data}[First Name]    ${data}[Date of Birth]     ${data}[Gender]
    Fill Addresses   ${data}[Address Type]  ${data}[Address Line 1]  ${data}[City]  ${data}[Postal Code]
    Fill Citizenship Info in Hire an employee page
    Fill Assignment Details in Hire an employee page  ${common_data}[Position Name]
    Fill Salary Details
    Sleep  15s