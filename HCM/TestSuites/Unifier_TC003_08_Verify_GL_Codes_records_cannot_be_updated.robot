*** Settings ***
Library  DataDriver  ../CSV/td_TC003_08_Verify_GL_Codes_records_cannot_be_updated.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierGLCodes.robot
Documentation  Verify GL Codes records cannot be updated
...            Prerequisite: Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data: Not Applicable
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify GL Codes records cannot be updated

*** Variables ***
${json_path}    ./TestData/td_TC003_08_Verify_GL_Codes_records_cannot_be_updated.json
${csv_path}  ./CSV/td_TC003_08_Verify_GL_Codes_records_cannot_be_updated.csv

*** Test Cases ***
TC003.08-Verify GL Codes records cannot be updated with - ${Id} ${Login_User}
    [Tags]  GLIntegration  ReadOnly

*** Keywords ***
Verify GL Codes records cannot be updated
    [Arguments]  ${Login_User}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Select MX Company in the Home Page
    Log  Step 3
    Select GL Codes from GL Codes
    Select GL Codes Frame
    Log  Step 4
    Open a GL Code
    Log  Step 5
    Verify Accept Button is not available


