*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HireAnEmployeeActions.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/HireAnEmployeeDetail.robot
Documentation  Create a manual hire through quick actions
...            Prerequisite:  HR-78 ( For Position Code)
...            Environment Specific Data:  HR Login; Position Code
...            Reusable Data: Address Type; Address line 1; City; Postal Code; Date of Birth; Gender
...            Dynamic Data: New Hire Last Name; New Hire First Name

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_81_Quick_Actions_Manual_Hire.json
${csv_path}  ./CSV/td_HR_81_Quick_Actions_Manual_Hire.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Quick Actions - Manual Hire
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
#    ${Last_Name}=  get_process_name  ${common_data}[New Hire Last Name]
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
#    Fill personal details in Hire an Employee page   ${Last_Name}   ${common_data}[New Hire First Name]    ${data}[Date of Birth]     ${data}[Gender]
    Fill personal details in Hire an Employee page   ${common_data}[New Hire Last Name]   ${common_data}[New Hire First Name]    ${data}[Date of Birth]     ${data}[Gender]
    Fill Addresses   ${data}[Address Type]  ${data}[Address Line 1]  ${data}[City]  ${data}[Postal Code]
    Fill Citizenship Info in Hire an employee page
    Fill Assignment Details in Hire an employee page  ${data}[Assignment Number]
    Fill Salary Details
    Sleep  180s
    click on homepage
    Sleep  5s
    Go to my client group person management
    Sleep  2s
#    ${Person_number}=  Get Person Number in Person Management Page  ${Last_Name}  ${common_data}[New Hire First Name]
#    appendtojson  ${common_json_path}  New Hire Generated Last Name  ${Last_Name}
    ${Person_number}=  Get Person Number in Person Management Page  ${common_data}[New Hire Last Name]  ${common_data}[New Hire First Name]
    appendtojson  ${common_json_path}  New Hire Generated Last Name  ${common_data}[New Hire Last Name]
    appendtojson  ${common_json_path}  New Hire Person Number  ${Person_number}
    generatecsv  ${common_json_path}  ${common_csv_path}

