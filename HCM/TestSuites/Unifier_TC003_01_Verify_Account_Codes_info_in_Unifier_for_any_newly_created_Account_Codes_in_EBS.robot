*** Settings ***
Library  DataDriver  ../CSV/td_TC003_01_Verify_Account_Codes_info_in_Unifier_for_any_newly_created_Account_Codes_in_EBS.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierGLCodes.robot
Documentation  Verify Account Codes info in Unifier for any newly created Account Codes in EBS
...            Prerequisite: Cost Center Code, Location Code and Account Code has to be created in EBS
...            Environment Specific Data:  Login User,Account Code,Cost Center Code,Location Code
...            Reusable Data:
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify Account Codes info in Unifier for any newly created Account Codes in EBS

*** Variables ***
${json_path}    ./TestData/td_TC003_01_Verify_Account_Codes_info_in_Unifier_for_any_newly_created_Account_Codes_in_EBS.json
${csv_path}  ./CSV/td_TC003_01_Verify_Account_Codes_info_in_Unifier_for_any_newly_created_Account_Codes_in_EBS.csv

*** Test Cases ***
TC003.01-Verify Account Codes info in Unifier for any newly created Account Codes in EBS with - ${Id} ${Login_User} ${Cost_Center_Code} ${Location_Code} ${Account_Code}
    [Tags]  GLIntegration  ReadOnly

*** Keywords ***
Verify Account Codes info in Unifier for any newly created Account Codes in EBS
    [Arguments]  ${Login_User}  ${Cost_Center_Code}  ${Location_Code}  ${Account_Code}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Select MX Company in the Home Page
    Log  Step 3
    Select Cost Centers from GL Codes
    Select GL Codes Frame
    Log  Step 4
    Search and verify Cost Center  ${Cost_Center_Code}
    Log  Step 5
    Select Location from GL Codes
    Select GL Codes Frame
    Search and verify Location Code  ${Location_Code}
    Log  Step 6
    Select Account from GL Codes
    Select GL Codes Frame
    Search and verify Account Code  ${Account_Code}


