*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/AssignedJourneys.robot
*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP073.json
${csv_path}  ./CSV/td_BP073.csv
*** Test Cases ***

Scenario: Checklist (Validate checklist triggered for New Hire)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Journeys Specialist User]
    Log  Step 2
    click on homepage
    Go to my client group Journeys
    Log  Step 3
    Search for a pending worker  ${data}[Candidate Name]
    Log  Step 4
    Validate All E-signatures  ${data}[Candidate Name]
    Click on homepage
    Logout