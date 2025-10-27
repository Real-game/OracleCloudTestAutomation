*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Quick Actions - Update Employee Person Information
...            Prerequisite:  Employee details should get from ORC
...            Environment Specific Data: HR Login; Employee Login Name
...            Reusable Data: Group; Country of Birth; Region of Birth; Town of Birth; Blood Type
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_95_Quick_Actions_Update_Employee_Person_Information.json
${csv_path}  ./CSV/td_HR_95_Quick_Actions_Update_Employee_Person_Information.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Quick Actions - Update Employee Person Information
    [Tags]  CoreHRTestCase  ModifyData  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Option under Employment Section  ${data}[Group]
    Log  Step 8
    Search for a person  ${common_data}[Employee Login Name]
    Log  Step 9
    Select Personal Information
    Log  Step 10
    Sleep  5s
    Select Biographical Info Edit
    Log  Step 11
    Select Country of Birth  ${data}[Country of Birth]
    Log  Step 12
    Select Region of Birth  ${data}[Region of Birth]
    Log  Step 13
    Select Town of Birth  ${data}[Town of Birth]
    Log  Step 14
    Select Blood Type  ${data}[Blood Type]
    Log  Step 15
    Select OK button
    Log  Step 16
    Select Submit Button
    Log  Step 17
    Select Yes Button
    Log  Step 18
    Select OK button
    Sleep  3s
    Logout