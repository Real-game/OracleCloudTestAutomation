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

Scenario: View & update an Owned Properties line item record
    [Tags]  OwnedPropertyTest006  ModifyData
    #generatejson  ${csv_path}  ${json_path}
    #${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  V-ACC-Senthil.Thangaraj@metrolinx.com
    Log  Step 2
    Click on home icon in landing Page
    Click on Owned Properties under CRE Master Log
    #Click on + Icon and Select Property Workspace  CANPA GUIDEWAY
    #Select Owned Properties form CRE Portfolio Mgmt
    Select an existing owned Property   OWNED-02326
    Log  Step 3
    Switch to Owned property window
#    Edit the owned property
    Validate Property Use Block  MX Owned  Yes  Future Description  07/24/2023  Transitional Area Comments
    Submit Owned Property
    Sleep  10s