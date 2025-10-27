*** Settings ***
Library  DataDriver  ../CSV/td_Unifier_NS_03_Negative_scenarios_test_data.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Current term Expiry Date cannot be earlier than Original Contract Start Date for Property Contract
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name:Contract Receivable Name to be present in Tasks
...            Dynamic Data:  Not Applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Validate error message of Current term Expiry Date cannot be earlier than Original Contract Start Date for Property Contract

*** Variables ***
${json_path}    ./TestData/td_Unifier_NS_03_Negative_scenarios_test_data.json
${csv_path}  ./CSV/td_Unifier_NS_03_Negative_scenarios_test_data.csv

*** Test Cases ***
Current term Expiry Date cannot be earlier than Original Contract Start Date for Property Contract with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type} ${CRE_process_rent_value} ${tax_classification_value} ${capex_opex_value} ${li_short_description_value} ${rent_category_value} ${payment_type_value} ${payment_amount_before_hst_value} ${payment_frequency_value} ${payment_end_date_value} ${proration_method_value} ${organization_id} ${Vendor_ID} ${Vendor_Site_ID}
    [Tags]  UnifierNegativeTest  ReadOnly

*** Keywords ***
Validate error message of Current term Expiry Date cannot be earlier than Original Contract Start Date for Property Contract
    [Arguments]  ${login_user}  ${property_workspace_name}  ${MX_cre_file_number}  ${contract_type}  ${contract_name}  ${contract_rent_structure}  ${status}  ${tenant_entity_type}  ${landlord_entity_type}  ${CRE_process_rent_value}  ${tax_classification_value}  ${capex_opex_value}  ${li_short_description_value}  ${rent_category_value}  ${payment_type_value}  ${payment_amount_before_hst_value}  ${payment_frequency_value}  ${payment_end_date_value}  ${proration_method_value}  ${organization_id}  ${Vendor_ID}  ${Vendor_Site_ID}
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
    ${today_date}=  Get Current Date MON DD YYYY
    ${yesterday_date}=   get yesterday date mmm dd yyyy
    Input Original Contract Start Date  ${today_date}
    Sleep  2s
    Input Current Term Start Date  ${yesterday_date}
    Sleep  3s
    Input Current Term Expiry Date  ${today_date}
    Log  Step 5
    Select Tenant Entity Type  ${tenant_entity_type}
    Log  Step 6
    Select Landlord Entity Type  ${landlord_entity_type}
    Log  Step 7
    Click on Payment Setup tab
    Click on Add payment setup button
    Validate General Payment Setup information   ${CRE_process_rent_value}  ${contract_rent_structure}  ${tax_classification_value}  ${capex_opex_value}  ${li_short_description_value}
    Validate Payment General setup block  ${rent_category_value}  ${payment_type_value}  ${payment_amount_before_hst_value}  ${payment_frequency_value}  ${today_date}  ${yesterday_date}  ${proration_method_value}
#    Validate Payment General setup block  ${rent_category_value}  ${payment_type_value}  ${payment_amount_before_hst_value}  ${payment_frequency_value}  ${today_date}  ${payment_end_date_value}  ${proration_method_value}
#    Validate Customer Payer Information block
#    Validate OPEX Codes block  ${organization_id}
    Select Value from Advanced Search  Vendor ID  ${Vendor_ID}
    Select Value from Advanced Search  Vendor Site ID  ${Vendor_Site_ID}
    Save the payment setup line item
    Validate the error message   Payment Date Validation : Payment End Date cannot be earlier than Start Date.