*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/AbsenceRecords.robot
Documentation  role to test on MX Health and Wellness Representative
...            Prerequiste:  Not Applicable
...            Environment Specific Data:  Login User;Person Name;Person Number
...            Reusable Data: Action Menu1;Action Menu2;Personal and Employment Select Sub Menu
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC004_MX_Health_and_Wellness_Representative.json
${csv_path}  ./CSV/td_SEC_TC004_MX_Health_and_Wellness_Representative.csv
${edit}  xpath: //span[text()="Edit"]

*** Test Cases ***
Scenario: role to test on MX Health and Wellness Representative
    [Tags]  SecurityRoleTestCase  ReadOnly  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    ${my_client_group_app_and_quick_actions_list}=  Create List  Hiring  Person Management  Profiles  Talent Profile  Absence Records  View Compensation History
    FOR  ${tab}  IN  @{my_client_group_app_and_quick_actions_list}
        Verify Tab Or App And Hyperlink  ${tab}
        Log To Console  ${tab} tab found with hyperlink
    END
    Log  Step 7 - 10
    Go to my client group person management
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Sleep  5s
    ${action_menu_list}=  Create List  ${data}[Action Menu1]  ${data}[Action Menu2]
    FOR  ${menu_name}  IN  @{action_menu_list}
        Verify Action Menu  ${menu_name}
        Log To Console  ${menu_name}  found in Action menu list
    END
    Log  Step 11
    ${action_sub_menu_list}=  Create List  Document Delivery Preferences  Document Records  Employment  Person  Person Identifiers for External Applications  Talent Profile  Work Relationship
    Verify Action Sub Menu  ${data}[Action Menu2]  ${action_sub_menu_list}
    Log  Step 12
    Select action Dropdown  ${data}[Action Menu2]  ${data}[Personal and Employment Select Sub Menu]
    Wait And Verify Page Contains Text  Assignment:  10s  Employment page not found
    Log  Step 13
    page should not contain element  ${edit}  Edit option is available
    Sleep  3s
    Log  Step 14
    click on homepage
    Sleep  3s
    Log  Step 15
    Click on Benefits Administration
    Log  Step 16
    Verify Tab Or App And Hyperlink  Enrollment
    Log  Step 17 - 18
    Click On Tools Tab
    Verify Tab Or App And Hyperlink  Reports and Analytics
