*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CalculationCards.robot
Resource  ../PageObjects/CreateWorkRelationship.robot
Documentation  Add duplicate calculation card to assignment number
...            Prerequisite:  HR_76_Rehire_calc_card_is_not_filled_with_the_new_assignment_number
...            Environment Specific Data:  HR Login; Person Number (Use same which is used in HR_76)
...            Reusable Data:  Start Date
...            Dynamic Data:  Assignment(Use same which is used in HR_76)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_76_Rehire_calc_card_is_not_filled_with_the_new_assignment_number_negative.json
${csv_path}  ./CSV/td_HR_76_Rehire_calc_card_is_not_filled_with_the_new_assignment_number_negative.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Add duplicate calculation card to assignment number
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Click Calculation Cards Under Employment Section
    Log  Step 7 - 8
    Advance Person Search With Date Filters  ${data}[Person Number]  ${data}[Person Name]  ${data}[Start Date]
#    Search And Select Person  ${data}[Person Number]
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
    Verify Error Message Displayed