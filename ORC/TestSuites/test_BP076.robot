*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/AgencyHiring.robot
Resource  ../PageObjects/Invitations.robot
Resource  ../PageObjects/JobInfo.robot
Resource  ../PageObjects/Talent.robot
Resource  ../PageObjects/CreateCandidate.robot
Resource  ../PageObjects/SubmitCandidate.robot
Resource  ../PageObjects/Talent.robot
Resource  ../PageObjects/JobApplications.robot
Documentation  Agent refer Candidate
...            Prerequisite:  Requisition Id
...            Environment Specific Data:  Recruiting Agent
...            Reusable Data: Not Applicable
...            Dynamic Data: Candidate First Name;Candidate Last Name;Candidate Email
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP076.json
${csv_path}  ./CSV/td_BP076.csv

*** Test Cases ***

Scenario: Internal Job Application Flow
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiting Agent]
    click on homepage
    Go to my client group agency hiring
    Log  Step 2
    Click Invitations link
    Click on the requisition title  ${data}[Requisition Id]
    Verify Job Info and description
    Sleep  10s
    Click on Done button in Invitations page
    Click Talent link
    Click on Add in Talent Page
    Add a Candidate  ${data}[Candidate First Name]  ${data}[Candidate Last Name]  ${data}[Candidate Email]
    Sleep  10s
    Click on Done button in Talent Page
    Click Invitations link
    Click on Submit candidate
    Sleep  20s
    Submit Candidate    ${data}[Candidate First Name]
    Click on Done button in Invitations page
    Click Job Applications link
    Wait Until Page Contains  ${data}[Candidate First Name]  20
    Navigate Back
    Sleep  10s
    Click Referrals link
    Wait Until Page Contains  ${data}[Candidate First Name]  20
    Wait Until Page Contains  ${data}[Requisition Id]  20
    Sleep  10s
    Logout


