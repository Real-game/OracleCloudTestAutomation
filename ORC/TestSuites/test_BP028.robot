*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/PreviewJobOffer.robot
Documentation  Recruiter previews and accepts executive Offer
...            Prerequisite:  Requisition should be in extended status
...            Environment Specific Data:  Recruiter User
...            Reusable Data: Not Applicable
...            Dynamic Data: Employee Start Date,Expiration Date,Requisition_ID,Candidate
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP028.json
${csv_path}  ./CSV/td_BP028.csv

*** Test Cases ***

Scenario: Manage offers - Executive ( Recruiter previews and accepts executive Offer)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step-1
    Login Using  ${data}[Recruiter User]
    Log  Step-2
    click on homepage
    Go to my client group hiring
    Log  Step-3 - 4
    Search for requisition id  ${data}[Requisition_ID]
    Log  Step-5
    Click on Active Applications
    Log  Step-6
    Select Application By Candidate Name  ${data}[Candidate]
    Log  Step-7
    Click on Actions and Select  ${data}
    Log  Step-8 - 9
    Verify Preview Job Offer Page
    Click on back button in Preview offer page
    Click on Accept Job Offer
    Logout



