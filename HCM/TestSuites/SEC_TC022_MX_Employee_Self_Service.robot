*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EmploymentInfo.robot
Library  ../Helpers/Helpers.py

Documentation  Security Testing - MX Employee Self Service
...            Prerequisite:
...            Environment Specific Data:  Login User with MX Employee Self Service Role
...            Reusable Data: Not applicable
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC022_MX_Employee_Self_Service.json
${csv_path}  ./CSV/td_SEC_TC022_MX_Employee_Self_Service.csv

*** Test Cases ***
Scenario: Security Testing - MX Employee Self Service
    [Tags]  SecurityRoleTestCase  Read Only
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    #Verify Me and Tools Tab
    Log  Step 6
    Verify Apps for MX Employee Self Service
    Log  Step 7 - 8
    Click on Show More and Employment Info
    Log  Step 9 - 10
    Verify Sections of Employment Details for Employee Role
    Click on Back Button
    Log  Step 11
    Verify My Teams Tab is not present
    Log  Step 13
    Verify My Client Groups Tab is not present