*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/CommonKeywords.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Test the user integration process.
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_MXU_TC002_Test_the_user_integration_process.json
${csv_path}  ./CSV/td_MXU_TC002_Test_the_user_integration_process.csv
${hr_interface_xxmx_lrn_user_csv_column_name}  PERSON_NUMBER|USER_NAME|FIRST_NAME|LAST_NAME|EMAIL_ADDRESS|MEMBERSHIP_STATUS|PERSON_TYPE|PREFERRED_NAME|DEPARTMENT_CODE|DEPARTMENT_NAME|DIVISION_NAME|LOCATION_NAME|SUPERVISOR_NAME|SUPERVISOR_ID|HIRE_DATE|JOB_CODE|JOB_NAME|GRADE_NAME|POSITION_NAME|POSITION_CODE|SAFETY_SENSITIVE_POSITION|BARGAINING_UNIT|HR_STATUS

*** Test Cases ***
Scenario: Test the user integration process.
    [Tags]  TaleoLearnMXUTestCase12  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 6
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 7
    Click Browse Catalog Button
    Log  Step 8
    Expand Shared Folders
    Log  Step 9
    Expand Custom
    Log  Step 10 - 11
    Expand Metrolinx
    Log  Step 12
    Expand Interface Folder
    Log  Step 13
    Expand HR Interface Folder
    Log  Step 14
    Select LRN-INT-01 Folder
    Log  Step 15
    Select And Open Report  ${data}[Report Name]
    Log  Step 16 - 17
    ${current_date}=  get_current_date_dd_mm_yyyy
    Sleep  10s
    Set P_LAST_RUN_DATE And Click Apply  ${current_date}
    Verify Document Frame  xpath: //iframe[contains(@title,'LRN_USER')]  ${hr_interface_xxmx_lrn_user_csv_column_name}