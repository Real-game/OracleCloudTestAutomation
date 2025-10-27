*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreateWorkRelationship.robot
Resource  ../PageObjects/PersonManagement.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_13.json
${csv_path}  ./CSV/td_HR_13.csv

*** Test Cases ***

Scenario: Rehire Manual - M - FT (Current Date)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5 - 7
    Check The Box Include terminated Work relationship And Search Person  ${data}[Person Number]
    Log  Step 8
    Click Task Icon
    Click Create Work Relationship Link
    Log  Step 9 - 11
    Fill Basic Details  ${data}[Action]  ${data}[Action Reason]  ${data}[Legal Employer]
    Log  Step 12
    Click Next
    Wait And Verify Page Contains Text  Create Work Relationship: Person Information  20s  Page Not Found
    Log  Step 13
    Click Next
    Wait And Verify Page Contains Text  Create Work Relationship: Employment Information  20s  Page Not Found
    Log  Step 14 - 18
    Fill Assignment Details  ${data}[Business Unit]  ${data}[Position ID]  ${data}[Payroll]
    Log  Step 19
    Click Next
    Wait And Verify Page Contains Text  Create Work Relationship: Compensation and Other Information  20s  Page Not Found
    Log  Step 20 - 21
    Fill Compensation Details  ${data}[Salary Basis]  ${data}[Salary Amount]
    Log  Step 22
    Click Next
    Review Page
    Log  Step 23
    Click Submit Button
    Log  Step
    Select Warning Yes
    Log  Step
    Confirm Message