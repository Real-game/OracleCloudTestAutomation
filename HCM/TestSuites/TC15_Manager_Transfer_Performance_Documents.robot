*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Manager transfers Performance document of his direct report
...            Prerequisite:  SME Intervention Needed
...            Environment Specific Data:  Login User, Manager Name and Person Name
...            Reusable Data:  Action Menu
...            Dynamic Data: Action

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC15_Manager_Transfer_Performance_Documents.json
${csv_path}  ./CSV/td_TC15_Manager_Transfer_Performance_Documents.csv
*** Test Cases ***

Scenario: Manager transfers Performance document of his direct report
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4 - 5
    Click on My Team in My Team
    Log  Step 6
    Select Employee By Name  ${data}[Person Name]
    Log  Step 7
    Click Show More
    Log  Step 8
    Click On Performance On Employment Info Page
    Log  Step 9
    Click Dots Beside Given Action  ${data}[Action]
    Select Action Menu  ${data}[Action Menu]
    Wait And Verify Page Contains Text  Transfer  20s  Transfer page not found
    Sleep  5s
    Log  Step 10
    Search And Select Participants  ${data}[Manager Name]
    Log  Step 11
    Click Save And Close
    Sleep  5s
    Wait And Verify Page Contains Text  Performance  20s  Performance page not found