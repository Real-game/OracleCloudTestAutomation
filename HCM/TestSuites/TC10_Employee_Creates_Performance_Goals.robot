*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Documentation  Employee-Creates Performance Goals
...            Prerequisite:  Require Active Performance Document
...            Environment Specific Data:  Employee Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Goal Description; Goal Status; Comments
...            Dynamic Data: Review Period; Review Section; Goal Plan; Goal Name; Start Date; End Date

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PMP_TC10_Employee_Creates_Performance_Goals.json
${csv_path}  ./CSV/td_PMP_TC10_Employee_Creates_Performance_Goals.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Employee-Creates Performance Goals
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    ${goal_name}=  get_process_name  ${data}[Goal Name]
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click on Me
    Click Career And Performance
    Click Performance
    Log  Step 5
    Select Employee Performance Review Period  ${data}[Review Period]
    Select Annual Review Managers  ${data}[Review Section]
    Log  Step 6
    Click Performance Goals
    Log  Step 7 - 8
    Click on Add Button
    Log  Step 9
    Select Goal Plan under Basic Info  ${data}[Goal Plan]
    Log  Step 10
    Enter Goal Name under Basic Info  ${goal_name}
    Log  Step 11
    Enter Goal Description under Basic Info  ${data}[Goal Description]
    Log  Step 12
    Enter Goal Start Date  ${data}[Start Date]
    Log  Step 13
    Enter Goal Target date  ${data}[End Date]
    Log  Step 14
    Select Goal Status  ${data}[Goal Status]
    Log  Step 15
    Enter Goal Comments  ${data}[Comments]
    Log  Step 16
    Click Save And Close
    Log  Step 17
    Verify New Performance Goal Added  ${goal_name}  ${data}[Goal Description]  ${data}[Goal Status]
    Logout From Profile