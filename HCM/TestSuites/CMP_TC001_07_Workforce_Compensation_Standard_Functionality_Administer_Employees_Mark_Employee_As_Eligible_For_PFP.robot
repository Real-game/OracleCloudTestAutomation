*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/AdministerEmployees.robot
Documentation  Workforce Compensation - Standard Functionality - Administer Employees (mark employee as eligible for PFP)
...            Prerequisite:  Person numbers with ineligible for PFP
...            Environment Specific Data:  Login User, Person Number
...            Reusable Data:  Workforce Compensation group, Eligibility Status
...            Dynamic Data: Not Applicable


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_07_Workforce_Compensation_Standard_Functionality_Administer_Employees_Mark_Employee_As_Eligible_For_PFP.json
${csv_path}  ./CSV/td_CMP_TC001_07_Workforce_Compensation_Standard_Functionality_Administer_Employees_Mark_Employee_As_Eligible_For_PFP.csv

*** Test Cases ***
Scenario: Workforce Compensation - Standard Functionality - Administer Employees (mark employee as eligible for PFP)
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Click Compensation
    Log  Step 5 - 6
    Click Option under Workforce Compensation  ${data}[Workforce Compensation group]
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
    Click Save And Close
    Select Yes Button