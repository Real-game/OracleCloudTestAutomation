*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Notifications.robot
Resource  ../PageObjects/AssignedJourneys.robot
Resource  ../PageObjects/MXCandidateJourneysChecklist.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP054.json
${csv_path}  ./CSV/td_BP054.csv

*** Test Cases ***

Scenario: Journeys(Checklist for new hire)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Journeys Specialist User]
    click on homepage
    Click on Notifications Icon
    Click on Show All link for notifications
    Search for checklist task notification  ${data}[Pending Worker]
    Click on Notifications Done button
    Go to my client group Journeys
    Search for a pending worker   ${data}[Pending Worker]
    Reopen an completed task
    ${reassigned_task_name}=  Reassign a open task   ${data}[Reassignee]
    Sleep  4s
    Remove a open task
    Send a reminder task
    Assigned Journeys Logout
    Login Using  ${data}[Reassigned User]
    click on homepage
    Go to my client group Journeys
    Verify the reassigned task in My Tasks   ${reassigned_task_name}   ${data}[Pending Worker]
    Sleep  4s
    Assigned Journeys Logout

