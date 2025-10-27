*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidateDetail.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP025.json
${csv_path}  ./CSV/td_BP025.csv

*** Test Cases ***
Scenario: Manage Candidates
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for the presence of requisition id   ${data}[Requisition ID]
    Click on the application link of the searched requisition
    Send message to the team    ${data}[Candidate Last Name]    ${data}[Message Use]    ${data}[Recipient Name]   ${data}[Email subject]    ${data}[Email body]    ${data}[Candidate Name]
    Verify Sent Mail Interaction    ${data}[Recipient Name]
    Logout


