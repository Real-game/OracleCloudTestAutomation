*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/Unifier_ContractReceivables.robot
Resource  ../PageObjects/Unifier_Tasks.robot
Library  DataDriver  ../CSV/Unifier_TC_Update_GLCODE_CostCentre_under_ContractReceivables.csv

*** Settings ***
Suite Setup   Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup   Before Suite for Unifier Test
Test Teardown   After Suite
Test Template  To update the GL Code and Cost center Field in CRE Master Log

*** Variables ***
#${json_path}    ./TestData/td_Unifier_TC_Update_GLCODE_CostCentre.json
${csv_path}     ./CSV/Unifier_TC_Update_GLCODE_CostCentre_under_ContractReceivables.csv


*** Test Cases ***
To update the GL Code and Cost center Field in CRE Master Log with - ${Id} ${login_user} ${invoice_ref_number_input} ${Item_No} ${Cost_Center} ${GL_Code_Combo}

*** Keywords ***
To update the GL Code and Cost center Field in CRE Master Log
    [Arguments]   ${login_user}  ${invoice_ref_number_input}  ${Item_No}  ${Cost_Center}  ${GL_Code_Combo}
    Log  Step 1 - 6
#    Unifier Login Using  ${login_user}
    Sleep  120s
    Log	 Step 7-8
    Click on CRE Master Log and select Contract Recievables
    Switch to contract receivable iframe
    Log  Step 10 - 13
    Search for the contract receivable record  ${invoice_ref_number_input}
    Log  Step 14
    Select record number from contract recievables
    Log  Step 15
    Select Accept button in Contract Receivables
    Click on payment details tab in Contract receivable item
    Log  Step 16
    Clear the data present in Cost Center
    Log  Step 18 - 22
    Enter the value in Cost Center  ${Cost_Center}
    Log  Step 23
    Clear the data present in GL Code Combo
    Log  Step 24 - 28
    Enter the GL Code Combo value  ${GL_Code_Combo}
    Log  Step 29 - 30
    Click Save Contract
    Send and Select Workflow Action  Send to Finance Review