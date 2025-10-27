*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/AdministerEmployees.robot
Documentation  Workforce Compensation - Standard Functionality - Administer Employees (mark employee as ineligible for PFP)
...            Prerequisite:  Person numbers with eligible for PFP
...            Environment Specific Data:  Manager Login(PFP_common_test_data.csv); Person Number
...            Reusable Data:  Workforce Compensation group(PFP_common_test_data.csv); Eligibility Status
...            Dynamic Data: Not Applicable


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_08_Workforce_Compensation_Standard_Functionality_Administer_Employees_Mark_Employee_As_Ineligible_For_PFP.json
${csv_path}  ./CSV/td_CMP_TC001_08_Workforce_Compensation_Standard_Functionality_Administer_Employees_Mark_Employee_As_Ineligible_For_PFP.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Workforce Compensation - Standard Functionality - Administer Employees (mark employee as ineligible for PFP)
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
    Log  Step 5 - 6
    Click Option under Workforce Compensation  ${common_data}[Workforce Compensation group]
    Log  Step 7
    Search By Employee Number  ${data}[Person Number]
    Wait And Verify Page Contains Text  Administer Employees  30s  Administer Employees select plan page not found
    Log  Step 8
    Select Pay For Performance under plan
    Log  Step 9
    Select Eligibility under Personal Information
    Log  Step 10
    Select Eligibility Status dropdown  ${data}[Eligibility Status]
    Log  Step 11
    Click Save And Close in Administer Employees page

