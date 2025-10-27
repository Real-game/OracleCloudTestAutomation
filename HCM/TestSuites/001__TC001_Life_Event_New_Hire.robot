*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  New Hire Life event creation in Benefits Enrollment
...            Prerequisite:  HR-81, Newly Hired Person details should be present in environment
...            Environment Data:  Login User is environment specific, Person Name of respective new hired employee from HR-81 in <<First Name>>  <<Last name>>  format
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC001_Life_Event_New_Hire.json
${csv_path}  ./CSV/td_TC001_Life_Event_New_Hire.csv
*** Test Cases ***

Scenario: New Hire Life event creation in Benefits Enrollment
    [Tags]  BenefitsTestCase  ReadOnly
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
    Wait And Verify Page Contains Element  ${evaluated_life_events_new_hire}  5s  New Hire is not displayed under Evaluated Life Events
    Log  Step 9
    Wait And Verify Page Contains Element  ${potential_life_events_new_hire}  5s  New Hire is not displayed under Potential Life Events
    Scroll Element Into View  ${potential_life_events_new_hire}
    Sleep  15s
