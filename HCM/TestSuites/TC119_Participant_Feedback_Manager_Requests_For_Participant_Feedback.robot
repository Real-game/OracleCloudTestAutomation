*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Documentation  Participant Feedback(Manager requests for Participant feedback)
...            Prerequisite:  PMP TC124 and Need Performance document active for an employee
...            Environment Data:  Login User, Employee Name, Participant Name
...            Reusable Data: Review Period,Review Section,Action,Message
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv
*** Test Cases ***

Scenario: Participant Feedback(Manager requests for Participant feedback)
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Performance under My Team via Navigator
    Log  Step 6 - 7
    Select Performance Review Period  ${data}[Review Period]
    Select Manage Participant Feedback of Review Document Section  ${data}[Employee Name]  ${data}[Review Section]  ${data}[Action]
    Log  Step 8
    Click Add on Manage Participant Feedback page
    Log  Step 9 - 10
    Select Participant name  ${data}[Participant Name]
    Log  Step 11
    Verify Checkbox is enabled for employee selected  ${data}[Participant Name]
    Log  Step 12
    Click on Send Request
    Log  Step 13
    Enter Due Date for Send request
    Log  Step 14
    Enter Message to Participant  ${data}[Message]
    Log  Step 15
    Click submit for send request
    Verify participant feedback added  ${data}[Participant Name]

