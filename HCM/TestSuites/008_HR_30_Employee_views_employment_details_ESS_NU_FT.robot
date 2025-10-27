*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/EmploymentInfo.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Employee views employment details
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login; HR Login; Manager Name; Employee Person Number
...            Reusable Data:  Not Applicable
...            Dynamic Data:  Business Title

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_30_Employee_views_employment_details_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_30_Employee_views_employment_details_ESS_NU_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Employee views employment details
    [Tags]  CoreHRTestCase  ReadOnly  CoreHR22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3 login as HR Specialist
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5 - 6
    Search employee number with job in person management  ${common_data}[Employee Person Number]  ${data}[Business Title]
    Log  Step 7
    ${position}  ${job}  ${grade}  ${department}  ${location}  ${bargaining_unit}  Get Employment Info
    Log  Step 8
    Logout

    Log  Step 9-11 login as employee with same person number used in step 5-6
    Login Using  ${common_data}[Employee Login]
    Log  Step 12
    click on homepage
    Click On Personal Information
    Log  Step 13
    Click Employment Info Page
    Log  Step 14
    Verify Employment Info Page  ${job}  ${position}  ${data}[Business Title]  ${department}  ${grade}  ${bargaining_unit}  ${location}  ${data}[Manager Name]
    Sleep  5s
    Logout