*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Library  DataDriver  ../CSV/Unifier_TC_Update_GLCODE_CostCentre.csv

*** Settings ***
Suite Setup   Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup   Before Suite for Unifier Test
Test Teardown   After Suite
Test Template  To update the GL Code and Cost center Field in CRE Master Log

*** Variables ***
${json_path}    ./TestData/td_Unifier_TC_Update_GLCODE_CostCentre.json
${csv_path}     ./CSV/Unifier_TC_Update_GLCODE_CostCentre.csv


*** Test Cases ***
To update the GL Code and Cost center Field in CRE Master Log with - ${Id} ${login_user} ${Record_Number} ${Item_No} ${Cost_Center} ${GL_Code_Combo}

*** Keywords ***
To update the GL Code and Cost center Field in CRE Master Log
    [Arguments]   ${login_user}  ${Record_Number}  ${Item_No}  ${Cost_Center}  ${GL_Code_Combo}
    Log  Step 1 - 6
    Unifier Login Using  ${login_user}
    Log  Step 7
    Change to Proxy Connection
    Log	 Step 8 - 9
    Click on home icon in landing Page
    Click on CRE Master Log and select Property Contracts
    Switch to Property Contract Frame
    Log  Step 10 - 13
    Click on Search and select record number  ${Record_Number}
    Log  Step 14
    Click Edit Record
    Log  Step 15
    Click on Payment Setup tab
    Log  Step 16
    Select Payment Setup record line  ${Item_No}
    Log  Step 17
    Clear the data present in Cost Center
    Log  Step 18 - 22
    Enter the value in Cost Center  ${Cost_Center}
    Log  Step 23
    Clear the data present in GL Code Combo
    Log  Step 24 - 28
    Enter the GL Code Combo value  ${GL_Code_Combo}
    Log  Step 29 - 30
    Click Save And Submit
