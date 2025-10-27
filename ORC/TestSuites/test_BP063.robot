*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Notifications.robot
Resource  ../PageObjects/AssignedJourneys.robot
Resource  ../PageObjects/InternalOnboardingProcess.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP063.json
${csv_path}  ./CSV/td_BP063.csv


*** Test Cases ***

Scenario: Onboarding (Internal candidate with transfer)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Internal Candidate New Hire User]
    click on homepage
    Log  Step 2
    Click on Notifications Icon
    Click on Show All link for notifications
    Log  Step 3-4
    Search for checklist notification of a internal candidate
    Click on Notifications Done button
    Log  Step 9
    Go to me Journeys
    Log  Step 10
    Click on the internal journey tile for an internal candidate new hire
    Sleep  10s
#    Complete Personal information task
#    Click on Done button of a internal onboarding checklist task
    Sleep  10s
    Welcome video task
    Click on Done button of a internal onboarding checklist task
    Sleep  10s
    Banking Information task
    Upload file   ${data}[File Name]
    Click on Done button of a internal onboarding checklist task
    Sleep  10s



