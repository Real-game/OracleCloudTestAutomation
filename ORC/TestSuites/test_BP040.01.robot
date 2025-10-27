*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/CreateJobOffer.robot
Documentation  Edit the Hiring Manager Name in Job Offer( Edit an offer for external candidate and Sumbit the Offer)
...            Prerequisite:  Requisition has Active Application and Job Offer created in Saved Status - (BP040)
...            Environment Specific Data:  Recruiter Username(Get from BP040)
...            Reusable Data: Offer Action
...            Dynamic Data: Hiring Manager Name
...            Automation Data: Requisition_ID (Get from BP040); Candidate (Name Get from BP040)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP040.01.json
${csv_path}  ./CSV/td_BP040.01.csv
${pre_req_json_path}    ./TestData/td_BP040.json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Edit Hiring Manager for Job Offer
    [Tags]  ExternalNewHire  April19
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    ${data2}=  readJson  ${pre_req_json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1
    Login Using  ${common_data}[Recruiter user]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3 - 4
    Search for requisition id  ${data2}[Requisition_ID]
    Log  Step 5
    Click on Active Applications
    Log  Step 6
    Select Application  ${data2}[Candidate]
    Log  Step 7
    Click on Actions and Select  ${data}
    Log  Step 8 - 9
    Select Offer Team Section
    Go to Offer Team block and edit hiring manager  ${common_data}[Hiring Manager]
    Click on Submit
    Logout