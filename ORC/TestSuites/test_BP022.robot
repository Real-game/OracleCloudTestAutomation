*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobRequisitionDetail.robot
Documentation  Collaborator edits a Job Requisition
...            Prerequisite:  Requisition ID linked with Collaborator
...            Environment Specific Data:  Collaborator User
...            Reusable Data: Other Requisition title;Comment Box;Collaborator;File Name;Automatic Fill Requisition;Internal Questionnaire;External Questionnaire;HRBP
...            Dynamic Data: Requisition ID;Requisition title;Internal Candidate Description
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP022.json
${csv_path}  ./CSV/td_BP022.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***
Scenario: Collaborators ( Collaborator edits a requisition )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Collaborator User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
#    And Go to my team hiring
    Go to hiring
    Log  Step 7 - 10
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 11
    Click on details button
    Log  Step 12 - 15
    Edit Basic Info  ${data}
    Log  Step 16 - 21
    Edit Hiring Team  ${common_data}
    Log  Step 22 - 27
    Edit PD Internal Description  ${data}[Internal Candidate Description]
    Log  Step 28 - 34
    Edit Attachments  ${common_data}[File Name]
    Log  Step 35 - 39
    Edit Configuration  ${data}[Automatic Fill Requisition]
    Log  Step 40 - 46
    Edit Questionnaires  ${data}
    Logout
