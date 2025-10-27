*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Participant Feedback(Manager requests for Participant feedback)
...            Prerequisite:  PMP TC124 and Need Performance document active for an employee
...            Environment Data:  Manager Login(PMP_Talent_common_test_data.csv); Employee Name(PMP_Talent_common_test_data.csv); Participant Name(PMP_Talent_common_test_data.csv)
...            Reusable Data: Review Period;Review Section;Action;Message
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Participant Feedback(Manager requests for Participant feedback)
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Performance under My Team via Navigator
    Log  Step 6 - 7
    Select Performance Review Period  ${data}[Review Period]
    Search For Person  ${common_data}[Employee]
    Select Manage Participant Feedback of Review Document Section  ${common_data}[Employee]  ${data}[Review Section]  ${data}[Action]
    Log  Step 8
    Click Add on Manage Participant Feedback page
    Log  Step 9 - 10
    Select Participant name  ${common_data}[Participant Name]
    Log  Step 11
    Verify Checkbox is enabled for employee selected  ${common_data}[Participant Name]
    Log  Step 12
    Click on Send Request
    Log  Step 13
    Enter Due Date for Send request
    Log  Step 14
    Enter Message to Participant  ${data}[Message]
    Log  Step 15
    Click submit for send request
    Verify participant feedback added  ${common_data}[Participant Name]

