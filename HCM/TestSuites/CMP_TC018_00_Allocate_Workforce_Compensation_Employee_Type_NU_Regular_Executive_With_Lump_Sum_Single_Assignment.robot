*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/ActAsProxyManager.robot

Documentation  Allocate Workforce Compensation - Employee Type NU Regular Executive With Lump Sum (Single Assignment)
...            Prerequisite:  CMP_TC001.01, CMP_TC001.10
...            Environment Data:  Login User
#...            Reusable Data: Compensation Option
#...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC018_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular_Executive_With_Lump_Sum_Single_Assignment.json
${csv_path}  ./CSV/td_CMP_TC018_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular_Executive_With_Lump_Sum_Single_Assignment.csv
*** Test Cases ***

Scenario: Allocate Workforce Compensation - Employee Type NU Regular Executive With Lump Sum (Single Assignment)

    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Click on My Client Compensation from Navigator
    Log  Step 7
    Click Option in Compensation page  ${data}[Compensation Option]
    Log  Step 8
    Select Proxy manager  ${data}[Proxy Manager Name]
    Log  Step 9
    Select Pay For Performance option
    Log  Step 10
    Select Filters Option
    Log  Step 11
    Select Grade Filter option  ${data}[Filter Value]
    Log  Step 12
    Click Filter Go button
    Log  Step 13 - 15
    Select Sort Descending for Lumpsum Amount
    Verify Eligible employee only has Lumpsum Value

    Select Eligibility Status Filter  ${data}[Eligiblity Status]
    Select Sort Descending for Processing Status
    Sleep  10s


#    Log  Step 19
#    Select Save Button



