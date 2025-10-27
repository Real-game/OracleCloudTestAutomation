*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ScheduleJobs.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ScheduleJobs.json
${csv_path}  ./CSV/td_ScheduleJobs.csv
*** Test Cases ***

Scenario: Create Job Schedule
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Login User]
    Log  Step 2
    click on homepage
    Log  Step 3
    Go to Tools Scheduled Processes
    Log  Step 4
    Click on Schedule New Process Button
    Log  Step 5
    Search Scheduled Job  ${data}[Schedule Job]
    Log  Step 6
    Go to Advanced Schedules
    Log  Step 7
    Schedule Job as per timeline  ${data}
    Log  Step 8
    Click on Submit
    Log  Step 9
    Search Process Id
    Log  Step 10
    Logout
