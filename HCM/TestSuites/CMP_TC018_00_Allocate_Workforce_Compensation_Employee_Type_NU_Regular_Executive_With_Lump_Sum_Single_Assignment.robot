*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/ActAsProxyManager.robot

Documentation  Allocate Workforce Compensation - Employee Type NU Regular Executive With Lump Sum (Single Assignment)
...            Prerequisite:  CMP_TC001.01; CMP_TC001.10
...            Environment Data:  Manager Login(PFP_common_test_data.csv)
...            Reusable Data: Compensation Option; Proxy Manager Name(PFP_common_test_data.csv);Filter Value;Eligiblity Status;LFTRI %;CSAT %;Total Increase Override;Proration Override
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC018_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular_Executive_With_Lump_Sum_Single_Assignment.json
${csv_path}  ./CSV/td_CMP_TC018_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular_Executive_With_Lump_Sum_Single_Assignment.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Allocate Workforce Compensation - Employee Type NU Regular Executive With Lump Sum (Single Assignment)
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Click on My Client Compensation from Navigator
    Log  Step 7
    Click Option in Compensation page  ${data}[Compensation Option]
    Log  Step 8
    Select Proxy manager  ${common_data}[Proxy Manager Name]
    Log  Step 9
    Select Pay For Performance option
    Log  Step 10
    Select Filters Option
    Log  Step 11
    Select Grade Filter option  ${data}[Filter Value]
    Log  Step 12
    Click Filter Go button
    Log  Step 13 - 16
    Check employee details present
    Select Sort Descending for Lumpsum Amount
    Verify Eligible employee only has Lumpsum Value
    Click Clear Filter
    Select Eligibility Status Filter  ${data}[Eligiblity Status]
    Log  Step 17
    Select Sort Descending for Processing Status
    Sleep  2s
    Input LFTRI and CSAT Percentage Values  ${data}[LFTRI %]  ${data}[CSAT %]
    Log  Step 18
    Input Total Increase Override and Proration overide Values  ${data}[Total Increase Override]  ${data}[Proration Override]
    Validate LTFIR and CSAT Amount
    Log  Step 19
    Save Worksheet



