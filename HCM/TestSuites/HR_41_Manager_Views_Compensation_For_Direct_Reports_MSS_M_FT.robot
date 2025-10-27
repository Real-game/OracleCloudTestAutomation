*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Documentation  Manager views compensation for direct reports - MSS - M - FT
...            Prerequisite:  Employee details should get from ORC
...            Environment Specific Data: Login User,Employee Name
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_41_Manager_Views_Compensation_For_Direct_Reports_MSS_M_FT.json
${csv_path}  ./CSV/td_HR_41_Manager_Views_Compensation_For_Direct_Reports_MSS_M_FT.csv

*** Test Cases ***
Scenario: Manager views compensation for direct reports - MSS - M - FT
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click on My Team in My Team
    Log  Step 5
    Select The Employee By Name  ${data}[Employee Name]
    Log  Step 6
    Click Show More
    Log  Step 7
    Click On Compensation
    Verify Compensation page
