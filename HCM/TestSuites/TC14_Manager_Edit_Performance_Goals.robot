*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/PerformanceGoals.robot
Resource  ../PageObjects/EmployeeSetGoals.robot
Resource  ../PageObjects/AddGoal.robot

Documentation  Manager edits one of his direct report's Goal
...            Prerequisite:  TC12 Manager should have already created Performance Goal with name provided
...            Environment Data:  Manager Login(PMP_Talent_common_test_data.csv); Employee Name(PMP_Talent_common_test_data.csv)
...            Reusable Data: FY Year; Goal Name; Status; Comments; Description;Target Completion Date
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC14_Manager_Edit_Performance_Goals.json
${csv_path}  ./CSV/td_TC14_Manager_Edit_Performance_Goals.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager edits one of his direct report's Goal
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    click on homepage
    Log  Step 4-5
    Click on My Team in My Team
    Select Employee By Name  ${common_data}[Employee]
    Click Show More
    Click on Employment Info Performance
    Click on Current Financial Year Goal Plan  ${data}[FY Year]
    Click on Performance Goals
    Click On Goal  ${data}[Goal]
    Click Edit Button
    Set text Description  ${data}[Description]
    Set text Target Completion Date  ${data}[Target Completion Date]
    Change Status  ${data}[Status]
    Save Changes