*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Library  ../Helpers/Helpers.py

Documentation  Security Testing - MX Organizational Development Representative
...            Prerequisite:  Person Number can be created from HR 81
...            Environment Specific Data:  Login User
...            Reusable Data: Person Number
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC005_MX_Organizational_Development_Representative.json
${csv_path}  ./CSV/td_SEC_TC005_MX_Organizational_Development_Representative.csv

*** Test Cases ***
Scenario: Security Testing - MX Organizational Development Representative
    [Tags]  SecurityRoleTestCase  ReadOnly  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    #Verify Homepage have options  My Client Groups  Tools  ''
    Verify Homepage have Apps  My Client Groups
    Verify Homepage have Apps  Tools
    Log  Step 6
    Go To My Client Group
    Log  Step 7
    Verify My client groups apps
    Log  Step 8 - 10
    Click on Show More and Verify Talent Quick Action Section
    Log  Step 11 - 14
    Search Person Number and Click Actions for Organizational Development Representative  ${data}[PersonNumber]  MX Organizational Development Representative
    Log  Step 15
    Click on Personal and Employment Option
    Log  Step 16 - 17
    Click on Employment option and Verify Edit Option