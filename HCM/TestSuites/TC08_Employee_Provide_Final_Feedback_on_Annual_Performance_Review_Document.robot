*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Documentation  Employee - Provide Final Feedback on Annual Performance Review Document
...            Prerequisite:  Annual Performance Review Document should be available in Acknowledge and Complete Performance Document status
...            Environment Specific Data:  Login User
...            Reusable Data: Current Task
...            Dynamic Data: Review Period and Review Section

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PMP_TC08_Employee_Provide_Final_Feedback_on_Annual_Performance_Review_Document.json
${csv_path}  ./CSV/td_PMP_TC08_Employee_Provide_Final_Feedback_on_Annual_Performance_Review_Document.csv

*** Test Cases ***

Scenario: Employee - Provide Final Feedback on Annual Performance Review Document
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click on Me
    Click Career And Performance
    Click Performance
    Log  Step 5
    Select Employee Performance Review Period  ${data}[Review Period]
    Select Employee's Current task  ${data}[Review Section]  ${data}[Current Task]
    Log  Step 6
    Select Acknowledge Document
    Log  Step 7
    Click on Submit Button
