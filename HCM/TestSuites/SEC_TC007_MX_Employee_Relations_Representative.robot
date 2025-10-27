*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Library  ../Helpers/Helpers.py

Documentation  Security Testing - MX Employee Relations Representative
...            Prerequisite:  Require an user with MX Employee Relations Representative Role
...            Environment Specific Data:  Login User meeting the prerequisite; Person number
...            Reusable Data: Person Number
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC007_MX_Employee_Relations_Representative.json
${csv_path}  ./CSV/td_SEC_TC007_MX_Employee_Relations_Representative.csv

*** Test Cases ***
Scenario: Security Testing - MX Employee Relations Representative
    [Tags]  SecurityTestCase  ReadOnly  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[MX Employee Relations Representative User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Verify Homepage have options  ${data}[Homepage Option1]  ${data}[Homepage Option2]  ${data}[Homepage Option3]
    Go To My Client Group
    Log  Step 6
    Verify My Client Groups have Apps and Quick action  ${data}[Client group Apps1]  ${data}[Client group Apps2]  ${data}[Client group quick option1]  ${data}[Client group quick option2]
    Log  Step 7
    Click Person Management
    Log  Step 8
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 9 - 12
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 13
    Verify Edit option is not visible