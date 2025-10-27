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
${json_path}    ./TestData/td_BP079.json
${csv_path}  ./CSV/td_BP079.csv


*** Test Cases ***

Scenario: Internal Job Application Flow
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Pending Worker User]
    click on homepage
    Click on Notifications Icon
    Click on Show All link for notifications
    Search for checklist notification of a candidate  ${data}[Pending Worker Name]
    Click on Notifications Done button
    Sleep  5s
    Logout
#    Go to my team Journeys
#    Search for a pending worker   ${data}[Pending Worker Name]
#    Send a reminder task





