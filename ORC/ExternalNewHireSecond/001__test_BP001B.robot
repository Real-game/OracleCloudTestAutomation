*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../Helpers/Config.robot
Documentation  Create Job Requisition in Draft status
...            Prerequisite:  Position code
...            Environment Specific Data:  Hiring Manager Login
...            Reusable Data: Use; Business Justification; File Name; Recruiting type
...            Dynamic Data: position_id; Hiring Manager; HRBP; Collaborator; Recruiter
...            Automation Data: RequisitionId (Data fetch from Automation code)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP001B.json
${csv_path}  ./ExternalNewHireSecondCSV/td_BP001B.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Create Job Requisition in Draft status
    [Tags]  ExternalNewHireB
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 -3
    Login Using  ${common_data}[Hiring Manager Login]
#    Login Using  ${common_data}[Recruiter user]
    Log  Step 4
    click on homepage
    Log  Step 5 -6
    Go to my team hiring
#    Go to my client group hiring
    Log  Step 7
    Click on add button
    Log  Step 8 - 26
    Create a Requisition  ${data}  ${common_data}
    ${req_id} =  Get Requisition Id
    appendtojson  ${json_path}  RequisitionId  ${req_id}
    generatecsv  ${json_path}  ${csv_path}
    Logout