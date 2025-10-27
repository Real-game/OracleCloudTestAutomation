*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Notifications.robot
Resource  ../PageObjects/MyJourneys.robot
Resource  ../PageObjects/ChecklistTask.robot
Resource  ../PageObjects/CreateNewContact.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP065.json
${csv_path}  ./CSV/td_BP065.csv

*** Test Cases ***

Scenario: Checklist Tasks
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[New Hire]
    click on homepage
    Click on Notifications Icon
    Verify tasklist notification for an employee
    Click on Notifications Done button
    click on homepage
    Go to me Journeys
    Navigate to checklist task page
#    Complete Personal information task
#    Click on Done button of a checklist task
    Sleep  10s
    Complete Banking task
#    Click on back button in Checklist task
    Upload file   ${data}[File Name]
    Click on Done button of a checklist task

#