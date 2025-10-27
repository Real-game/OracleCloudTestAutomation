*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Documentation  Present and Manage Offers ( Recruiter extend Offer )
...            Prerequisite:  Requisition has Active Application with Job Offer Approved status
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Offer Action
...            Dynamic Data: Not Applicable
...            Automation Data: Requisition_ID (Get from BP001); Candidate (Name Get from BP017)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP056B.json
${csv_path}  ./ExternalNewHireSecondCSV/td_BP056B.csv
${prerequisites_json_path}  ./TestData/td_BP001B.json  #If we want to run BP056B seperately - Update BP001B Json
${prerequisites_json_path2}  ./TestData/td_BP017B.json  #If we want to run BP056B seperately - Update BP017B Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Present and Manage Offers ( Recruiter extend Offer )
    [Tags]  ExternalNewHireB
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition_ID  ${prerequisites_data}[RequisitionId]
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
    Log  Step 3 - 4
    Go to my client group hiring
    Log  Step 5 - 7
    Search for requisition id  ${data}[Requisition_ID]
    Log  Step 8
    Click on Active Applications
    Log  Step 9
    Select Application  ${data}[Candidate]
    Log  Step 10 - 14
    Click on Actions and Select  ${data}
    Logout
