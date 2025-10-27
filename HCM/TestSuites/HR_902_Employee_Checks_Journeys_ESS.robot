*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Journeys.robot

Documentation  Employee Checks Journeys
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Employee Login User
...            Reusable Data:  Journey Name
...            Dynamic Data:  Not Applicable


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_902_Employee_Checks_Journeys_ESS.json
${csv_path}  ./CSV/td_HR_902_Employee_Checks_Journeys_ESS.csv

*** Test Cases ***
Scenario: Employee Checks Journeys ESS
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Me
    Log  Step 6-7
    Click on Journeys in Home Page
    Log  Step 8
    Click on Open Journeys tab
    Log  Step 9
    Click on Journey  ${data}[Journeys Name]
    Log  Step 10
    Verify task status
