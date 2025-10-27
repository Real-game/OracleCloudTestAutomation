*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionDetail.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Documentation  Edit Job Requisition
...            Prerequisite:  Requisition in Submitted Status
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Posting description;Comment Box;File Name;Internal Candidate Description;Automatic Fill Requisition;Internal Questionnaire;External Questionnaire
...            Dynamic Data: Requisition title; Other Requisition title; Collaborator; HRBP
...            Automation Data: RequisitionId (Get from BP001)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}  ./TestData/td_BP002.json
${csv_path}  ./CSV/td_BP002.csv
${prerequisites_json_path}  ./TestData/td_BP001.json  #If we want to run BP002 seperately - Update BP001 Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***
Scenario: Update Job Requisition
    [Tags]  ExternalNewHire
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
    generatecsv  ${json_path}  ${csv_path}
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
    Log  Step 7 - 11
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 12
    Click on details button
    Log  Step 13 - 17
    Edit Basic Info  ${data}
    Log  Step 18 - 23
    Edit Hiring Team  ${common_data}
    Log  Step 24
    Edit Requisition Structure
    Log  Step 25 - 26
    Edit Details Section
    Log  Step 27 - 31
    Edit PD Internal Description  ${data}[Internal Candidate Description]
    Log  Step 32 - 33
    Edit Offer Info
    Log  Step 34 - 40
    Edit Attachments  ${common_data}[File Name]
    Log  Step 41 - 45
    Edit Configuration  ${data}[Automatic Fill Requisition]
    Log  Step 46 - 52
    Edit Questionnaires  ${data}
    Logout