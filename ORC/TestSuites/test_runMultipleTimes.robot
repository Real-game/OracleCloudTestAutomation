*** Settings ***
Library  Selenium2Library
Library  DataDriver  ../CSV/td_runMultiple.csv

Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test
Test Template  Create Job Requisition

*** Variables ***
${json_path}    ./TestData/td_runMultiple.json
${csv_path}  ./CSV/td_runMultiple.csv

*** Test Cases ***
Create Requisition ID with - ${Id} ${LoginUser} ${Useposition_id} ${BusinessJustification} ${HiringManager} ${AssistantHiringManager} ${HRBP} ${Collaborator} ${FilePath} ${Recruitingtype} ${Recruiter}

*** Keywords ***
Create Job Requisition
    [Arguments]  ${Id}  ${LoginUser}  ${Useposition_id}  ${BusinessJustification}  ${HiringManager}  ${AssistantHiringManager}  ${HRBP}  ${Collaborator}  ${FilePath}  ${Recruitingtype}  ${Recruiter}
    Log  Step 1
    Login Using  ${LoginUser}
    Log  Step 2
    click on homepage
    Go to my team hiring
    appendtocsv  ${csv_path}  ${Id}  Username  ${LoginUser}
    Logout