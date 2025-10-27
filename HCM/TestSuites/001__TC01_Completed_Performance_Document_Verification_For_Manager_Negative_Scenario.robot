*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Check Performance Document in Completed status
...            Prerequisite:  Annual Performance Document should be available
...            Environment Specific Data:  Login User
...            Reusable Data: Not Applicable
...            Dynamic Data: Review Period, Review Section and Manager Name


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC01_Negative_Completed_Performance_Document_Verification_For_Manager.json
${csv_path}  ./CSV/td_TC01_Negative_Completed_Performance_Document_Verification_For_Manager.csv

*** Test Cases ***
Scenario: Manager should not be able to add a new performance goal on a completed performance document of an employee
    [Tags]  NegativeTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
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
    Select Employee Self Evaluation Section  ${data}[Manager Name]  ${data}[Review Section]
    Log  Step 10
    Click Performance Goals
    Log  Step 11
    Verify the Performance Document is Completed
    Logout From Profile
