*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/InterviewFeedback.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/CandidateDetail.robot




*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP051.json
${csv_path}  ./CSV/td_BP051.csv


*** Test Cases ***
Scenario: Interview Feedback Questionnaire
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Submit the feedback
    Login Using  ${data}[Login User]
    Click on Notifications Icon
    Display All notifications
    Search for a notification   Complete the interview
    Click on the submit feedback link
    Submit interview feedback questionnaire
    Logout

    Log  View the Submitted feedback
    Login Using  ${data}[Recruiter Username]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${data}[Requisition ID]
    Click on Active Applications
    Select Application  ${data}[Candidate Last Name]
    View Feedback
