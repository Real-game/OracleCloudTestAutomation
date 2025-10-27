*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CandidateSearch.robot
Resource  ../PageObjects/AddCandidate.robot
Documentation  To Create Candidate profile
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Recruiter user name
...            Dynamic Data:  Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP018.json
${csv_path}  ./CSV/td_BP018.csv

*** Test Cases ***

Scenario: Create a candidate
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Recruiter user name]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7
    Click on the Candidate Search link
    Log  Step 8 - 9
    Click on Add Candidate button
    Log  Step 10 - 19
    Add a Candidate  ${data}
    Log  Step 20 - 28
    Add a unique Candidate  ${data}
    Logout

