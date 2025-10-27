*** Settings ***
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

*** Variables ***
${json_path}    ./TestData/td_BP037.json
${csv_path}  ./CSV/td_BP037.csv

*** Test Cases ***

Scenario: Create Job Requisition
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring manager user]
    click on homepage
    Go to my team hiring
    Click on add button
    Create Requisition  ${data}
    ${req_id} =  Get Requisition Id
    appendtojson  ${json_path}  RequisitionId  ${req_id}
    generatecsv  ${json_path}  ${csv_path}
    Logout
    Login Using  ${data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Clear filter and select the drafted requisition
    Submit Job Requisition by Reviewer  ${data}
    Logout