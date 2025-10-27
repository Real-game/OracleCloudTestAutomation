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


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP010.json
${csv_path}  ./CSV/td_BP010.csv
*** Test Cases ***
Scenario: Manage Candidate Profile ( Recruiters to add internal documents on the candidate profile )
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
    Select Application By Candidate Name  ${data}[Candidate]
    Log  Step 6
    Click on Attachments
    Log  Step 7 - 9
    Download Attached Files
    Log  Step 10 - 12
    Upload Internal Docs  ${data}[Internal Doc File]
    Logout

