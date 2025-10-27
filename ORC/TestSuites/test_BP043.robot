*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/MoveCandidate.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP043.json
${csv_path}  ./CSV/td_BP043.csv
*** Test Cases ***

Scenario: Evaluate and Select Applicants ( Recruiter moves candidate through selection process )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter Username]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 4
    Click on Active Applications
    Log  Step 5
    Select Application  ${data}[Candidate]
    Log  Step 6
    Click on Move
    Select Phase  ${data}[Move to Phase]
    Select State  ${data}[Move to State]
    Log  Step 7
    Click on Save
    Logout
