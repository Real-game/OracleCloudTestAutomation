*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Managers are unable to re-open the performance
...            Prerequisite:  TC01_Employee_Self_Evaluation.robot
...            Environment Specific Data:  Login User and Person Name
...            Reusable Data:  Review Period, Document, Action, Action Menu
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC11_Managers_are_unable_to_re_open_the_performance.json
${csv_path}  ./CSV/td_DC11_Managers_are_unable_to_re_open_the_performance.csv

*** Test Cases ***
Scenario: Managers are unable to re-open the performance
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
    Select Review Period  ${data}[Review Period]
    Sleep  3s
    Wait And Click Element  link: Completed
    Sleep  5s
    Log  Step 6
    Search For Person  ${data}[Person Name]
    Sleep  3s
    Click Dots Beside Given Action  ${data}[Action]
    Log  Step 7
    Select Action Menu  ${data}[Action Menu]
    Sleep  5s
    Wait And Click Element  link: In progress
    wait until element is visible  link: ${data}[Document]  40s
#    Sleep  5s
#    Log  Step 8
#    Click Add Participants
#    Log  Step 9
#    Search And Select Participants  ${data}[Participants Name]
#    Log  Step 10
#    Click Send Request
#    Log  Step 11
#    Set Due Date  ${data}[Due Date]
#    Log  Step 12
#    Click Submit
#    Sleep  7s