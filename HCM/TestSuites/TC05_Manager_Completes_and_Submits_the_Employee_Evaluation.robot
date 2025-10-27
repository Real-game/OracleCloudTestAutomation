*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Manager submites the Employee Evaluation
...            Prerequisite:  TC04_Manager_views_Participant_Feedback.robot
...            Environment Specific Data:  Login User
...            Reusable Data:  Comment, Feedback Rating, Feedback Comment, Performance Rating, Performance Comment, Competency Rating, Competency Comment
...            Dynamic Data: Performace Doc

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC05_Manager_Completes_and_Submits_the_Employee_Evaluation.json
${csv_path}  ./CSV/td_TC05_Manager_Completes_and_Submits_the_Employee_Evaluation.csv

*** Test Cases ***
Scenario: Manager submites the Employee Evaluation
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
    Click Current Financial Year Annual Review Manager As Manager  ${data}[Performace Doc]
    Log  Step 7
    Click Edit Button On Overall Feedback
    Log  Step 8 - 10
    Give Rating And Comment  ${data}[Feedback Rating]  ${data}[Feedback Comment]  Manager Rating
    Click Save Button
    Log  Step 11
    Click Here Button Under Performance Goals
    Log  Step 12
    Give Rating And Comment  ${data}[Performance Rating]  ${data}[Performance Comment]  Manager Rating
    Log  Step 13
    Click Save And Close
    Log  Step 14
    Click Here Button Under Competencies
    Give Rating And Comment  ${data}[Competency Rating]  ${data}[Competency Comment]  Manager Competency Rating
    Click Save And Close
    Log  Step 15
    Submit Manager Employee Evaluation
    Sleep  5s