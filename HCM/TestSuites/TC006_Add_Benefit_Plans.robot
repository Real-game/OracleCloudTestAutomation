*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Add Benefits Plans in benefits Enrollment
...            Prerequisite:  HR-81, Newly Hired Person details should be present in environment, DC-13 Add Payroll Frequency
...            Environment Data:  Login User is environment specific, Person Number of respective new hired employee
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC006_Add_Benefit_Plans.json
${csv_path}  ./CSV/td_TC006_Add_Benefit_Plans.csv

*** Test Cases ***

Scenario: Add Benefit Plans in benefits Enrollment
    [Tags]  BenefitsTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Benefits Administration
    Log  Step 6
    Click on Enrollment
    Log  Step 7
    Search and click on newly hired Person  ${data}[PersonNumber]
    Log  Step 8
    Wait And Verify Page Contains Element  ${potential_life_events_section}  5s  Potential Life Events Section is not displayed
    Log  Step 9
    Verify Event in Detected State  New Hire
    Verify Event in Detected State  Salary Change
    Verify Event in Detected State  Transfer
    Log  Step 10
    Click Actions and Select an Action  Evaluate Life Events
    Log  Step 11
    Verify Event in Processed State in Potential Life Events  New Hire
    Verify Enrollment Option is displayed