*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Manager adds a Participant feedback for an Employee
...            Prerequisite:  TC01_Employee_Self_Evaluation.robot
...            Environment Specific Data:  Manager Login(PMP_Talent_common_test_data.csv); Participants Name; Person Name(PMP_Talent_common_test_data.csv)
...            Reusable Data:  Action Menu; Due Date
...            Dynamic Data: Action

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC02_Manager_Participant_Feedback.json
${csv_path}  ./CSV/td_TC02_Manager_Participant_Feedback.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager adds a Participant feedback for an Employee
    [Tags]  PMPTalentTestCase  ModifyData  PMP22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Team
    Log  Step 5
    Click On Performance
    Log  Step 6
    Search For Person  ${common_data}[Person Name]
    Click Dots Beside Given Action  ${data}[Action]
    Log  Step 7
    Select Action Menu  ${data}[Action Menu]
    Sleep  5s
    Log  Step 8
    Click Add Participants
    Log  Step 9
    Search And Select Participants  ${common_data}[Participants Name]
    Log  Step 10
    Click Send Request
    Log  Step 11
    Set Due Date  ${data}[Due Date]
    Log  Step 12
    Click Submit
    Sleep  7s