*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/ElementEntries.robot
Resource  ../PageObjects/ViewCompensationHistory.robot
Resource  ../PageObjects/Payroll.robot
Documentation  Verify Element Entry
...            Prerequisite:  Existing employee number
...            Environment Specific Data:  Login User; Person Number
...            Reusable Data: Parent Action; Child Action
...            Dynamic Data: Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC085_Verify_Element_Entry.json
${csv_path}  ./CSV/td_PAY_TC085_Verify_Element_Entry.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***

Scenario: Verify Element Entry
    [Tags]  PayrollTestCase56897  ReadOnly  PAY22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go To My Client Group
    Click on Payroll
    Log  Step 6
    Click on Element Entries under Payroll
    Log  Step 7
    Search Person and Click for Element Entries   ${data}[Person Number]
#    Go to my client group person management
#    Check The Box Include terminated Work relationship And Search Person  ${data}[Person Number]
    #Select action Dropdown  ${data}[Parent Action1]  ${data}[Child Action1]
    #${salary_value}=  Extract overall salary value
    #click on homepage
    #Go to my client group person management
    #Check The Box Include terminated Work relationship And Search Person  ${data}[Person Number]
#    Select action Dropdown  ${data}[Parent Action2]  ${data}[Child Action2]
    Log  Step 8
    Verify overall salary amount in Element Entries table  50,000.00
    Log  Step 9
    Select Show all in View section under Element Entries
    Verify the presence of benefit element entries
    Verify the presence of absence element entries

