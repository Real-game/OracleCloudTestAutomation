*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CandidatePools.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP066.json
${csv_path}  ./CSV/td_BP066.csv
*** Test Cases ***

Scenario: Candidate Pool, Talent Community (Candidate Pool)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter Username]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Click on Candidate Pools
    Log  Step 4 - 10
    Create Candidate Pool  ${data}[Pool Name]  ${data}[Ownership Type]  ${data}[Owner Name]  ${data}[Location]  ${data}[Job Family]
    Sleep  40s
    Search for Talent Pool  ${data}[Pool Name]
    Log  Step 11
    Mark Pool
    Log  Step 12 - 13
    Action On Pool  ${data}[Action]
    Logout
