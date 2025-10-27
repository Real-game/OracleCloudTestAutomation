*** Settings ***
Library  DataDriver  ../CSV/td_TC003_09_Verify_valid_GL_code_combination_is_auto_populated_when_user_selects_the_first_segment_Business_Line_and_second_segment_Cost_Center_of_the_GL_Code.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Verify valid GL code combination is auto populated when user selects the first segment (Business Line) and second segment (Cost Center) of the GL Code
...            Prerequisite: GL Codes to be present in EBS
...            Environment Specific Data:  Login User; Valid Business Line; Valid Cost Center
...            Reusable Data: Property Workspace Name;MX CRE File;Contract Name;Contract Type;Contract Rent Structure;Status;Original Contract Start Date;Current Term Start Date;Current Term Expiry Date;Tenant Entity Type;Landlord Entity Type;Process Rent;Tax Classification;CAPEX-OPEX;
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify valid GL code combination is auto populated when user selects the first segment (Business Line) and second segment (Cost Center) of the GL Code

*** Variables ***
${json_path}    ./TestData/td_TC003_09_Verify_valid_GL_code_combination_is_auto_populated_when_user_selects_the_first_segment_Business_Line_and_second_segment_Cost_Center_of_the_GL_Code.json
${csv_path}  ./CSV/td_TC003_09_Verify_valid_GL_code_combination_is_auto_populated_when_user_selects_the_first_segment_Business_Line_and_second_segment_Cost_Center_of_the_GL_Code.csv

*** Test Cases ***
TC003.09 - Verify valid GL code combination is auto populated when user selects the first segment (Business Line) and second segment (Cost Center) of the GL Code with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type} ${CRE_process_rent_value} ${tax_classification_value} ${Business_Line} ${Cost_Center}
    [Tags]  PropertyContract  ModifyData

*** Keywords ***
Verify valid GL code combination is auto populated when user selects the first segment (Business Line) and second segment (Cost Center) of the GL Code
    [Arguments]  ${login_user}  ${property_workspace_name}  ${MX_cre_file_number}  ${contract_type}  ${contract_name}  ${contract_rent_structure}  ${status}  ${tenant_entity_type}  ${landlord_entity_type}  ${CRE_process_rent_value}  ${tax_classification_value}  ${Business_Line}  ${Cost_Center}
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
    Input Current Term Start Date  ${yesterday_date}
    Input Current Term Expiry Date  ${today_date}
    Log  Step 5
    Select Tenant Entity Type  ${tenant_entity_type}
    Log  Step 6
    Select Landlord Entity Type  ${landlord_entity_type}
    Select Payment Setup Section and Click Add
    Log  Step 8
    Select Process Rent Type  ${CRE_process_rent_value}
    Select Value from Advanced Search  Tax Classification  ${tax_classification_value}
    Log  Step 9
    Select Value from Advanced Search  Business Line  ${Business_Line}
    Select Value from Advanced Search  Cost Center  ${Cost_Center}
    Log  Step 10
    Verify GL Code Combination is Auto Populated