*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Transfer Event created in Benefits Enrollment
...            Prerequisite:  HR-17; Newly Transferred Person details should be present in environment
...            Environment Specific Data:  Login User(Benefits_common_test_data.csv); Person Number of respective newly transferred employee(Benefits_common_test_data.csv); Transfer Date to verify
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC002_Life_Event_Transfer.json
${csv_path}  ./CSV/td_TC002_Life_Event_Transfer.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Transfer Event created in Benefits Enrollment
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
#    Wait And Verify Page Contains Text  Occured on ${data}[TransferDate]  5s  Transfer Date is not displayed as expected
    element should contain  ${potential_life_events_transfer_date}  Occurred on ${data}[TransferDate]