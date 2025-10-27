*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Documentation  Employee - Provide Final Feedback on Annual Performance Review Document
...            Prerequisite:  Annual Performance Review Document should be available in Acknowledge and Complete Performance Document status
...            Environment Specific Data:  Employee Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Current Task
...            Dynamic Data: Review Period; Performace Doc

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PMP_TC08_Employee_Provide_Final_Feedback_on_Annual_Performance_Review_Document.json
${csv_path}  ./CSV/td_PMP_TC08_Employee_Provide_Final_Feedback_on_Annual_Performance_Review_Document.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Employee - Provide Final Feedback on Annual Performance Review Document
    [Tags]  PMPTalentTestCase  ModifyData  PMP22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click on Me
    Click Career And Performance
    Click Performance
    Log  Step 5
    Select Employee Performance Review Period  ${common_data}[Review Period]
    Select Employee's Current task  ${common_data}[Performace Doc]  ${data}[Current Task]
    Log  Step 6
    Continue Acknowledge Document
    Log  Step 7
    Click on Submit Button
    Select Warning Yes Button
    wait until element is visible  xpath: //h1[text()="Performance"]  30s
