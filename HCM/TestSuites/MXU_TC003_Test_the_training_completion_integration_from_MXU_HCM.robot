*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Test the training completion integration from MXU > HCM.
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_MXU_TC003_Test_the_training_completion_integration_from_MXU_HCM.json
${csv_path}  ./CSV/td_MXU_TC003_Test_the_training_completion_integration_from_MXU_HCM.csv
${hr_interface_PROFILE_RECORD_CSV_column_name}  PERSON_NUMBER,PROFILE_ID

*** Test Cases ***
Scenario: Test the training completion integration from MXU > HCM.
    [Tags]  TaleoLearnMXUTestCase  ReadOnly
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
    Select LRN-INT-02 Folder
    Log  Step 15
    Select And Open Report  ${data}[Report Name]
    Sleep  10s
    Select Aplly Button Frame
    Verify Document Frame  xpath: //iframe[contains(@id,'xdo:docframe0')]  ${hr_interface_PROFILE_RECORD_CSV_column_name}