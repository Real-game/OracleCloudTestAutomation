*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/Unifier_ContractReceivables.robot
Resource  ../PageObjects/Unifier_Tasks.robot
Documentation  Review invoice records and confirm that status of invoices is changed to Pending Payment validate Payment due date and EBS Information (EBS Invoice #, EBS Invoice ID, EBS creation date)
...            Prerequisite: Corresponding EBS Invoice #, EBS Creation Date, EBS Invoice ID has to be manually filled in the CSV file
...            Environment Specific Data:  Login User
...            Reusable Data:  Workspace Name; Contract Receivable Name with Payment Pending Status
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_E2E1_19_TC014_21_View_Invoice_record_Review_invoice_records_and_confirm_that_status_of_invoices_is_changed_to_Pending_Payment_validate_EBS_Info.json
${csv_path}  ./CSV/td_E2E1_19_TC014_21_View_Invoice_record_Review_invoice_records_and_confirm_that_status_of_invoices_is_changed_to_Pending_Payment_validate_EBS_Info.csv

*** Test Cases ***
Scenario: Review invoice records and confirm that status of invoices is changed to Pending Payment validate Payment due date and EBS Information (EBS Invoice #, EBS Invoice ID, EBS creation date)
    [Tags]  PropertyContract  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  ${data}[Login User]
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select a Property Workspace  ${data}[Property Workspace Name]
    Log  Step 3
    Select Contract Receivables from CRE Cost Mgmt  ${data}[Property Workspace Name]
    Log  Step 4
    Verify Invoice Status  ${data}[Property Workspace Name]  ${data}[Contract Receivable Name]  Pending_Payment
    Log  Step 5
    Select Contract Receivables  ${data}[Contract Receivable Name]
    Log  Step 6
    Verify Payment Due Date  ${data}[Payment Due Date]
    Log  Step 7
    Verify EBS Payment Information  ${data}[Invoice Number EBS]  ${data}[Invoice ID EBS]   ${data}[Creation Date EBS]
