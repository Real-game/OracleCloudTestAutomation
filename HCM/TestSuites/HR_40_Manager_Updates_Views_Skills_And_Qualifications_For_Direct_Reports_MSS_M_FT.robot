*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Documentation  Manager updates views skills and qualifications for direct reports
...            Prerequisite:  Employee details should get from ORC
...            Environment Specific Data:  Manager Login; Employee Login Name
...            Reusable Data: Not Applicable
...            Dynamic Data: File Name

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_40_Manager_Updates_Views_Skills_And_Qualifications_For_Direct_Reports_MSS_M_FT.json
${csv_path}  ./CSV/td_HR_40_Manager_Updates_Views_Skills_And_Qualifications_For_Direct_Reports_MSS_M_FT.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: Manager updates views skills and qualifications for direct reports - MSS - M - FT
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Click on My Team in My Team
    Log  Step 5
    Select Employee By Name  ${common_data}[Employee Login Name]
    Log  Step 6
    Click Show More
    Log  Step 7
    Click On Skills and Qualification
    Log  Step 8
    Expand Attachments and Edit  ${data}[File Name]
    Sleep  20s