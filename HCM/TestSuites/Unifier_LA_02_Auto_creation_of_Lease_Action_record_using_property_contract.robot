*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/UnifierLeaseActions.robot
Library  DataDriver  ../CSV/td_LA_02_Auto_creation_of_Lease_Action_record_using_property_contract.csv
Documentation  Auto_creation_of_Lease_Action_record_using_property_contract
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name:Contract Receivable Name to be present in Tasks
...            Dynamic Data:  Not Applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Auto create lease action record from Property contract

*** Variables ***
${json_path}    ./TestData/td_LA_02_Auto_creation_of_Lease_Action_record_using_property_contract.json
${csv_path}  ./CSV/td_LA_02_Auto_creation_of_Lease_Action_record_using_property_contract.csv

*** Test Cases ***
Auto creation of lease action record using property contract with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type} ${short_description} ${contract_option_type} ${renewal_extension_date} ${option_status}
    [Tags]  LeaseActionTestCase002

*** Keywords ***
Auto create lease action record from Property contract
    [Arguments]  ${Id}  ${login_user}  ${property_workspace_name}  ${MX_cre_file_number}  ${contract_type}  ${contract_name}  ${contract_rent_structure}  ${status}  ${tenant_entity_type}  ${landlord_entity_type}  ${short_description}  ${contract_option_type}  ${renewal_extension_date}  ${option_status}
    Log  Step 1
    Unifier Login Using  ${login_user}
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Property Workspace  ${property_workspace_name}
    Select Property Contracts form CRE Portfolio Mgmt
    Log  Step 3
    Click Create Property Contract Icon
    Select Contract Type  ${contract_type}
    Input MX CRE File # and Contract Name  ${MX_cre_file_number}  ${contract_name}
    Select Contract Rent Structure  ${contract_rent_structure}
    Select Status  ${status}
    Log  Step 4
    ${today_date}=  Get Current Date MM DD YYYY
    ${yesterday_date}=   Get Yesterday Date MM DD YYYY
    Input Original Contract Start Date  ${yesterday_date}
    Input Current Term Start Date  ${yesterday_date}
    Input Current Term Expiry Date  ${today_date}
    Log  Step 5
    Select Tenant Entity Type  ${tenant_entity_type}
    Log  Step 6
    Select Landlord Entity Type  ${landlord_entity_type}
    Log  Step 7
    Select Options and Critical Date Section and Click Add
    Log  Step 6
    Input Option Details  ${short_description}  ${contract_option_type}  ${yesterday_date}  ${yesterday_date}  ${renewal_extension_date}  ${option_status}
    Log  Step 7
    Save Option Critical Date Line Item  ${contract_option_type}
    Submit Record after adding Line Item
    Select the created property contract  ${contract_name}
    Sleep  15s
    Select Options and Critical Date Section tab
    ${lease_action_number}  Extract lease action record number
    Switch Window  title: Primavera Unifier
    Sleep  5s
    Select Lease Actions form CRE Portfolio Mgmt
    Select lease actions frame
    Search for the lease action record  ${lease_action_number}
    Verify the presence of lease action record  ${lease_action_number}