*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Manager adds a Participant feedback for an Employee
...            Prerequisite:  TC01_Employee_Self_Evaluation.robot
...            Environment Specific Data:  Login User, Participants Name and Person Name
...            Reusable Data:  Action Menu and Due Date
...            Dynamic Data: Action

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC02_Manager_Participant_Feedback.json
${csv_path}  ./CSV/td_TC02_Manager_Participant_Feedback.csv

*** Test Cases ***
Scenario: Manager adds a Participant feedback for an Employee
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
    Click Dots Beside Given Action  ${data}[Action]
    Log  Step 7
    Select Action Menu  ${data}[Action Menu]
    Sleep  5s
    Log  Step 8
    Click Add Participants
    Log  Step 9
    Search And Select Participants  ${data}[Participants Name]
    Log  Step 10
    Click Send Request
    Log  Step 11
    Set Due Date  ${data}[Due Date]
    Log  Step 12
    Click Submit
    Sleep  7s