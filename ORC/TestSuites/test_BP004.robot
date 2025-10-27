*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/AddInteraction.robot
Resource  ../PageObjects/MoveCandidate.robot
Documentation  Recruiter managing Candidate applications - Add Interaction
...            Prerequisite:  Requisition ID with active application
...            Environment Specific Data:  Recruiter Username
...            Reusable Data: Apply sort; Candidate; Offer Action; Interaction Type; Job Application Filter; Move to State; Option on Warning
...            Dynamic Data: Requisition id
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP004.json
${csv_path}  ./CSV/td_BP004.csv
*** Test Cases ***
Scenario: Manage Candidates (Add Interaction, Delete Job Application)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readjson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter Username]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id  ${data}[Requisition id]
    Click on Active Applications
    Log  Step 4
    Sort  ${data}[Apply sort]
    Log  Step 5 - 16
    Select Application  ${data}[Candidate]
    Click on Actions and Select  ${data}
    Logout

