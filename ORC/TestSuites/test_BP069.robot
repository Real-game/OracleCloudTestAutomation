*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CandidatePools.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/MoveCandidate.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP069.json
${csv_path}  ./CSV/td_BP069.csv
*** Test Cases ***

Scenario: Candidate Pool, Talent Community (Candidate Pool Management)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter Username]
    Log  Step 2
    click on homepage
#    Go to my team hiring
    Go to my client group hiring
    Log  Step 3
    Click on Candidate Pools
    Log  Step 4 - 5
    Select Talent Pool  ${data}[Pool Name]
    Log  Step 6
    Select Candidate in Pool  ${data}[Candidate Name]
    Log  Step 7
    Click on Move
    Log  Step 8
    Select Phase  ${data}[Move to Phase]
    Log  Step 9
    Click on Save
    Log  Step 10 - 17
    Action on candidate in pool  ${data}
    Log  Step 18
    Click on Interactions
    Logout

