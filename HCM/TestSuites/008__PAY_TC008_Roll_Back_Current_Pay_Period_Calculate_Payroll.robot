*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PayrollDetail.robot
Resource  ../PageObjects/SubmitFlow.robot
Documentation  Submit a 'Roll back Process' for current pay period
...            Prerequiste:  Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data: Legislative Data Group is defined as CA Legislative Data Group, Flow Pattern is defined as Roll Back Process
...            Dynamic Data: Payroll Flow, Payroll Process(Current pay period information needs to be provided) eg., '012022_Payroll | Calculate Payroll | 2022-01-04 | Biweekly | Complete

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC008_Roll_Back_Current_Pay_Period_Calculate_Payroll.json
${csv_path}  ./CSV/td_PAY_TC008_Roll_Back_Current_Pay_Period_Calculate_Payroll.csv

*** Test Cases ***

Scenario: Roll back Current Pay Period calculate payroll
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
    Click on Submit a Flow
    Log  Step 7
    Select Legislative Data Group  ${data}[Legislative Data Group]
    Log  Step 8
    Enter Flow Pattern input  ${data}[Flow Pattern]
    Select Flow pattern  ${data}[Flow Pattern]
    Log  Step 9
    Enter Payroll Flow Name  ${data}[Payroll Flow]
    Log  Step 10
    Select Payroll Process value  ${data}[Payroll Process]
    Log  Step 11
    Select Submit
    Wait And Verify Page Contains Text  ${data}[Payroll Flow]  20s  ${data}[Payroll Flow] is not displayed




