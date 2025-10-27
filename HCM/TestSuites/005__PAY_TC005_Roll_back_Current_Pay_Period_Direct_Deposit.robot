*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PayrollDetail.robot
Resource  ../PageObjects/ViewFlows.robot
Documentation  Roll back process - Pay period direct deposit
...            Prerequiste:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data: Legislative Data Group is defined as CA Legislative Data Group, Flow Pattern is defined as MX Generate Direct Deposit Payments
...            Dynamic Data: Direct Deposit Name for the previous pay period(Should be set to the previous month during upgrade testing)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC005_Roll_back_Current_Pay_Period_Direct_Deposit.json
${csv_path}  ./CSV/td_PAY_TC005_Roll_back_Current_Pay_Period_Direct_Deposit.csv

*** Test Cases ***

Scenario: Roll back Current Pay Period direct deposit
    [Tags]  PayrollTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
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
    Click on the flow name  ${data}[Direct Deposit Name]
    Log  Step 12
    Click on Actions button
    Log  Step 13
    Click on Rollback all
    Log  Step 14
    Click on Warning Confirmation OK
