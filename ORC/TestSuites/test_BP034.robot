*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Documentation  Create pipeline requisition ( Recruiter creates pipeline requisition)
...            Prerequisite:  Position Code
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Requisition Type;Use;Business Justification;File Name;Recruiting type;Question
...            Dynamic Data: position_id;Requisition Title;Hiring Manager;HRBP;Collaborator;Posting description
...            Automation Data: Pipeline RequisitionId (fetch from Automation code)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP034.json
${csv_path}  ./CSV/td_BP034.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Create pipeline requisition ( Recruiter creates pipeline requisition)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Recruiter user]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7
    Click on add button
    Log  Step 8 - 44
    Create Pipeline Requisition   ${data}  ${common_data}
    ${req_id} =  Get Requisition Id
    appendtojson  ${json_path}  Pipeline RequisitionId  ${req_id}
    generatecsv  ${json_path}  ${csv_path}
    Logout


