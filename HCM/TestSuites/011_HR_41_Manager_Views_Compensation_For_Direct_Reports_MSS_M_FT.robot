*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Documentation  Manager views compensation for direct reports - MSS - M - FT
...            Prerequisite:  Employee details should get from ORC
...            Environment Specific Data: Manager Login; Employee Login Name
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Manager views compensation for direct reports - MSS - M - FT
    [Tags]  CoreHRTestCase  ReadOnly  CoreHR22D
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Click on My Team in My Team
    Log  Step 5
    Select The Employee By Name  ${common_data}[Employee Login Name]
    Log  Step 6
    Click Show More
    Log  Step 7
    Click On Compensation
    Verify Compensation page
