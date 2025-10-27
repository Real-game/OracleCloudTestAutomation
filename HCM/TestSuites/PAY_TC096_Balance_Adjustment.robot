*** Settings ***
Library    OperatingSystem
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Payroll.robot
Resource  ../PageObjects/AdjustIndividualBalances.robot
Documentation  Balance Adjustment
...            Prerequisite:  SME intervention need to provide person number -Can take any exisiting employee number
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data:  Not applicable
...            Dynamic Data:  Element Name;Assignment Name;Calculation Component;Rate

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC096_Balance_Adjustment.json
${csv_path}   ./CSV/td_PAY_TC096_Balance_Adjustment.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***
Scenario: Balance Adjustment
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4 - 7
    Click on Payroll from Navigator
    Wait And Click Element  link: Adjust Individual Balances
    Log  Step 8 - 9
    Search and click on Person  ${data}[Person Number]
    Log  Step 10 - 11
    Click on Adjustment Values
    Log  Step 11 - 15
#    Search And Select Element Name  ${data}[Element Name]
    Search and Select Adjust Element  ${data}[Element Name]
    Select Assignment Inputs  ${data}[Assignment Name]
    Select Province  ${data}[Province]
    Select Reporting Type  ${data}[Reporting Type]
#    Set Calculation Component Input  ${data}[Calculation Component]
    Set Rate Input  ${data}[Rate]
    Log  Step 14
    Click on Save in Adjustment values
    Submit Adjust Individual Balances
    page should not contain  Error
#    Click Confirmation Message Ok Button
