*** Settings ***
Library  DataDriver  ../CSV/td_TC003_05_Verify_GL_Codes_records_in_Unifier_to_existing_Account_Codes_record_in_EBS_record_should_be_updated_in_Unifier_via_interface.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierGLCodes.robot
Documentation  Verify GL Codes records in Unifier to existing Account Codes record in EBS record should be updated in Unifier via interface
...            Prerequisite: GL Code to be updated in EBS  GL Code, BL Code, BL ID, BL Description should be updated in CSV file as update in EBS
...            Environment Specific Data:  Login User
...            Reusable Data:
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify GL Codes records in Unifier to existing Account Codes record in EBS record should be updated in Unifier via interface

*** Variables ***
${json_path}    ./TestData/td_TC003_05_Verify_GL_Codes_records_in_Unifier_to_existing_Account_Codes_record_in_EBS_record_should_be_updated_in_Unifier_via_interface.json
${csv_path}  ./CSV/td_TC003_05_Verify_GL_Codes_records_in_Unifier_to_existing_Account_Codes_record_in_EBS_record_should_be_updated_in_Unifier_via_interface.csv


*** Test Cases ***
TC003.05-Verify GL Codes records in Unifier to existing Account Codes record in EBS record should be updated in Unifier via interface with - ${Id} ${Login_User} ${GL_Code} ${BL_Code} ${BL_ID} ${BL_Description}
    [Tags]  GLIntegration  ReadOnly

*** Keywords ***
Verify GL Codes records in Unifier to existing Account Codes record in EBS record should be updated in Unifier via interface
    [Arguments]  ${Login_User}  ${GL_Code}  ${BL_Code}  ${BL_ID}  ${BL_Description}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Select MX Company in the Home Page
    Log  Step 3
    Select GL Codes from GL Codes
    Select GL Codes Frame
    Log  Step 4
    Open a specific GL Code  ${GL_Code}
    Log  Step 5
    Validate BL Code  ${BL_Code}  ${BL_ID}  ${BL_Description}


