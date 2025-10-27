*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Benefits retro change for grade sync process
...            Prerequisite:
...            Environment Data:  Login User is environment specific(Benefits_common_test_data.csv)
...            Reusable Data: Person Number(Benefits_common_test_data.csv), Effective Date should be past date
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC014_Benefits_Retro_Change_For_Grade_Sync_Process.json
${csv_path}  ./CSV/td_TC014_Benefits_Retro_Change_For_Grade_Sync_Process.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Benefits retro change for grade sync process
    [Tags]  BenefitsTestCase  ModifyData
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
    Log  Step 6-7
    Search and click on newly hired Person  ${common_data}[PersonNumber]
    Log  Step 8
    Input Effective As of Date  ${data}[EffectiveDate]
    Log  Step 9
    Add a Life Event and Save  Benefit Admin
    Wait And Verify Page Contains Element  ${potential_life_events_benefit_admin}  5s  Benefit Admin is not displayed under Potential Life Events
    Log  Step 10
    Click Actions and Select an Action  Evaluate Life Events
    Log  Step 11
    Verify Enrollment Button is displayed
    Click Enroll Option and Submit
