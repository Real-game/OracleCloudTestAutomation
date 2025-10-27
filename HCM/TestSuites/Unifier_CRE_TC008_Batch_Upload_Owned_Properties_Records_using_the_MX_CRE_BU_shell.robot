*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierOwnedProperties.robot
Resource  ../PageObjects/UnifierCreateNewOwnedProperties.robot
Documentation  Batch Upload Owned Properties Records using the MX CRE BU shell
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  record_number,copied_owned_property_number,corrected_record_number
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC011_25_Update_a_Property_Contract_and_add_a_new_Line_Item_in_Payment_Setup_with_Overhold.json
${csv_path}  ./CSV/td_TC011_25_Update_a_Property_Contract_and_add_a_new_Line_Item_in_Payment_Setup_with_Overhold.csv

*** Test Cases ***
Scenario: CRE-TC008 Batch Upload Owned Properties Records using the MX CRE BU shell
    [Tags]  OwnedPropertyBUTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  V-ACC-Senthil.Thangaraj@metrolinx.com
    Log  Step 2
    Click on home icon in landing Page
    Click on + icon and select MX CRE BU property shell
    Click on Owned Properties BU under CRE Portfolio Management
    Click on Create Owned Property BU button
    Validate Property Information block  OPEX  Owned
    Validate Title Information block   Jayapal  Raghavi  Premkumar  78780
    Validate Address Information block  East Street  Toronto
    Validate Property Use Block  MX Owned  Yes  Future Description  Jun/26/2025  Transitional Area Comments
    Validate PIN Mileage Survey Block  01010101  02020202  Survey plans value  5000  Mileage Comments
    Validate Area Calculation Block   Land  Yes  2400  3  2  Area comments
    Validate building demolitions block  Jun/26/2025  Demolition Comments
    Validate property disposed details block   FULL  Jun/26/2025  70000  2400  Disposition details  MPM Company
    Validate Expropriation Details block  Yes  Yes  Yes  Section 24  Expropriation Comments
    Copy owned property to another property shell  FORTECON DRIVE MSF
    Submit Owned Property
    ${record_number}    Extract the record number from confirmation Notification
    ${corrected_record_number}=  Remove String  ${record_number}  ${SPACE}
    Select OK in Confirmation Notification
    Select an existing owned property line item   ${corrected_record_number}
    ${copied_owned_property_number}   Extract the copied owned property number
    Unselect Frame
    Click on + Icon and Select Property Workspace  1 FORTECON DRIVE MSF
    Select Owned Properties form CRE Portfolio Mgmt
    Select an existing owned property line item   ${copied_owned_property_number}
    Sleep  10s
