*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_Tasks.robot
Resource  ../PageObjects/Unifier_ContractReceivables.robot
Documentation  Reject Invoice -Finance team rejects a Contract Receivable
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name:Contract Receivable Name to be present in Tasks
...            Dynamic Data:  Not Applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_Contract_Receivable_test_data.json
${csv_path}  ./CSV/td_Contract_Receivable_test_data.csv

*** Test Cases ***

Scenario: E2E1-10-TC014.12 -Reject Invoice -Finance team rejects a Contract Receivable (A-R)
    [Tags]  ContractReceivableTestCase002  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  V-ACC-Raghavi.Uthayakumar@metrolinx.com
    Log  Step 2
    Click on home icon in landing Page
    Click on + Icon and Select Property Workspace  ${data}[Property Workspace Name]
    Log  Step 3
    Select Tasks Menu  ${data}[Property Workspace Name]
    Log  Step 4
    Select Existing Contract Receivables  ${data}[Property Workspace Name]  ${data}[Contract Receivable Name]
    Log  Step 5
    Click Accept Button
    Click on payment details tab in Contract receivable item
    Verify Payment Amount  ${data}[Payment Amount]
    Click on Contract Receivable details tab
    Post Comments  ${data}[Comments]
    Log  Step 6
    Click Send and Select Workflow Action  ${data}[Property Workspace Name]  Send to Finance Review
    Log  Step 7
    Select Contract Receivables from CRE Cost Mgmt  ${data}[Property Workspace Name]
    Log  Step 8
    Verify Invoice Status  ${data}[Property Workspace Name]  ${data}[Contract Receivable Name]  Pending_Review