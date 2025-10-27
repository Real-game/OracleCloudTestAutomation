*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CandidateSearch.robot
Resource  ../PageObjects/CandidateSearchResult.robot
Resource  ../PageObjects/AddToRequisition.robot
Resource  ../PageObjects/CandidateDetail.robot

Documentation  Email Id Change for Terminated Candidate
...            Prerequisite:  Employee should be Terminated or Inactive
...            Environment Specific Data:  Recruiter username
...            Reusable Data:  Not Applicable
...            Dynamic Data:  Requisition ID; Candidate Name; Email


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_Change_Mail_for_Candidate.json
${csv_path}  ./RehireCSV/td_Change_Mail_for_Candidate.csv
${prerequisites_json_path}  ./TestData/td_BP001_rehire.json  #If we want to run this case seperately - Update td_BP001_rehire Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Get Person Number of a Terminated Candidate
    [Tags]  RehireProcess
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
    ${candidate_name}=  getCandidateName  ${data}[Candidate Name]
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7
    Click on the Candidate Search link
    Log  Step 8 - 9
    Search for the candidate    ${candidate_name}
    Log  Step 10
    Select the candidate record  ${candidate_name}
    Log  Step 11
#    Click on Expand Personal Info
#    Log  Step 12 - 16
#    Click on Personal Info Edit  ${data}[Email]
    Log  Step 17 - 18
    Select Add Requisition action to the Candidate Page
    Log  Step 19 - 21
    Add a requisition to the candidate  ${data}[Requisition ID]
    Log  Step 22
#    click on homepage
#    Sleep  5s
#    Log  Step 23 - 24
#    Go to my client group person management
#    Sleep  2s
#    Log  Step 25 - 32
#    ${Person_number}=  Get Person Number in Person Management Page  ${candidate_name}
#    appendtojson  ${json_path}  Candidate Person Number  ${Person_number}
#    generatecsv  ${json_path}  ${csv_path}
    Logout