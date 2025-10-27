*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/AddGoal.robot

Documentation  Performance Document Self Evaluation by Employee
...            Prerequisite:  TC12 Manager should have already created Performance Goal with name provided
...            Environment Data:  Employee Login(PMP_Talent_common_test_data.csv); Employee Name
...            Reusable Data: FY Year; Goal Name; Status; Comments
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC13_Employee_Edit_Performance_Goals.json
${csv_path}  ./CSV/td_TC13_Employee_Edit_Performance_Goals.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Performance Document Self Evaluation by Employee
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click Career And Performance
    Log  Step 5
    Click Performance
    Log  Step 6
    #Click Current Financial Year Annual Review Manager  ${data}[FY Year]
    Click on Current Financial Year Goal Plan  ${data}[FY Year]
    Log  Step 7
    Click Performance Goals
    Log  Step 8
    Click On Goal  ${data}[Goal]
    Log  Step 9
    Click Edit Button
    Log  Step 10
    Change Status  ${data}[Status]
    Log  Step 11
    Set Comments  ${data}[Comments]
    Save Changes