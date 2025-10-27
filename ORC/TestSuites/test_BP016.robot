*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CandidateSearch.robot
Resource  ../PageObjects/CandidateSearchResult.robot
Documentation  Recruiter search candidates
...            Prerequisite:  Candidate details should be available in environment
...            Environment Specific Data:  Recruiter user name
...            Reusable Data:  Not Applicable
...            Dynamic Data:  Candidate First Name


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP016.json
${csv_path}  ./CSV/td_BP016.csv

*** Test Cases ***

Scenario: Plan Recruiting requisition view verification
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log   Step 1
    Login Using  ${data}[Recruiter user name]
    Log  Step 2
    click on homepage
    Log  Step 3
    Go to my client group hiring
    Log  Step 4
    Click on the Candidate Search link
    Verify keyword search feature
    Log  Step 5
    Search for the candidate   ${data}[Candidate First Name]
    Log  Step 6
    Select the candidate record  ${data}[Candidate First Name]
    Log  Step 7
    Logout