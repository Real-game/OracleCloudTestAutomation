*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/CreateInterview.robot
Resource  ../PageObjects/JobRequisitionInterviews.robot
Resource  ../PageObjects/FirstRoundInterview.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/SendInterviewInvite.robot
Documentation  Schedule Interviews(Recruiter adds interview slot to schedule)
...            Prerequisite:  Requisition has Active Application with Active Interview Schedule Template
...            Environment Specific Data:  Recruiter Username
...            Reusable Data: Start time; End time; Web Conference link; Meeting Duration
...            Dynamic Data:  Interviewer Name
...            Automation Data: Requisition ID (Get from BP001); Candidate (Name Get from BP017)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP038.json
${csv_path}  ./CSV/td_BP038.csv
${prerequisites_json_path}  ./TestData/td_BP001.json  #If we want to run BP038 seperately - Update BP001 Json
${prerequisites_json_path2}  ./TestData/td_BP017.json  #If we want to run BP038 seperately - Update BP017 Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***
Scenario: Schedule Interviews(Recruiter adds interview slot to schedule)
    [Tags]  ExternalNewHire  April19
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
    ${prerequisites_data2}=  readJson  ${prerequisites_json_path2}
    appendtojson  ${json_path}  Candidate  ${prerequisites_data2}[Candidate Name]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1
    Login Using  ${common_data}[Recruiter user]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id   ${data}[Requisition ID]
    Log  Step 4
    Click on the interviews link
    Click on First Round Interview
    Click on Add button in First Round Interview page
    Create Interview   ${data}[Start time]    ${data}[End time]    ${data}[Meeting Duration]    ${data}[Web Conference link]    ${common_data}[Interviewer Name]
    Click on back button in First Round Interview page
    Click on Overview link in the side panel
    Sleep  3s
#    Click on Active Applications
#    Sleep  4s
#    Select Application  ${data}[Candidate]
#    Click on Actions and Select Send Interview Invite
#    Select Schedule and Save
    Logout
