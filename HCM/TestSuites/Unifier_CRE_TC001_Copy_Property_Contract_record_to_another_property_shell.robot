*** Settings ***
Library  DataDriver  ../CSV/td_CRE_TC001_Copy_Property_Contract_record_to_another_property_shell.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Copy_Property_Contract_record_to_another_property_shell
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  property_workspace_name,MX_cre_file_number,contract_type,contract_name,contract_rent_structure,status,tenant_entity_type,landlord_entity_type,CRE_process_rent_value,tax_classification_value,capex_opex_value,li_short_description_value,rent_category_value,payment_type_value,payment_amount_before_hst_value,payment_frequency_value,payment_end_date_value,proration_method_value,organization_id
...            Dynamic Data:  Not Applicabl

*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Copy Property Contract record to another property shell

*** Variables ***
${json_path}    ./TestData/td_CRE_TC001_Copy_Property_Contract_record_to_another_property_shell.json
${csv_path}  ./CSV/td_CRE_TC001_Copy_Property_Contract_record_to_another_property_shell.csv

*** Test Cases ***
CRE_TC001 Copy Property Contract record to another property shell with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type} ${CRE_process_rent_value} ${tax_classification_value} ${capex_opex_value} ${li_short_description_value} ${rent_category_value} ${payment_type_value} ${payment_amount_before_hst_value} ${payment_frequency_value} ${payment_end_date_value} ${proration_method_value} ${organization_id}
    [Tags]  PropertyContractBUTestCase  ModifyData

*** Keywords ***
Copy Property Contract record to another property shell
    [Arguments]  ${login_user}  ${MX_cre_file_number}  ${contract_type}  ${contract_name}  ${contract_rent_structure}  ${status}  ${tenant_entity_type}  ${landlord_entity_type}  ${copied_to_property_shell_number}
    Log  Step 1
    Unifier Login Using  ${login_user}
    Log  Step 2
    Click on home icon in landing Page
    Click on + icon and select MX CRE BU property shell
    Click on Property Contracts BU under CRE Portfolio Management
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
    Input Current Term Start Date  ${today_date}
    Input Current Term Expiry Date  ${today_date}
    Log  Step 5
    Select Tenant Entity Type  ${tenant_entity_type}
    Log  Step 6
    Select Landlord Entity Type  ${landlord_entity_type}
    Log  Step 7
    Copy property contract to another property shell  ${copied_to_property_shell_number}
    Click on Submit button in Property Contract page
    ${record_number}    Extract the record number from confirmation Notification
    ${corrected_record_number}=  Remove String  ${record_number}  ${SPACE}
    Select OK in Confirmation Notification
    Select the created property contract line item   ${corrected_record_number}
    ${ref_contract_number}   Extract the copied property contract number
    Unselect Frame
    Sleep  10s
    Click on + Icon and Select Property Workspace  ${copied_to_property_shell_number}
    Select Property Contracts form CRE Portfolio Mgmt
    Select the created property contract line item  ${ref_contract_number}

