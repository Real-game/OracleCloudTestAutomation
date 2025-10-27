*** Settings ***
Library  DataDriver  ../CSV/td_CP_01_Sending_contract_payable_record_for_financial_review.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_Tasks.robot
Resource  ../PageObjects/Unifier_ContractPayables.robot
Documentation  Sending contract payable record for Financial review
...            Prerequisite:  Record number should be created
...            Environment Specific Data:  Login_user
...            Reusable Data:  property_workspace_name,record_number,ref_contract_number,payment_amount,property_workspace_name
...            Dynamic Data:  Not Applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Send contract payable record

*** Variables ***
${json_path}    ./TestData/td_CP_01_Sending_contract_payable_record_for_financial_review.json
${csv_path}  ./CSV/td_CP_01_Sending_contract_payable_record_for_financial_review.csv

*** Test Cases ***
Send contract payable record to Finance review with - ${Id} ${login_user} ${property_workspace_name} ${record_number} ${ref_contract_number} ${payment_amount} ${organization}
    [Tags]  ContractPayableTestCase  ModifyData

*** Keywords ***
Send contract payable record
    [Arguments]  ${Id}  ${login_user}  ${property_workspace_name}  ${record_number}  ${ref_contract_number}  ${payment_amount}  ${organization}
    Log  Step 1
    Unifier Login Using  ${login_user}
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Property Workspace  ${property_workspace_name}
    Log  Step 3
    Select Contract Payables from CRE Cost Management
    Switch to contract payable frame
    Search for the contract payable record  ${record_number}
    Select the contract payable record  ${record_number}
    Sleep  3s
    Switch Window   NEW
    Verify Reference property contract number  ${ref_contract_number}
    Click Accept Button in Contract Payable
    #Validate GL data  ${gl_date}  ${organization}
    Click on payment details tab in Contract payable item
    Verify Payment Amount  ${payment_amount}
    Click Send and Select Workflow Action in Contract Payable  ${property_workspace_name}  Send to Finance Review