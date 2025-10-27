*** Settings ***
Library  DataDriver  ../CSV/td_Customer_integration_negative_scenarios.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierCustomers.robot


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify Customer Record cannot be deleted

*** Variables ***
${json_path}    ./TestData/td_Customer_integration_negative_scenarios.json
${csv_path}  ./CSV/td_Customer_integration_negative_scenarios.csv

*** Test Cases ***
TC002.04-Verify Customer Record cannot be deleted with - ${Id} ${Login_User}
    [Tags]  CustomerIntegrationTestCase  ReadOnly

*** Keywords ***
Verify Customer Record cannot be deleted
    [Arguments]  ${Login_User}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Company Workspace
    Select a Customer from Company Logs
    Select Customers table frame
    Select First Customer Record
    Terminate the Record
    Verify that customer record cannot be deleted