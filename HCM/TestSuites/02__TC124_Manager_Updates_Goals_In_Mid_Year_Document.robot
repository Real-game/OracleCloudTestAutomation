*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Manager updates goals in mid-year document
...            Prerequisite:  PMP TC117 and Need Performance document active for an employee
...            Environment Data:  Manager Login(PMP_Talent_common_test_data.csv); Employee(PMP_Talent_common_test_data.csv)
...            Reusable Data: Review Period;Review Section;Goal Name;Goal Description;Goal Status;Comments
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
Scenario: Manager updates goals in mid-year document
    [Tags]  PMPTalentTestCase  ModifyData  PMP22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    ${goal_name}=  get_process_name  ${data}[Goal Name]
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Performance under My Team via Navigator
    Log  Step 6
    Select Performance Review Period  ${data}[Review Period]
    Search For Person  ${common_data}[Employee]
    Select Document  ${data}[Review Section]
#    Select Employee Self Evaluation Section  ${data}[Employee Name]  ${data}[Review Section]
    Log  Step 7
    Click Performance Goals
    Log  Step 8
    Click on Add Button
    Log  Step 9
    Enter Goal Name under Basic Info  ${goal_name}
    Log  Step 10
    Enter Goal Description under Basic Info  ${data}[Goal Description]
    Log  Step 11
    Select Goal Status  ${data}[Goal Status]
    Log  Step 12
#    Enter Goal Comments  ${data}[Comments]
    Log  Step 13
    Click Save And Close
    Verify New Performance Goal Added  ${goal_name}  ${data}[Goal Description]  ${data}[Goal Status]