*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/AddToRequisition.robot
Resource  ../PageObjects/CandidateDetail.robot
Resource  ../PageObjects/CandidateSearch.robot
Resource  ../PageObjects/CandidateSearchResult.robot
Documentation  Prospect to Candidate
...            Prerequisite:  Position code
...            Environment Specific Data:  Recruiter Login
...            Reusable Data: Candidate Name;Requisition Title;Requisition ID;Candidate Name;Requisition ID;Prospect Candidate
...            Dynamic Data: Not Applicable
...            Automation Data: RequisitionId (Data fetch from Automation code)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP006.json
${csv_path}  ./CSV/td_BP006.csv


*** Test Cases ***
Scenario: Prospect to Candidate
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Recruiter Username]
    click on homepage
    Go to my client group hiring
    Click on the Candidate Search link
    Search for the candidate    ${data}[Candidate Name]
    Select Add Requisition action to the search candidate
    Add a requisition to the candidate  ${data}[Requisition ID]
    Select the candidate record  ${data}[Candidate Name]
    Click on the convert to prospect option in the candidate detail page
    click on homepage
    Go to my client group hiring
    Search requisition  ${data}[Requisition ID]
    Click on Prospects
    Click on Prospect Candidate  ${data}[Prospect Candidate]
    Convert Prospect
#    Logout