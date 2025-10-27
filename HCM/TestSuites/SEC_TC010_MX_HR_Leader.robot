*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  MX HR Leader
...            Prerequiste:  HR-81 and Require an user with MX HR Leader Role
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Person Name;Homepage Option1;Homepage Option2;Homepage Option3;Client group Apps1;Client group Apps2;Client group quick option1;Client group quick option2;Action Menu1;Parent Action;Child Action;Benefits Apps;Tools Apps
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC010_MX_HR_Leader.json
${csv_path}  ./CSV/td_SEC_TC010_MX_HR_Leader.csv

*** Test Cases ***
Scenario: MX HR Leader
    [Tags]  SecurityRoleTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Verify Homepage have options  ${data}[Homepage Option1]  ${data}[Homepage Option2]  ${data}[Homepage Option3]
    Log  Step 6
    Go To My Client Group
    Log  Step 7
    Verify My Client Groups have Apps and Quick action  ${data}[Client group Apps1]  ${data}[Client group Apps2]  ${data}[Client group quick option1]  ${data}[Client group quick option2]
    Log  Step 8
    Click Person Management
    Log  Step 9
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 10 - 11
    Verify Action Menu  ${data}[Action Menu1]
    Verify Action Menu  ${data}[Parent Action]
    Log  Step 12 - 13
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 14
    Verify Edit option is not visible
    Log  Step 15
    click on homepage
    Log  Step 16
    Click on Benefits Administration
    Log  Step 17
    Verify Homepage have Apps  ${data}[Benefits Apps]
    Log  Step 18
    Click on Tools
    Log  Step 19
    Verify Homepage have Apps  ${data}[Tools Apps]