*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Manager views Participant Feedback
...            Prerequisite:  TC03_Participants_Provide_Feedback.robot
...            Environment Specific Data:  Login User and Person Name
...            Reusable Data:  Comment
...            Dynamic Data: Performace Doc

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC04_Manager_views_Participant_Feedback.json
${csv_path}  ./CSV/td_TC04_Manager_views_Participant_Feedback.csv

*** Test Cases ***
Scenario: Manager views Participant Feedback
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go To My Team
    Log  Step 5
    Click On Performance
    Log  Step 6
    Search For Person  ${data}[Person Name]
    Click 1 of 1 participants responded  ${data}[Performace Doc]
    Log  Step 7
    Click View Feedback
    Log  Step 8
    View Participant Comments  ${data}[Comment]
    Sleep  5s