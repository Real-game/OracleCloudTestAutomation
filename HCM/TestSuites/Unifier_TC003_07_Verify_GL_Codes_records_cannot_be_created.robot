*** Settings ***
Library  DataDriver  ../CSV/td_TC003_07_Verify_GL_Codes_records_cannot_be_created.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierGLCodes.robot
Documentation  Verify GL Codes records cannot be created
...            Prerequisite: Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data: Not Applicable
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify GL Codes records cannot be created

*** Variables ***
${json_path}    ./TestData/td_TC003_07_Verify_GL_Codes_records_cannot_be_created.json
${csv_path}  ./CSV/td_TC003_07_Verify_GL_Codes_records_cannot_be_created.csv

*** Test Cases ***
TC003.07-Verify GL Codes records cannot be created with - ${Id} ${Login_User}
    [Tags]  GLIntegration  ReadOnly

*** Keywords ***
Verify GL Codes records cannot be created
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
    Verify Create Button is not available