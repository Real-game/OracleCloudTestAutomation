*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PayrollDetail.robot
Resource  ../PageObjects/ViewFlows.robot
Documentation  Roll back Process of Current Pay Period prepayment
...            Prerequiste:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data: Legislative Data Group is defined as CA Legislative Data Group; Flow Pattern is defined as Calculate Prepayments
...            Dynamic Data: Prepayment Name for the previous pay period(Should be set to the previous month during upgrade testing)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC007_Roll_Back_Current_Pay_Period_Prepayment.json
${csv_path}  ./CSV/td_PAY_TC007_Roll_Back_Current_Pay_Period_Prepayment.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***

Scenario: Roll back Current Pay Period prepayment
    [Tags]  PayrollTestCase  ModifyData  DryRun
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Payroll from Navigator
    Log  Step 6
    Click on View Flows link
    Log  Step 7
    Click on Show Filters
    Log  Step 8
    Select filter on legislative data group  ${data}[Legislative Data Group]
    Log  Step 9
    Select filter on Flow Pattern  ${data}[Flow Pattern]
    Log  Step 10
    Click search icon on flow name
    Log  Step 11
    Click on the flow name  ${data}[Prepayment Name]
    Log  Step 12
    Click on Actions button
    Log  Step 13
    Click on Rollback all
    Log  Step 14
    Click on Warning Confirmation OK
