*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Documentation  Hire and Enable Resources (Move the external candidate to HR)
...            Prerequisite:  Requisition has Active Application in Post Offer Checks - To be Checked status
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Offer Action
...            Dynamic Data: Not Applicable
...            Automation Data: Requisition Id (Get from BP001); Candidate (Name Get from BP017)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP052_rehire.json
${csv_path}  ./RehireCSV/td_BP052_rehire.csv
${prerequisites_json_path}  ./TestData/td_BP001_rehire.json  #If we want to run this case seperately - Update td_BP001_rehire Json
${prerequisites_json_path2}  ./TestData/td_Change_Mail_for_Candidate.json  #If we want to run this case seperately - Update td_Change_Mail_for_Candidate Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Hire and Enable Resources (Move the external candidate to HR)
    [Tags]  RehireProcess1
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition Id  ${prerequisites_data}[RequisitionId]
    ${prerequisites_data2}=  readJson  ${prerequisites_json_path2}
    appendtojson  ${json_path}  Candidate  ${prerequisites_data2}[Candidate Name]
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
    Log  Step 7 - 9
    Search for requisition id  ${data}[Requisition Id]
    Log  Step 10
    Click on Active Applications
    Log  Step 11
    Select Application  ${data}[Candidate]
    Log  Step 12 - 15
    Click on Actions and Select  ${data}
    Logout

