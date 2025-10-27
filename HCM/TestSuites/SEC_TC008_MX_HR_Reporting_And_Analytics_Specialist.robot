*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  MX HR Reporting and  Analytics Specialist
...            Prerequiste:  HR-81 and Require an user with MX HR Reporting and  Analytics Specialist Role
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Person Name;Homepage Option1;Homepage Option2;Homepage Option3;My Client Apps;Action Menu1;Parent Action;Child Action
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC008_MX_HR_Reporting_And_Analytics_Specialist.json
${csv_path}  ./CSV/td_SEC_TC008_MX_HR_Reporting_And_Analytics_Specialist.csv

*** Test Cases ***
Scenario: MX HR Reporting and Analytics Specialist
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
    Verify Homepage have Apps  ${data}[My Client Apps]
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
    Click on Tools
    Log  Step 17
    Click Reports and Analytics
    Log  Step 18
    Click Browse Catalog Button
    Log  Step 19
    Click Shared Folder
    Log  Step 20
    Click Expand Custom Folder
    Log  Step 21 - 22
    Click Expand Metrolinx Folder
    Log  Step 23
    Click Expand Reports Folder
    Log  Step 24
    Click Expand HR Reports Folder
    Log  Step 25 - 26
    Verify HR Reports contains Open,Edit and More options
