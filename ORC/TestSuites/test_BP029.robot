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
Scenario: Schedule Interviews(Candidate cancels scheduled interview)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Internal Candidate]
    click on homepage
    Click on Notifications Icon
    Click on the scheduled interview notification
    Sleep  20s
    Click on the interview detail link
    Click on Cancel Interview Schedule
    Sleep  20s
    Click on homepage
    Sleep  3s
    Logout

    Login Using  ${data}[Login User]
    click on homepage
    Click on Notifications Icon
    Verify canceled interview notification  ${data}[Requisition Title]  ${data}[Candidate Name]
    Click on the canceled interview notification  ${data}[Requisition Title]  ${data}[Candidate Name]
    Logout

