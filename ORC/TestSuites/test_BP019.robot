*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CandidateSearch.robot
Resource  ../PageObjects/CandidateProfileDetails.robot
Resource  ../PageObjects/CheckDuplicates.robot
Resource  ../PageObjects/MergeCandidates.robot
Documentation  Recruiter checks duplicate candidates
...            Prerequisite:  Candidate details should be available in environment
...            Environment Specific Data:  Recruiter user name
...            Reusable Data:  Candidate Name;Candidate;Action
...            Dynamic Data:  Candidate First Name


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP019.json
${csv_path}  ./CSV/td_BP019.csv
*** Test Cases ***
Scenario: Duplicate Check ( Recruiter checks duplicate candidates )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter Username]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  STEP 3
    Click on the Candidate Search link
    Log  STEP 4 - 5
    Search for the candidate  ${data}[Candidate Name]
    Log  STEP 6
    Select Candidate  ${data}[Candidate]
    Log  STEP 7
    Select Actions  ${data}[Action]
    Log  STEP 8 - 11
    Click Merge
    Log  STEP 12
    Logout

