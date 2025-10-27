
*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../PageObjects/JobRequisition.robot
Documentation  Manager creates Requisition
...            Prerequisite: HR02 - Create a position
...            Environment Specific Data: Manager Login; Position Code
...            Reusable Data: Use; Business Unit; Business Justification; Recruiting Type; Organization; Primary Location
...            Dynamic Data: Not applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_904_Manager_creates_Requisition.json
${csv_path}  ./CSV/td_HR_904_Manager_creates_Requisition.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Manager creates Requisition
    [Tags]  CoreHRTestCase  ModifyData  CoreHR22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4 - 5
    click on homepage
    Go To My Team
    Click on Hiring Under My Team
    Log  Step 6
    Click Add Requisition Button
    Log  Step 7 - 8
    Select Use From Drop Down  ${data}[Use]
#    Select Business Unit  ${common_data}[Business Unit]
    Log  Step 9
    Select Position  ${data}[Position Code]
    Log  Step 10
    Click Continue Button
    Log  Step 11
    Select Business Justification  ${data}[Business Justification]
    Log  Step 12
    Click Continue Button
    Log  Step 13
    Click Continue Button
    Log  Step 14
    Select Recruiting Type  ${data}[Recruiting Type]
    Log  Step 15
    Select Organization  ${common_data}[Organization]
    Log  Step 16
    Select Primary Location  ${data}[Primary Location]
    Log  Step 17
    Click Continue Button
    Log  Step 18
    Click Save And Close Button
    Log  Step 19
    ${req_id}=  Get Requisition Id
    Wait And Verify Page Contains Text  (${req_id})  30s  ${req_id} not found
