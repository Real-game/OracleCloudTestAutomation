*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Managers are unable to delete the performance document(goals)
...            Prerequisite:  TC01_Employee_Self_Evaluation.robot
...            Environment Specific Data:  Login User and Person Name
...            Reusable Data:  Review Period; Document; Action; Action Menu
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC14_Managers_are_unable_to_delete_the_performance_document_goals.json
${csv_path}  ./CSV/td_DC14_Managers_are_unable_to_delete_the_performance_document_goals.csv

*** Test Cases ***
Scenario: Managers are unable to delete the performance document(goals)
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 5
    click on homepage
    Go To My Team
    Click On Performance
    Log  Step 6 - 9
    Select Review Period  ${data}[Review Period]
    Sleep  3s
    Search For Person  ${data}[Person Name]
    Sleep  3s
    Click Dots Beside Given Action  ${data}[Action]
    ${status}=  Run Keyword And Return Status  Verify Action Menu  ${data}[Action Menu]
    IF  "${status}" != "False"
        fail  Delete option is available for manager
    END
    Sleep  5s