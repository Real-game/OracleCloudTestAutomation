*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Manager views Participant Feedback
...            Prerequisite:  TC03_Participants_Provide_Feedback.robot
...            Environment Specific Data:  Manager Login(PMP_Talent_common_test_data.csv); Person Name(PMP_Talent_common_test_data.csv)
...            Reusable Data:  Comment
...            Dynamic Data: Performace Doc(PMP_Talent_common_test_data.csv)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC04_Manager_views_Participant_Feedback.json
${csv_path}  ./CSV/td_TC04_Manager_views_Participant_Feedback.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager views Participant Feedback
    [Tags]  PMPTalentTestCase  ModifyData
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
    Select Performance Review Period  ${common_data}[Review Period]
    Search For Person  ${common_data}[Person Name]
    Click participants responded  ${common_data}[Performace Doc]
    Log  Step 7
    Click View Feedback
    Log  Step 8
    View Participant Comments  ${data}[Comment]
    Sleep  5s