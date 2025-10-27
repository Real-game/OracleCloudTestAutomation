*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Documentation  Add_an_OPEX_Line_item_to_an_existing_Property_Contract
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name,Contract Name,Contract Area Type,Unit of Measure,Process Rent,Rent Category,Payment Type,Rollup Area,Payment before HST,Payment Frequency,Overhold Payment,Start Date,End Date,Escalation Method,Next Payment Due Day,Latest Payment Due Day,Payment Notice Lead Time,Tax Classification,Customer ID,Customer Site ID,Business Line,Cost Center,GL Code Combo,Vendor ID,Vendor Site ID
...            Dynamic Data:  Not Applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_E2E1_05_TC014_00_Add_an_OPEX_Line_item_to_an_existing_Property_Contract.json
${csv_path}  ./CSV/td_E2E1_05_TC014_00_Add_an_OPEX_Line_item_to_an_existing_Property_Contract.csv

*** Test Cases ***
Scenario: Add an OPEX Line item to an existing Property Contract
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
    Select Payment Setup Section and Click Add
    Log  Step 5
    Input Document Area Details  ${data}[Contract Area Type]  ${data}[Unit of Measure]  ${data}[Doc of Area]
    Select Process Rent Type  ${data}[Process Rent]
    Select Rent Category  ${data}[Rent Category]
    Select Payment Type  ${data}[Payment Type]
    Select Rollup Area  ${data}[Rollup Area]
    Input Payment Amount before HST  ${data}[Payment before HST]
    Select Payment Frequency  ${data}[Payment Frequency]
    Select Overhold Payment  ${data}[Overhold Payment]
    Input Start Date  ${data}[Start Date]
    Input End Date  ${data}[End Date]
    Log  Step 6
    Select Escalation Method  ${data}[Escalation Method]
    Log  Step 7
    Select Next Payment Due Day  ${data}[Next Payment Due Day]
    Select Latest Payment Due Day  ${data}[Latest Payment Due Day]
    Select Payment Notice Lead Time  ${data}[Payment Notice Lead Time]
    Log  Step 8
    Select Value from Advanced Search  Tax Classification  ${data}[Tax Classification]
    Log  Step 9
    Select Value from Advanced Search  Customer ID  ${data}[Customer ID]
    Select Value from Advanced Search  Customer Site ID  ${data}[Customer Site ID]
    Log  Step 10
    Select CAPEX-OPEX option  ${data}[CAPEX-OPEX]
    Select Value from Advanced Search  Business Line  ${data}[Business Line]
    Select Value from Advanced Search  Cost Center  ${data}[Cost Center]
    Select Value from Advanced Search  GL Code Combo  ${data}[GL Code Combo]
    Log  Step 11
    Select Value from Advanced Search  Vendor ID  ${data}[Vendor ID]
    Select Value from Advanced Search  Vendor Site ID  ${data}[Vendor Site ID]
    Log  Step 12
    Save Line Item
    Log  Step 13
    Submit Record after adding Line Item
