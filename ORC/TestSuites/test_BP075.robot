*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/MoveCandidate.robot
Resource  ../PageObjects/AddToLinkedRequisition.Robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP075.json
${csv_path}  ./CSV/td_BP075.csv

*** Test Cases ***

Scenario: Add the candidates from pipeline requisition to the linked requisition
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Recruiter User]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${data}[Requisition ID]
    Click on Active Applications
    Select Application  ${data}[Candidate]
    Click on Details
    Review personal details  ${data}[Candidate]
    Click on Attachments
    Download Attached Files
#    Click on Extra Info
    Click on Move
    Select Phase  ${data}[Move to Phase]
    Select State  ${data}[Move to State]
    Click on Save
    Click on Details
    Click on Actions and Select  ${data}
    Add to Linked Requisition
    Click on Activity Button
#    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Verify linked requisition in job application  ${data}[Standard Requisition ID]
    Logout
