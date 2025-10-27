*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensation.robot
Resource  ../PageObjects/PayForPerformance.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/PerformanceDocuments.robot

Documentation  FUT - Hierarchy - Proxy as chairperson as defined in UDT
...            Prerequisite:  CMP_TC001.01; CMP_TC001.10 and User with Proxy manager access
...            Environment Specific Data: Manager Login(PFP_common_test_data.csv); Proxy Manager Name(PFP_common_test_data.csv)
...            Reusable Data:  Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_CMP_TC001_17_FUT_Hierarchy_Proxy_as_chairperson_as_defined_in_UDT.json
#${csv_path}  ./CSV/td_CMP_TC001_17_FUT_Hierarchy_Proxy_as_chairperson_as_defined_in_UDT.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: FUT - Hierarchy - Proxy as chairperson as defined in UDT
    [Tags]  PFPTestCase  ModifyData
#    generatejson  ${csv_path}  ${json_path}
#    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 7
    Click on My Client Compensation from Navigator
    Click on Act as Proxy Manager
    Log  Step 8
    Select the Manager To Act as Proxy Manager  ${common_data}[Proxy Manager Name]
    Log  Step 9
    element should contain  xpath: //span[text()="Access Level"]/following::span[1]  Updates Allowed
    Verify Page Has Hyperlink  Manage Budgets
    Verify Page Has Hyperlink  Pay for Performance
    Verify Page Has Hyperlink  Compensation Change Statements
    Capture Page Screenshot And Retry If Required
