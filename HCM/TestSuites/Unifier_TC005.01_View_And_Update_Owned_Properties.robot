*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierOwnedProperties.robot
Resource  ../PageObjects/UnifierCreateNewOwnedProperties.robot


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_E2E1_04_TC006_01_Create_an_Account_Receivable_Lease_type_contract_with_no_line_items.json
#${csv_path}  ./CSV/td_E2E1_04_TC006_01_Create_an_Account_Receivable_Lease_type_contract_with_no_line_items.csv
*** Test Cases ***

Scenario: View and Update Owned Properties
    [Tags]  OwnedPropertyTest  ModifyData
    #generatejson  ${csv_path}  ${json_path}
    #${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  V-ACC-Senthil.Thangaraj@metrolinx.com
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Property Workspace  155 CORNWALL ROAD
    Log  Step 3
    Select the dashboard frame
    Click on menu next to My Dashboard
    Update the assessment roll number  2401-030-010-127-05
    Sleep  4s
    Unselect Frame
    Select Owned Properties form CRE Portfolio Mgmt
    Select an existing owned Property   OWNED-00512
    Log  Step 3
    Switch to Owned property window
    Edit the owned property
    Validate Address Information block  East Street  Toronto
    Verify Subject Assessment Number  2401-030-010-127-05
    Validate PIN Mileage Survey Block  050505  010101  Survey plans updated value  6000  Mileage Comments
    Submit Owned Property
    Sleep  10s