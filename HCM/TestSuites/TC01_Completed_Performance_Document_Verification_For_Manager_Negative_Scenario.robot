*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Check Performance Document in Completed status
...            Prerequisite:  Annual Performance Document should be available
...            Environment Specific Data:  Manager Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Not Applicable
...            Dynamic Data: Review Period; Review Section; Manager Name


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC01_Negative_Completed_Performance_Document_Verification_For_Manager.json
${csv_path}  ./CSV/td_TC01_Negative_Completed_Performance_Document_Verification_For_Manager.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager should not be able to add a new performance goal on a completed performance document of an employee
    [Tags]  NegativeTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Team
    Log  Step 5
    Click On Performance
    Log  Step 6
    Select Performance Review Period  ${data}[Review Period]
    Log  Step 7
    Check Show Filter option
    Log  Step 8
    Click on clear Document status filter
    Log  Step 9
    Search For Person  ${data}[Employee Name]
    Select Document  ${data}[Review Section]
#    Select Employee Self Evaluation Section  ${data}[Manager Name]  ${data}[Review Section]
    Log  Step 10
    Click Performance Goals
    Log  Step 11
    Verify the Performance Document is Completed
    Logout From Profile
