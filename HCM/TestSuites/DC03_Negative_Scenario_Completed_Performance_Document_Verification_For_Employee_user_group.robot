*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Check Performance Document in Completed Status for Employee
...            Prerequisite:  Annual Performance Document should be available
...            Environment Specific Data:  Login User
...            Reusable Data: Current Task
...            Dynamic Data: Review Period and Review Section


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC03_Negative_Scenario_Completed_Performance_Document_Verification_For_Employee_user_group.json
${csv_path}  ./CSV/td_DC03_Negative_Scenario_Completed_Performance_Document_Verification_For_Employee_user_group.csv

*** Test Cases ***
Scenario: Negative Scenario to check Active Performance Document
    [Tags]  NegativeTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click Career And Performance
    Log  Step 5
    Click Performance
    Log  Step 6
    Select Employee Performance Review Period  ${data}[Review Period]
    Log  Step 7
    Search and Select Employee's Current task  ${data}[Review Section]  ${data}[Current Task]
    Log  Step 8
    Click Performance Goals
    Log  Step 9
    Verify the Performance Document is Completed
