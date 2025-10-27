*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Keywords/CommonKeywords.py
Resource  ../PageObjects/BenifitsServiceCenter.robot
Documentation  Add dependent(s) to an employees benefit plans.
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User(Benefits_common_test_data.csv); Person Number(Benefits_common_test_data.csv)
...            Reusable Data: Relationship
...            Dynamic Data: Last Name and use current date as Relationship Start Date

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC008_Add_dependent_s_to_an_employees_benefit_plans.json
${csv_path}  ./CSV/td_TC008_Add_dependent_s_to_an_employees_benefit_plans.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Add dependent(s) to an employees benefit plans.
    [Tags]  Benefits  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Click Benefits Administration
    Log  Step 5
    Click Enrollment Under Benefits Administration
    Log  Step 6 - 7
    Search And Select Person  ${common_data}[PersonNumber]
    Log  Step 8
    Select People to Cover
    Log  Step 9
    Click Add Behind Peoples
    Log  Step 10
    ${unique_last_name}=  get_process_name  ${data}[Last Name]
    Enter Last Name  ${unique_last_name}
    Log  Step 11
    Select Relation  ${data}[Relationship]
    Log  Step 12
    ${current_date}=  get_current_date_dd_mm_yyyy
    Set Relationship Start Date  ${current_date}
    Log  Step 13
    Click Submit Button
    Veify Submitted Dependent Details  ${unique_last_name}