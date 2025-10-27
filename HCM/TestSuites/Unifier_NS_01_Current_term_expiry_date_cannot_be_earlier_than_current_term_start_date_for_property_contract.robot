*** Settings ***
Library  DataDriver  ../CSV/td_Unifier_Negative_scenarios_test_data.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Current term Expiry Date cannot be earlier than Current term Start Date for Property Contract
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name:Contract Receivable Name to be present in Tasks
...            Dynamic Data:  Not Applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Validate the error message of Current term Expiry Date cannot be earlier than Current term Start Date for Property Contract

*** Variables ***
${json_path}    ./TestData/td_Unifier_Negative_scenarios_test_data.json
${csv_path}  ./CSV/td_Unifier_Negative_scenarios_test_data.csv

*** Test Cases ***
Current term Expiry Date cannot be earlier than Current term Start Date for Property Contract with - ${Id} ${login_user} ${property_workspace_name} ${MX_cre_file_number} ${contract_type} ${contract_name} ${contract_rent_structure} ${status} ${tenant_entity_type} ${landlord_entity_type}
    [Tags]  UnifierNegativeTest  ReadOnly

*** Keywords ***
Validate the error message of Current term Expiry Date cannot be earlier than Current term Start Date for Property Contract
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
    Input Original Contract Start Date  ${yesterday_date}
    Input Current Term Start Date  ${today_date}
    Input Current Term Expiry Date  ${yesterday_date}
    Log  Step 5
    Select Tenant Entity Type  ${tenant_entity_type}
    Log  Step 6
    Select Landlord Entity Type  ${landlord_entity_type}
    Log  Step 7
    Click on Submit button in Property Contract page
    Validate the error message   Contract Date Validation : Current term Expiry Date cannot be earlier than Current term Start Date