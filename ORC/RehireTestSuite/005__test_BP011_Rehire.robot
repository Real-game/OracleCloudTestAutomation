*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/MoveCandidate.robot
Documentation  Screen Applicants ( Recruiters screens the candidate in Candidate Selection process )
...            Prerequisite:  Requisition has Active Application
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Move to State;Move to Phase
...            Dynamic Data: Not Applicable
...            Automation Data: Requisition ID (Get from BP001); Candidate (Name Get from BP017)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP011_rehire.json
${csv_path}  ./RehireCSV/td_BP011_rehire.csv
${prerequisites_json_path}  ./TestData/td_BP001_rehire.json  #If we want to run this case seperately - Update td_BP001_rehire Json
${prerequisites_json_path2}  ./TestData/td_Change_Mail_for_Candidate.json  #If we want to run this case seperately - Update td_Change_Mail_for_Candidate Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Screen Applicants ( Recruiters screens the candidate in Candidate Selection process )
    [Tags]  RehireProcess
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
    Click on Details
    Review personal details  ${data}[Candidate]
    Click on Attachments
    Download Attached Files
    Click on Questions Button
#    Click on Extra Info
    Log  Step 6 - 7
    Click on Move
    Select Phase  ${data}[Move to Phase]
    Log  Step 8 - 9
    Select State  ${data}[Move to State]
    Click on Save
    Logout
