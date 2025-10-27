*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/MyTeamOverview.robot
Documentation  Manager updates views skills and qualifications for direct reports
...            Prerequisite:  Employee details should get from ORC
...            Environment Specific Data:  Login User, Employee Name
...            Reusable Data: Not Applicable
...            Dynamic Data: File Name


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_40_Manager_Updates_Views_Skills_And_Qualifications_For_Direct_Reports_MSS_M_FT.json
${csv_path}  ./CSV/td_HR_40_Manager_Updates_Views_Skills_And_Qualifications_For_Direct_Reports_MSS_M_FT.csv

*** Test Cases ***
Scenario: Manager updates views skills and qualifications for direct reports - MSS - M - FT
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click on My Team in My Team
    Log  Step 5
    Select Employee By Name  ${data}[Employee Name]
    Log  Step 6
    Click Show More
    Log  Step 7
    Click On Skills and Qualification
    Log  Step 8
    Expand Attachments and Edit  ${data}[File Name]
    Sleep  20s