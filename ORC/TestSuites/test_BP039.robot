*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ScheduleInterview.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP029.json
${csv_path}  ./CSV/td_BP029.csv


*** Test Cases ***
Scenario: Schedule Interviews(Candidate selects from an interview slot)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Internal Candidate]
    click on homepage
    Click on Notifications Icon
    Click on the schedule interview notification
    Click on the interview calendar link
    Verify user is in schedule interview header page
    Click on Notifications Icon
    Click on the scheduled interview notification
    Click on the interview detail link
    Verify interview Details is Visible
    #Wait Until Page Contains   Interview Details  30  Interview details page is not displayed




