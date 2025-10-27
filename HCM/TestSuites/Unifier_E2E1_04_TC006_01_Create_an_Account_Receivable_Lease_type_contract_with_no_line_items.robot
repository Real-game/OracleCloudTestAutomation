*** Settings ***
Library  DataDriver  ../CSV/td_E2E1_04_TC006_01_Create_an_Account_Receivable_Lease_type_contract_with_no_line_items.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Create_an_Account_Receivable_Lease_type_contract_with_no_line_items
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  property_workspace_name,MX_cre_file_number,contract_type,contract_name,contract_rent_structure,status,tenant_entity_type,landlord_entity_type
...            Dynamic Data:  Not Applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Account Receivable lease type contract creation

*** Variables ***
${json_path}    ./TestData/td_E2E1_04_TC006_01_Create_an_Account_Receivable_Lease_type_contract_with_no_line_items.json
${csv_path}  ./CSV/td_E2E1_04_TC006_01_Create_an_Account_Receivable_Lease_type_contract_with_no_line_items.csv


*** Test Cases ***
Create an Account Receivable Lease type contract with no line item with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type}
    [Tags]  PropertyContractTestCase  ModifyData

*** Keywords ***
Account Receivable lease type contract creation
    [Arguments]  ${login_user}  ${property_workspace_name}  ${MX_cre_file_number}  ${contract_type}  ${contract_name}  ${contract_rent_structure}  ${status}  ${tenant_entity_type}  ${landlord_entity_type}
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
    Input Original Contract Start Date  ${today_date}
    Input Current Term Start Date  ${yesterday_date}
    Input Current Term Expiry Date  ${today_date}
    Log  Step 5
    Select Tenant Entity Type  ${tenant_entity_type}
    Log  Step 6
    Select Landlord Entity Type  ${landlord_entity_type}
    Log  Step 7
    Submit Record