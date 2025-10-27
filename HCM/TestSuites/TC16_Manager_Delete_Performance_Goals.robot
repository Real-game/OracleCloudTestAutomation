*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Manager deletes Performance Goals of his direct report
...            Prerequisite:  TC12_Manager_Creates_Performance_Goals.robot
...            Environment Specific Data:  Manager Login(PMP_Talent_common_test_data.csv); Manager Name; Person Name(PMP_Talent_common_test_data.csv)
...            Reusable Data:  Action Menu
...            Dynamic Data: Goal Name; FY Year

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC16_Manager_Delete_Performance_Goals.json
${csv_path}  ./CSV/td_TC16_Manager_Delete_Performance_Goals.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager deletes Performance Goals of his direct report
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4 - 5
    Click on My Team in My Team
    Log  Step 6
    Select Employee By Name  ${common_data}[Person Name]
    Log  Step 7
    Click Show More
    Log  Step 8
    Click On Performance On Employment Info Page
    Log  Step 9
    Click on Current Financial Year Goal Plan  ${data}[FY Year]
    Log  Step 10
    Click Performance Goals
    Log  Step 11-12
    Delete Goal  ${data}[Goal Name]
    Log  Step 13
    Select Warning Yes Button
    Sleep  5s
    Log  Step 14
    page should not contain element  xpath: //a[text()="${data}[Goal Name]"]
#    page should not contain  ${data}[Goal Name]
