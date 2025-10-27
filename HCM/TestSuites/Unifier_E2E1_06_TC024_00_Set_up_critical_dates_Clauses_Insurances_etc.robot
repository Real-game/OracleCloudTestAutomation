*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Set_up_critical_dates_Clauses_Insurances_etc
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name,Contract Name,Allowance Type,Allowance Amount,Allowance Type
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_E2E1_06_TC024_00_Set_up_critical_dates_Clauses_Insurances_etc.json
${csv_path}  ./CSV/td_E2E1_06_TC024_00_Set_up_critical_dates_Clauses_Insurances_etc.csv

*** Test Cases ***

Scenario: Set up critical dates, Clauses, Insurances…etc.
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
    Select Existing Property Contract  ${data}[Contract Name]
    Log  Step 4
    Click Edit
    Select Allowance Section and Click Add
    Log  Step 5
    Select Allowance type  ${data}[Allowance Type]
    Log  Step 6
    Input Allowance Amount  ${data}[Allowance Amount]
    Log  Step 7
    Save Allowance Line Item  ${data}[Allowance Type]
    Log  Step 8
    Submit Record after adding Line Item