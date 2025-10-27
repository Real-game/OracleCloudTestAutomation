*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot

Documentation  Allocate Workforce Compensation - Employee Type NU Regular (single assignment/ multiple assgn/NU/ BTM etc)
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC014_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular.json
${csv_path}  ./CSV/td_CMP_TC014_00_Allocate_Workforce_Compensation_Employee_Type_NU_Regular.csv

*** Test Cases ***
Scenario: Allocate Workforce Compensation - Employee Type NU Regular (single assignment/ multiple assgn/NU/ BTM etc)
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5
    Click on Act as Proxy Manager
    Log  Step 6
    Select Proxy manager  ${data}[Proxy Manager]
    Log  Step 7
    Select Pay For Performance option
    Log  Step 8
    Search Person Name  ${data}[Person Name]
    Log  Step 12
    Check Eligibility Status

    # Grade Value in sheet
    #//span[text()='Grade']/ancestor::th//following::table[@summary='Worksheet']//td[14]/span