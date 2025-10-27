*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Library  ../Helpers/Helpers.py

Documentation  Security Testing - MX Total Rewards Representative
...            Prerequisite:  Person Number can be created from HR 81
...            Environment Specific Data:  Login User
...            Reusable Data: Person Number
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC002_MX_Total_Rewards_Representative.json
${csv_path}  ./CSV/td_SEC_TC002_MX_Total_Rewards_Representative.csv

*** Test Cases ***
Scenario: Security Testing - MX Total Rewards Representative
    [Tags]  SecurityRoleTestCase  Read Only  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Verify My Team, My client groups, Benefits Administrations and Tools Tab
    Log  Step 6
    Go To My Client Group
    Log  Step 7
    Verify My CLient Groups apps for Rewards Representative
    Verify Quick Actions Link for Rewards Representative
    Log  Step 8 - 11
    Search Person Number and Click Actions  ${data}[PersonNumber]
    Log  Step 12
    Click on Personal and Employment Option for Rewards Representative
    Log  Step 13 - 14
    Click on Employment option and Verify Edit Option