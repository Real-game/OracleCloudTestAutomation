*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/PerformanceTemplates.robot


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC06_Total_Rewards_Representative_unlocks_the_Annual_Performance_Review_Document.json
${csv_path}  ./CSV/td_TC06_Total_Rewards_Representative_unlocks_the_Annual_Performance_Review_Document.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Total Rewards Specialist unlocks Annual Performance Review Document
    [Tags]  PMPTalentTestCase  ModifyData  PMP22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Rewards Representative]
    Log  Step 4
    click on homepage
    Go To My Client Group
    Log  Step 5
    Click On Performance
    Log  Step 6
    Click on Performance Templates link
    Log  Step 7
    Unlock Annual Performance Review Document  ${data}[Performance Document Name]