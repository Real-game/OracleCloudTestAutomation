*** Settings ***
Library  ../Keywords/CommonKeywords.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Manager Check-In
...            Prerequisite:  TC121
...            Environment Specific Data:  Login User and Employee Name
...            Reusable Data:  Test Comment,Meeting Option
...            Dynamic Data:  Review Section

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv

*** Test Cases ***
Scenario: Manager Check-In
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[LoginUser]
    Log  Step 4 - 5
    Click on Performance under My Team via Navigator
    Log  Step 6
    Search For Person  ${data}[Employee Name]
    Select Document  ${data}[Review Section]
    Log  Step 7
    Click Here Button Behind Performance Management Process Stage
    Wait And Verify Page Contains Text  Questionnaire  20s  Questionnaire page not found
    Log  Step 8 - 11
    Add Comment To Questionnaire  ${data}[Test Comment]
    Select Option About Your Meeting  ${data}[Meeting Option]
    ${current_date}=  get_current_date_dd_mmmm_yyyy
    Set Check In Date  ${current_date}
    Log  Step 12
    Click Save And Close
    Log  Step 13
    Click Submit Manager Mid Year Check In
