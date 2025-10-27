*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Resource  ../PageObjects/ActAsProxyManager.robot

Documentation  Allocate Workforce Compensation - Employee Type NU Regular (single assignment/ multiple assgn/NU/ BTM etc)
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Manager Login(PFP_common_test_data.csv)
...            Reusable Data: Proxy Manager Name(PFP_common_test_data.csv);Person Name;LFTRI %;CSAT %;Total Increase Override;Proration Override
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC014_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular.json
${csv_path}  ./CSV/td_CMP_TC014_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Allocate Workforce Compensation - Employee Type NU Regular (single assignment/ multiple assgn/NU/ BTM etc)
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5
    Click on Act as Proxy Manager
    Log  Step 6
    Select Proxy manager  ${common_data}[Proxy Manager Name]
    Log  Step 7
    Select Pay For Performance option
    Log  Step 8
    Search Person Name  ${data}[Person Name]
    Log  Step 12
    Check Eligibility Status
    Log  Step 13
    Check Grade Values
    Log  Step 14
    Check Multiple Assignment Status
    Log  Step 15
    Verify Performance Rating is Complete
    Log  Step 16
    Verify Leadership % is populated
    Log  Step 17
    Input LFTRI and CSAT Percentage Values  ${data}[LFTRI %]  ${data}[CSAT %]
    Log  Step 18
    Input Total Increase Override and Proration overide Values  ${data}[Total Increase Override]  ${data}[Proration Override]
    Log  Step 19
    Save Worksheet
    Log  Step 20
    Validate LTFIR and CSAT Amount