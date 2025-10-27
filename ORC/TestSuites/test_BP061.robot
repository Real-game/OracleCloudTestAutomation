*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Documentation  Move the internal candidate to HR
...            Prerequisite:  Candidate profile must be created
...            Environment Specific Data:  Recruiter User
...            Reusable Data:  Job ID;Candidate
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP061.json
${csv_path}  ./CSV/td_BP061.csv

*** Test Cases ***

Scenario: Move the internal candidate to HR ( Hire and Enable Resources )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
	Login Using  ${data}[Recruiter User]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id  ${data}[Job ID]
    Log  Step 4
    Click on Active Applications
    Log  Step 5
    Select Application By Name  ${data}[Candidate Name]
    Log  Step 6
    Click on Actions and Select Move to HR
    Sleep  5s
    Logout