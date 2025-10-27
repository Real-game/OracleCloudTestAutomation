*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  MX Talent Acquisition Representative
...            Prerequiste:  Not Applicable
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Person Name;Action Menu1;Action Menu2;Action Sub Menu;Edit Menu1;Edit Menu2;Edit Menu3
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC011_MX_Talent_Aquistion_Representative.json
${csv_path}  ./CSV/td_SEC_TC011_MX_Talent_Aquistion_Representative.csv

*** Test Cases ***

Scenario: MX Talent Aquistion Representative
    [Tags]  SecurityRoleTestCase  ReadOnly  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Wait And Verify Page Contains Text  My Client Groups  20s  My Client Groups tab not found on homepage
    Verify Page Has Hyperlink  My Client Groups
    Wait And Verify Page Contains Text  Tools  20s  Tools tab not found on homepage
    Verify Page Has Hyperlink  Tools
    Log  Step 6
    Go To My Client Group
    Log  Step 7
    Wait And Verify Page Contains Text  Hiring  20s  Hiring app not found
    Verify Page Has Hyperlink  Hiring
    Wait And Verify Page Contains Text  New Person  20s  New Person app not found
    Verify Page Has Hyperlink  New Person
    Wait And Verify Page Contains Text  Person Management  20s  Person Management app not found
    Verify Page Has Hyperlink  Person Management
    Log  Step 8
    Go to my client group person management
    Log  Step 9
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 10 - 11
    Verify Action Menu  ${data}[Action Menu1]
    Verify Action Menu  ${data}[Action Menu2]
    Log  Step 12 - 14
    Select action Dropdown  ${data}[Action Menu2]  ${data}[Action Sub Menu]
    Log  Step 15 - 16
    Verify Employment Assignment Edit Menu  ${data}[Edit Menu1]
    Verify Employment Assignment Edit Menu  ${data}[Edit Menu2]
    Verify Employment Assignment Edit Menu  ${data}[Edit Menu3]

