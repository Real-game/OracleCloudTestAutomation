*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Notifications.robot
Resource  ../PageObjects/AssignedJourneys.robot
Resource  ../PageObjects/MXCandidateJourneysChecklist.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP074.json
${csv_path}  ./CSV/td_BP074.csv

*** Test Cases ***

Scenario: Move the candidate to HR
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Recruiter Username]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id  ${data}[Job ID]
    Log  Step 4
    Click on Active Applications
    Log  Step 5
    Select Application By Candidate Name  ${data}[Candidate]
#    Select Application By Name  ${data}[Internal Employee]
    Log  Step 6
    Click on Actions and Select Move to HR
    Sleep  5s
    Logout
    Log  Step 1
#    Login Using  ${data}[Journeys Specialist User]
#    click on homepage
#    Go to my client group Journeys
#    Search for a pending worker   ${data}[Internal Employee]
#    Reopen an completed task
#    ${reassigned_task_name}=  Reassign a open task   ${data}[Reassignee]
#    Sleep  4s
#    Remove a open task
#    Send a reminder task
#    Logout
#    Login Using  ${data}[Reassigned User]
#    click on homepage
#    Go to my client group Journeys
#    Verify the reassigned task in My Tasks   ${reassigned_task_name}   ${data}[Internal Employee]
#    Sleep  4s
#    Logout


