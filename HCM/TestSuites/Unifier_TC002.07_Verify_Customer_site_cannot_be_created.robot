*** Settings ***
Library  DataDriver  ../CSV/td_Customer_integration_negative_scenarios.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierCustomersSite.robot


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify Customer Site Record cannot be created

*** Variables ***
${json_path}    ./TestData/td_Customer_integration_negative_scenarios.json
${csv_path}  ./CSV/td_Customer_integration_negative_scenarios.csv

*** Test Cases ***
TC002.07-Verify Customer Site Record cannot be created with - ${Id} ${Login_User}
    [Tags]  CustomerIntegrationTestCase  ReadOnly

*** Keywords ***
Verify Customer Site Record cannot be created
    [Arguments]  ${Login_User}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Company Workspace
    Select Customer Site link from Company Logs
    Select Customer Site table frame
    Verify Create Customer sites button is not displayed