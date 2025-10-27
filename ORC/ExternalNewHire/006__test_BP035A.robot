*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/MoveCandidate.robot
Resource  ../PageObjects/CheckDuplicates.robot
Documentation  Evaluate and Select Applicants ( Recruiter moves candidate through selection process )
...            Prerequisite:  Requisition has Active Application
...            Environment Specific Data:  Hiring Manager Login; Recruiter user]
...            Reusable Data: Move to State;Move to Phase
...            Dynamic Data: Offer Action
...            Automation Data: Requisition ID (Get from BP001); Candidate (Name Get from BP017)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP035A.json
${csv_path}  ./ExternalNewHireCSV/td_BP035A.csv
${prerequisites_json_path}  ./TestData/td_BP001A.json  #If we want to run BP035A seperately - Update BP001A Json
${prerequisites_json_path2}  ./TestData/td_BP017A.json  #If we want to run BP035A seperately - Update BP017A Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Evaluate and Select Applicants ( Recruiter moves candidate through selection process )
    [Tags]  ExternalNewHireA
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
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 4
    Click on Active Applications
    Log  Step 5
    Select Application  ${data}[Candidate]
    Log  Step 6
    Click on Move
    Select Phase  ${data}[Move to Phase]
    Select State  ${data}[Move to State]
    Log  Step 7
    Click on Save
    Log  Step 8 - 9
    Click on Actions and Select  ${data}
    Click Merge
    Log  Step 10
    Logout
    Login Using  ${common_data}[Hiring Manager Login]
    Log  Step 11
    click on homepage
    Go to my team hiring
    Log  Step 12 - 13
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 14
    Click on Active Applications
    Select Application  ${data}[Candidate]
    Logout


