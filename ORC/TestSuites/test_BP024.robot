*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobApplications.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP024.json
${csv_path}  ./CSV/td_BP024.csv

*** Test Cases ***
Scenario: Plan Recruiting
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring manager user]
    click on homepage
    Go to my team hiring
    Search for the presence of requisition id   ${data}[Requisition ID]
    Click on the application link of the searched requisition
    Verify no new status application is listed for an hiring manager
    Logout


