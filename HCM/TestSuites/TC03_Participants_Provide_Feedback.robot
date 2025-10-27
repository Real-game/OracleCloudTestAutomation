*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Participant provides feedback
...            Prerequisite:  TC02_Manager_Participant_Feedback.robot
...            Environment Specific Data:  Login User
...            Reusable Data:  Comment
...            Dynamic Data: Performace Doc

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC03_Participants_Provide_Feedback.json
${csv_path}  ./CSV/td_TC03_Participants_Provide_Feedback.csv

*** Test Cases ***
Scenario: Participant provides feedback
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click Career And Performance
    Log  Step 6
    Click Performance
    Log  Step 7
    Click Current Financial Year Annual Review Manager For Participant Feedback  ${data}[Performace Doc]
    Log  Step 8
    Click Edit Button On Overall Feedback
    Log  Step 9
    Fill Comments Under Participant Comments Section  ${data}[Comment]
    Log  Step 10
    Click Save Button
    Log  Step 11
    Click Submit
    Sleep  5s