*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/Unifier_ContractReceivables.robot
Resource  ../PageObjects/Unifier_Tasks.robot
Documentation  Validate Invoice(s) - CRE team Validates the Invoices for Lease, Easement, License, Sublease/Sublicense, Oper/Maint and status changes to "Pending_Review"
...            Prerequisite:
...            Environment Specific Data:  Login User
...            Reusable Data:  Workspace Name; Contract Receivable Name to be present in Tasks
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC014_11_Validate_Invoice_CRE_team_Validates_the_Invoices_for_Lease_Easement_License_Sublease_Sublicense_Oper_Maint_and_status_changes_to_Pending_Review.json
${csv_path}  ./CSV/td_TC014_11_Validate_Invoice_CRE_team_Validates_the_Invoices_for_Lease_Easement_License_Sublease_Sublicense_Oper_Maint_and_status_changes_to_Pending_Review.csv

*** Test Cases ***
Scenario: Validate Invoice(s) - CRE team Validates the Invoices for Lease, Easement, License, Sublease/Sublicense, Oper/Maint and status changes to "Pending_Review"
    [Tags]  PropertyContract  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  ${data}[Login User]
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select a Property Workspace  ${data}[Property Workspace Name]
    Log  Step 3
    Select Tasks Menu  ${data}[Property Workspace Name]
    Log  Step 4
    Select Existing Contract Receivables  ${data}[Property Workspace Name]  ${data}[Contract Receivable Name]
    Log  Step 5
    Click Accept Button
    Select Payment Details Tab
    Log  Step 6
    Click Send and Select Workflow Action  ${data}[Property Workspace Name]  Send to Finance Review
    Log  Step 7
    Select Contract Receivables from CRE Cost Mgmt  ${data}[Property Workspace Name]
    Log  Step 8
    Verify Invoice Status  ${data}[Property Workspace Name]  ${data}[Contract Receivable Name]  Pending_Review