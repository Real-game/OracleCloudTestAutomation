*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CollectFeedback.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP027.json
${csv_path}  ./CSV/td_BP027.csv


*** Test Cases ***
Scenario: Interview Feedback Questionnaire(Feedback request is submitted to a job applicant in Interview state)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter user]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id   ${data}[Requisition ID]
    Log  Step 4
    Click on Active Applications
    Log  Step 5 - 6
    Click on collect Feedback link for the applicant   ${data}[Candidate Last Name]
    Log  Step 7 - 14
    Submit Collect Feedback action   ${data}
    Logout
