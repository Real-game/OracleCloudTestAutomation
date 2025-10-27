*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  MX Learning Administrator
...            Prerequisite:  HR-81 and Require an user with MX Learning Administrator Role
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Person Name;Homepage Option1;Homepage Option2;Homepage Option3;Client group Apps1;Client group Apps2;Client group quick option1;Client group quick option2;Parent Action;Child Action
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC006_MX_Learning_Administrator.json
${csv_path}  ./CSV/td_SEC_TC006_MX_Learning_Administrator.csv

*** Test Cases ***

Scenario: MX Learning Administrator
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
    Log  Step 7 - 8
    Verify My Client Groups have Apps and Quick action  ${data}[Client group Apps1]  ${data}[Client group Apps2]  ${data}[Client group quick option1]  ${data}[Client group quick option2]
    Log  Step 9
    Click Person Management
    Log  Step 10
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 11 - 14
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 15
    Verify Edit option is not visible