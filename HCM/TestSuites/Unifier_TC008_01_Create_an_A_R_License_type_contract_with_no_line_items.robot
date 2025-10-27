*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Create an A/R License type contract with no line items
...            Prerequisite: NA
...            Environment Specific Data:  Property Workspace Name;MX CRE File
...            Reusable Data:  Contract Name;Contract Type as License;Contract Rent Structure;Status;Original Contract Start Date;Current Term Start Date;Current Term Expiry Date;Tenant Entity Type;Landlord Entity Type
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC008_01_Create_an_A_R_License_type_contract_with_no_line_items.json
${csv_path}  ./CSV/td_TC008_01_Create_an_A_R_License_type_contract_with_no_line_items.csv
*** Test Cases ***

Scenario: Create an A/R License type contract with no line items
    [Tags]  PropertyContract  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  ${data}[Login User]
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Property Workspace  ${data}[Property Workspace Name]
    Select Property Contracts form CRE Portfolio Mgmt
    Log  Step 3
    Click Create Property Contract Icon
    Select Contract Type  ${data}[Contract Type]
    Input MX CRE File # and Contract Name  ${data}[MX CRE File]  ${data}[Contract Name]
    Select Contract Rent Structure  ${data}[Contract Rent Structure]
    Select Status  ${data}[Status]
    Log  Step 4
    Input Original Contract Start Date  ${data}[Original Contract Start Date]
    Input Current Term Start Date  ${data}[Current Term Start Date]
    Input Current Term Expiry Date  ${data}[Current Term Expiry Date]
    Log  Step 5
    Select Tenant Entity Type  ${data}[Tenant Entity Type]
    Log  Step 6
    Select Landlord Entity Type  ${data}[Landlord Entity Type]
    Log  Step 7
    Submit Record