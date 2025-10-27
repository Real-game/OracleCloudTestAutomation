*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Documentation  Participant Feedback(Manager views Participant feedback)
...            Prerequisite:  PMP TC120 and Need Performance document active for an employee
...            Environment Data:  Login User, Employee Name,Participant Name
...            Reusable Data: Review Period,Review Section
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv
*** Test Cases ***

Scenario: Participant Feedback(Manager views Participant feedback)
    [Tags]  PMPTalentTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Performance under My Team via Navigator
    Log  Step 6
    Select Performance Review Period  ${data}[Review Period]
    Select Employee Self Evaluation Section  ${data}[Employee Name]  ${data}[Review Section]
    Log  Step 7
    Click Show Additional Info
    Log  Step 8
    Verify Participant Feedback given by participant  ${data}[Participant Name]  ${data}[Participant Comment]

