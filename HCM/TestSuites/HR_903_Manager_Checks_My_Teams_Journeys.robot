*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Journeys.robot

Documentation  Manager Checks My Teams Journeys
...            Prerequisite: Manager with a direct report with open journey
...            Environment Specific Data:  Login User
...            Reusable Data:
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_903_Manager_Checks_My_Teams_Journeys.json
${csv_path}  ./CSV/td_HR_903_Manager_Checks_My_Teams_Journeys.csv
*** Test Cases ***

Scenario: HR-903 Manager Checks My Teams Journeys
    [Tags]  CoreHRTestCase  Read-only
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go To My Team
    Log  Step 6
    Click on Journeys
    Log  Step 7
    Click on a Journey Tab  Assigned Journeys
    Log  Step 8
    Click on Direct Reports
    Click on Open Journeys tab
    Log  Step 9
    Get MX Cultural Census Task List