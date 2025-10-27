*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CalculationCards.robot
Documentation  Rehire - calc card is not filled with the new assignment number
...            Prerequisite:  data_Creation_Rehire_Without_Payroll_Details.robot
...            Environment Specific Data:  Login User and Person Number
...            Reusable Data:  Start Date
...            Dynamic Data:  Assignment

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_76_Rehire_calc_card_is_not_filled_with_the_new_assignment_number.json
${csv_path}  ./CSV/td_HR_76_Rehire_calc_card_is_not_filled_with_the_new_assignment_number.csv

*** Test Cases ***
Scenario: Rehire - calc card is not filled with the new assignment number
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Click Calculation Cards Under Employment Section
    Log  Step 7 - 8
    Search And Select Person  ${data}[Person Number]
    Log  Step 9
    Click Tax Credit Information
    Log  Step 10 - 11
    Expand And Edit Association Section
    Log  Step 12
    Fill Basic Information  ${data}[Start Date]
    Log  Step 13
    Click Add Under Association Details
    Log  Step 14 - 15
    Fill Association Details  ${data}[Start Date]  ${data}[Assignment]
    Log  Step 16
    Click Ok Button
    Log  Step 17
    Save And Close
    Verify No Error Message Displayed