*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC011_26_Update_an_existing_Property_Contract_with_an_expiry_3_years_later_and_add_2_OptionCritical_Dates.json
${csv_path}  ./CSV/td_TC011_26_Update_an_existing_Property_Contract_with_an_expiry_3_years_later_and_add_2_OptionCritical_Dates.csv

*** Test Cases ***

Scenario: Update an existing Property Contract with an expiry 3 years later and add 2 OptionCritical Dates
    [Tags]  PropertyContract  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  ${data}[Login User]
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select a Property Workspace  ${data}[Property Workspace Name]
    Select Property Contracts form CRE Portfolio Mgmt
    Log  Step 3
    Select Existing Property Contract  ${data}[Contract Name]
    Log  Step 4
    Click Edit
    Log  Step 5
    Select Options and Critical Date Section and Click Add
    Log  Step 6
    Input Option Details  ${data}[Short Description]  ${data}[Contract Option Type]  ${data}[No Earlier Notice Date]  ${data}[No Later Than Notice Date]  ${data}[Effective Renewal Extension Date]  ${data}[option_status]
    Log  Step 7
    Save Option Critical Date Line Item  ${data}[Contract Option Type]
    Log  Step 8
    Select Options and Critical Date Section and Click Add
    Log  Step 9
    Input Option Details  ${data}[Short Description2]  ${data}[Contract Option Type2]  ${data}[No Earlier Notice Date2]  ${data}[No Later Than Notice Date2]  ${data}[Effective Renewal Extension Date2]  ${data}[option_status]
    Log  Step 10
    Save Option Critical Date Line Item  ${data}[Contract Option Type2]
    Log  Step 11
    Submit Record after adding Line Item