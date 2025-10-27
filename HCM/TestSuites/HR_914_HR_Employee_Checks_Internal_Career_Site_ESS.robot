*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot

Documentation  HR - Employee checks Internal Career Site - ESS
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Not Applicable
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_914_HR_Employee_Checks_Internal_Career_Site_ESS.json
${csv_path}  ./CSV/td_HR_914_HR_Employee_Checks_Internal_Career_Site_ESS.csv
*** Test Cases ***

Scenario: HR - Employee checks Internal Career Site - ESS
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Me
    Log  Step 6
    Click on Current Jobs
    Log  Step 7
    Click Search button on Current jobs page
    Log  Step 8
    Verify job posted in jobs page

