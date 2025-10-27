*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/Pay.robot
Resource  ../PageObjects/CalculationCards.robot
Documentation  Verify TRU Change
...            Prerequisite:  SME intervention need
...            Environment Data:  Login User;Person Number;
...            Reusable Data: Parent Action;Child Action
...            Dynamic Data: TRU

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC087_Verify_TRU_Change.json
${csv_path}  ./CSV/td_PAY_TC087_Verify_TRU_Change.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***
Scenario: Verify TRU Change
    [Tags]  PayrollTestCase5678  ModifyData  PAY22D
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    Log  Step 4 - 6
    click on homepage
    Go to my client group person management
    Log  Step 7 - 8
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 9 - 10
    Wait And Click Element  link: Tax Credit Information
    Sleep  5s
    Expand Association section
    Sleep  5s
    wait until element is visible  xpath: //label[text()="Tax Reporting Unit"]/following::span[text()="${data}[TRU]"]  30s  Updated TRU not found