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

Documentation  Manager creates Goals for his direct report
...            Prerequisite:  Not Applicable
...            Environment Data:  Manager Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Employee Name(PMP_Talent_common_test_data.csv); FY Year; Goal Name; Description; Start Date; Target Completion Date; Status; Comments
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC12_Manager_Creates_Performance_Goals.json
${csv_path}  ./CSV/td_TC12_Manager_Creates_Performance_Goals.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager creates Goals for his direct report
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
    Click on Current Financial Year Goal Plan  ${data}[FY Name]
    Click on Performance Goals
    PerformanceGoals.Click on Add Button
    Under Goal Plan dropdown Select  ${data}[FY Year]
    Set text Goal Name  ${data}[Goal Name]
    Set text Description  ${data}[Description]
    Set text Start Date  ${data}[Start Date]
    Set text Target Completion Date  ${data}[Target Completion Date]
    Set Status  ${data}[Status]
    Set Comments  ${data}[Comments]
    Click Save And Close
    Wait And Verify Page Contains Text  ${data}[Goal Name]  20s  ${data}[Goal Name] not found
