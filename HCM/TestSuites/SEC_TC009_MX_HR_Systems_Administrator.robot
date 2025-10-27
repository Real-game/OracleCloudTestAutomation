*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/AbsenceRecords.robot
Documentation  MX HR Systems Administrator
...            Prerequiste:  Not Applicable
...            Environment Specific Data:  Login User, Person Number
...            Reusable Data: Person Name,Action Menu1,Action Menu2,Action Menu3,Action Menu4,Personal and Employment Select Sub Menu,Edit Menu1,Edit Menu2,Edit Menu3
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_SEC_TC009_MX_HR_Systems_Administrator.json
${csv_path}  ./CSV/td_SEC_TC009_MX_HR_Systems_Administrator.csv

*** Test Cases ***
Scenario: MX HR Systems Administrator
    [Tags]  SecurityRoleTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage

    Log  Step 5
    ${homepage_tab_list}=  Create List  Me  My Client Groups  Benefits Administration  Tools  Others
    FOR  ${tab}  IN  @{homepage_tab_list}
        Verify Tab Or App And Hyperlink  ${tab}
        Log To Console  ${tab} tab found with hyperlink
    END

    Log  Step 6 - 7
    Go To My Client Group
    ${my_client_group_app_list}=  Create List  Journeys  New Person  Person Management  Absences  Compensation  Goals  Performance  Profiles  Career Development  Workforce Structures  Mass Updates  Data Exchange
    FOR  ${app}  IN  @{my_client_group_app_list}
        Verify Tab Or App And Hyperlink  ${app}
        Log To Console  ${app} app found with hyperlink
    END

    Log  Step 8 - 9
    Go to my client groups show more
    ${quick_action_section_list}=  Create List  Absences  Benefits  Compensation  Data Exchange  Employment  Mass Updates  New Person  Talent  Workforce Structures
    FOR  ${section}  IN  @{quick_action_section_list}
        Wait And Verify Page Contains Text  ${section}  10s  ${section} section not found
        Log To Console  ${section} section found under my client group>quick action>show more
    END

    Log  Step 10 - 13
    Wait And Click Element  link: Absence Records
    Wait And Verify Page Contains Text  Absence Records  20s  Absence Records page not found
    Search And Select Person  ${data}[Person Number]
    Wait And Verify Page Contains Text  Manage Absences and Entitlements  20s  page not found
    Take Existing Absences Screenshot
    Take Plan Balacces Screenshot
    Click Back Arrow
    Wait And Verify Page Contains Text  My Client Groups  20s  Home page not found

    Log  Step 14 - 18
    Go to my client groups show more
    Wait And Click Element  link: Benefits Summary
    Wait And Verify Page Contains Text  Benefits Summary  20s  page not found
    Search And Select Person  ${data}[Person Number]
    Wait And Verify Page Contains Text  People to Cover  20s  Benefits Summary page not found
    page should contain element  link: People to Cover
    Capture Page Screenshot And Retry If Required
    Sleep  3s
    Click Back Arrow
    Wait And Verify Page Contains Text  My Client Groups  20s  Home page not found

    Log  Step 19 - 23
    Go to my client groups show more
    Wait And Click Element  link: Compensation Info
    Wait And Verify Page Contains Text  Compensation Info  20s  page not found
    Search And Select Person  ${data}[Person Number]
    Wait And Verify Page Contains Text  Current Salary  20s  Current Salary page not found
    Capture Page Screenshot And Retry If Required
    Sleep  3s
    Click Back Arrow
    Wait And Verify Page Contains Text  My Client Groups  20s  Home page not found

    Log  Step 24 - 28
    Go to my client groups show more
    Wait And Click Element  link: Employment Info
    Wait And Verify Page Contains Text  Employment Info  20s  page not found
    Search And Select Person  ${data}[Person Number]
    Wait And Verify Page Contains Text  Assignment  20s  Employment Info page not found
    Capture Page Screenshot And Retry If Required
    Sleep  3s
    Click Back Arrow
    Wait And Verify Page Contains Text  My Client Groups  20s  Home page not found

    Log  Step 29 - 30
    Click on Benefits Administration
    ${benefits_administration_app_list}=  Create List  Enrollment  Plan Configuration  Evaluation and Reporting
    FOR  ${app}  IN  @{benefits_administration_app_list}
        Verify Tab Or App And Hyperlink  ${app}
        Log To Console  ${app} app found with hyperlink
    END

    Log  Step 31 - 32
    Click On Tools Tab
    ${tools_app_list}=  Create List  Alerts Composer  Reports and Analytics  Scheduled Processes  Transaction Console
    FOR  ${app}  IN  @{tools_app_list}
        Verify Tab Or App And Hyperlink  ${app}
        Log To Console  ${app} app found with hyperlink
    END

    Log  Step 33 - 34
    Click On Others Tab
    Verify Tab Or App And Hyperlink  Setup and Maintenance
    Log To Console  ${app} app found with hyperlink

    Log  Step 35 - 39
    Go to my client group person management
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    ${action_menu_list}=  Create List  ${data}[Action Menu1]  ${data}[Action Menu2]  ${data}[Action Menu3]  ${data}[Action Menu4]
    FOR  ${menu_name}  IN  @{action_menu_list}
        Verify Action Menu  ${menu_name}
        Log To Console  ${menu_name}  found in Action menu list
    END

    Log  Step 40
    ${action_sub_menu_list}=  Create List  Allocate Checklists  Areas of Responsibility  Create Work Relationship  Direct Reports  Document Delivery Preferences  Document Records  Employment  Person  Person Identifiers for External Applications  Seniority Dates  Talent Profile  User Account  Work Relationship
    Verify Action Sub Menu  ${data}[Action Menu4]  ${action_sub_menu_list}

    Log  Step 41
    Select action Dropdown  ${data}[Action Menu4]  ${data}[Personal and Employment Select Sub Menu]

    Log  Step 42 - 44
    ${edit_menu_list}=  Create List  ${data}[Edit Menu1]  ${data}[Edit Menu2]  ${data}[Edit Menu3]
    FOR  ${menu_name}  IN  @{edit_menu_list}
        Verify Employment Assignment Edit Menu  ${menu_name}
        Log To Console  ${menu_name} found in Action menu list
    END
    Capture Page Screenshot And Retry If Required
