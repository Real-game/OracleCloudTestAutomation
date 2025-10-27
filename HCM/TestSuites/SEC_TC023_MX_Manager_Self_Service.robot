*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EmploymentInfo.robot
Library  ../Helpers/Helpers.py

Documentation  Security Testing - MX Manager Self Service
...            Prerequisite: An Employee should be a reportee to the Manager
...            Environment Specific Data:  Login User with MX Manager Self Service Role
...            Reusable Data: Not applicable
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC023_MX_Manager_Self_Service.json
${csv_path}  ./CSV/td_SEC_TC023_MX_Manager_Self_Service.csv

*** Test Cases ***
Scenario: Security Testing - MX Manager Self Service
    [Tags]  SecurityRoleTestCase  Read Only
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
#    Verify Homepage have options  Me  My Team  Tools
    Log  Step 6
    Verify Me tab apps for MX Manager Self Service
    Log  Step 7 - 8
    Click on Show More and Employment Info
    Log  Step 9 - 10
#    Sleep    10s
    Verify Sections of Employment Details
    Click on Back Button
    Log  Step 11
    Go To My Team
    Log  Step 12
    Verify My Team tab apps for MX Employee Self Service
    Log  Step 13
    Click My Team Icon
    Log  Step 14
    Click on an Employee and Check Details
    Click on Back Button
    Click on Back Button
    Log  Step 15
    Verify My Client Groups Tab is not present
