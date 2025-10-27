*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Resource  ../PageObjects/CalculationCards.robot
Documentation  Verify Calculation Cards
...            Prerequisite: Need Existing Employee details
...            Environment Specific Data:  Login User; Person Name; Person Number
...            Reusable Data: Parent Action; Child Action
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC080_Verify_Calculation_Card.json
${csv_path}  ./CSV/td_PAY_TC080_Verify_Calculation_Card.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv

*** Test Cases ***

Scenario: Verify Calculation Cards
    [Tags]  PayrollTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group person management
    Log  Step 7
    Search Person in person management  ${data}[Person Name]  ${common_data}[Person Number]
    Log  Step 8
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 9
    Verify Page has Absences Card
    Click Tax Credit Information
    Log  Step 10
    Expand Federal section
    Log  Step 11
    Check Federal Total Claim amount has value
    Log  Step 12
    Expand Regional section
    Log  Step 13
    Check Regional Total Claim amount has value
    Log  Step 14
    Expand Association section
    Log  Step 15
    Check Association Tax Reporting Unit has value
    Log  Step 16
    Check Association Assignment has value
    Log  Step 17
    Check Association Province of Employment has value






