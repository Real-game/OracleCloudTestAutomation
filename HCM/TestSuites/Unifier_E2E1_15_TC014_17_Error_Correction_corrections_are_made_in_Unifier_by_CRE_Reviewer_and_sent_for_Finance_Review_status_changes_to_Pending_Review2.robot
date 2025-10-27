*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/Unifier_ContractReceivables.robot
Resource  ../PageObjects/Unifier_Tasks.robot
Documentation  Error Correction - corrections are made in Unifier by CRE Reviewer and sent for Finance Review status changes to Pending_Review
...            Prerequisite:
...            Environment Specific Data:  Login User
...            Reusable Data:  Workspace Name; Contract Receivable Name to be present in Tasks
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_E2E1_15_TC014_17_Error_Correction_corrections_are_made_in_Unifier_by_CRE_Reviewer_and_sent_for_Finance_Review_status_changes_to_Pending_Review2.json
${csv_path}  ./CSV/td_E2E1_15_TC014_17_Error_Correction_corrections_are_made_in_Unifier_by_CRE_Reviewer_and_sent_for_Finance_Review_status_changes_to_Pending_Review2.csv

*** Test Cases ***
Scenario: Error Correction - corrections are made in Unifier by CRE Reviewer and sent for Finance Review status changes to Pending_Review
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
    Update Customer Site ID in AR Payment Information  ${data}[Customer Site ID]
    Log  Step 6
    Click Send and Select Workflow Action  ${data}[Property Workspace Name]  Send to Finance Review
    Log  Step 7
    Select Contract Receivables from CRE Cost Mgmt  ${data}[Property Workspace Name]
    Log  Step 8
    Verify Invoice Status  ${data}[Property Workspace Name]  ${data}[Contract Receivable Name]  Pending_Review