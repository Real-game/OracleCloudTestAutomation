*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Events created in Benefits post Temp assignment creation
...            Prerequisite:  HR-09; Person details should be present in environment
...            Environment Specific Data:  LoginUser is environment specific(Benefits_common_test_data.csv); Person Number of respective employee(Benefits_common_test_data.csv)
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC010_Temp_assignment.json
${csv_path}  ./CSV/td_TC010_Temp_assignment.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Events created in Benefits post Temp assignment creation
    [Tags]  BenefitsTestCase  ReadOnly
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    click on homepage
    Log  Step 4
    Click on Benefits Administration
    Log  Step 5
    Click on Enrollment
    Log  Step 6
    Search and click on newly hired Person  ${common_data}[PersonNumber]
    Log  Step 7
    Wait And Verify Page Contains Element  ${potential_life_events_transfer}  5s  Transfer is not displayed under Potential Life Events
    Log  Step 8
    Wait And Verify Page Contains Element  ${potential_life_events_salary_change}  5s  Salary Change is not displayed under Potential Life Events
    Validate Temporary Assignment in Benefits  ${data}[Temporary Assignment Position]