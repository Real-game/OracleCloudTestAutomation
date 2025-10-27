*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Library  ../Helpers/Helpers.py

Documentation  Security Testing - MX HR Services
...            Prerequisite:  Person Number can be created from HR 81
...            Environment Specific Data:  Login User
...            Reusable Data: Person Number
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC012_MX_HR_Services.json
${csv_path}  ./CSV/td_SEC_TC012_MX_MX_HR_Services.csv

*** Test Cases ***
Scenario: Security Testing - MX HR Services
    [Tags]  SecurityRoleTestCase  ReadOnly  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Verify Homepage have options  My Client Groups  Benefits Administration  Tools
    Log  Step 6
    Go To My Client Group
    Log  Step 7
    Verify Tab Or App And Hyperlink  Person Management
    Verify Tab Or App And Hyperlink  View Compensation History
    Log  Step 8 - 11
    Search Person Number and Click Actions  ${data}[PersonNumber]
    Log  Step 12
    Click on Personal and Employment Option for MX HR Services
    Log  Step 13 - 14
    Click on Employment option and Verify Edit Option
    Log  Step 15
    click on homepage
    Log  Step 16
    Click on Benefits Administration
    Log  Step 17
    Verify Homepage have Apps  Enrollment
    Log  Step 18
    Click on Tools
    Log  Step 19
    Verify Homepage have Apps  Reports and Analytics
