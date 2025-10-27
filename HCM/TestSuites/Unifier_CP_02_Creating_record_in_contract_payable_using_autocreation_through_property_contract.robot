*** Settings ***
Library  DataDriver  ../CSV/td_CP_02_Creating_record_in_contract_payable_using_autocreation_through_property_contract.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/Unifier_ContractPayables.robot
Documentation  Creating record in contract payable using auto creation through property contract
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  property_workspace_name,contract_name,property_workspace_name,contract_type,contract_type2,contract_name,contract_rent_structure, status,tenant_entity_type,landlord_entity_type,CRE_process_rent_value,tax_classification_value,capex_opex_value,li_short_description_value,rent_category_value,payment_type_valuec,payment_amount_before_hst_value,payment_frequency_value,payment_end_date_value,proration_method_value,organization_id
...            Dynamic Data:  Not Applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Auto create contract payable record

*** Variables ***
${json_path}    ./TestData/td_CP_02_Creating_record_in_contract_payable_using_autocreation_through_property_contract.json
${csv_path}  ./CSV/td_CP_02_Creating_record_in_contract_payable_using_autocreation_through_property_contract.csv

*** Test Cases ***
Creating record in contract payable using auto creation through property contract with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type} ${CRE_process_rent_value} ${tax_classification_value} ${capex_opex_value} ${li_short_description_value} ${rent_category_value} ${payment_type_value} ${payment_amount_before_hst_value} ${payment_frequency_value} ${payment_end_date_value} ${proration_method_value} ${organization_id}
    [Tags]  ContractPayableTestCase  ModifyData

*** Keywords ***
Auto create contract payable record
    [Arguments]  ${login_user}  ${property_workspace_name}  ${MX_cre_file_number}  ${contract_type}  ${contract_name}  ${contract_rent_structure}  ${status}  ${tenant_entity_type}  ${landlord_entity_type}  ${CRE_process_rent_value}  ${tax_classification_value}  ${capex_opex_value}  ${li_short_description_value}  ${rent_category_value}  ${payment_type_value}  ${payment_amount_before_hst_value}  ${payment_frequency_value}  ${payment_end_date_value}  ${proration_method_value}  ${organization_id}
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
    Click on Payment Setup tab
    Click on Add payment setup button
    Validate General Payment Setup information   ${CRE_process_rent_value}  ${contract_rent_structure}  ${tax_classification_value}  ${capex_opex_value}  ${li_short_description_value}
    Validate Payment General setup block  ${rent_category_value}  ${payment_type_value}  ${payment_amount_before_hst_value}  ${payment_frequency_value}  ${today_date}  ${payment_end_date_value}  ${proration_method_value}
    Validate Vendor Information block
    Validate OPEX Codes block  ${organization_id}
    Save the payment setup line item
    Submit Record after adding Line Item
    Select the created property contract  ${contract_name}
    ${ref_contract_number}   Extract the reference property contract number
    Click on Payment Setup tab
    ${record_number}  Extract the auto created contract payable record number
    Switch Window   title: Primavera Unifier
    Sleep  5s
    Select Contract Payables from CRE Cost Management
    Switch to contract payable frame
    Search for the contract payable record  ${record_number}
    Select the contract payable record  ${record_number}
    Sleep  3s
    Switch Window   NEW
    Verify Reference property contract number  ${ref_contract_number}
    Verify Contract Payable title  ${contract_name}
    Verify Contract Name  ${contract_name}
    Verify MX CRE File #  ${MX_cre_file_number}
    Click on payment details tab in Contract payable item
    Verify Payment type  ${payment_type_value}
    Verify contract line item  ${li_short_description_value}
    Verify CAPEX OPEX  ${capex_opex_value}

