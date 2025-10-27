*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Salary change Life Event creation in Benefits Enrollment
...            Prerequisite:  HR-81, Newly Hired Person details should be present in environment
...            Environment Data:  Login User is environment specific, Person Number of respective new hired employee
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC003_Life_Event_Salary_Change.json
${csv_path}  ./CSV/td_TC003_Life_Event_Salary_Change.csv

*** Test Cases ***

Scenario: Salary change life event creation in benefits Enrollment
    [Tags]  BenefitsTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    click on homepage
    Log  Step 4
    Click on Benefits Administration
    Log  Step 5
    Click on Enrollment
    Log  Step 6-7
    Search and click on newly hired Person  ${data}[PersonNumber]
    Log  Step 8
    Wait And Verify Page Contains Element  ${potential_life_events_section}  5s  Potential Life Events Section is not displayed
    Log  Step 9-11
    Add a Life Event and Save  Salary Change
    Log  Step 12
    Wait And Verify Page Contains Element  ${potential_life_events_salary_change}  5s  Salary Change is not displayed under Potential Life Events
    Log  Step 13-14
    Click Actions and Select an Action  Evaluate Life Events
    Log  Step 15
    Validate Salary Change Life Event