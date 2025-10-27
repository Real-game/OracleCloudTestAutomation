*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/Agents.robot
Documentation  Post requisition to Agencies
...            Prerequisite: Requisition ID in Submitted Status
...            Environment Specific Data: Recruiter User
...            Reusable Data: Agent Name
...            Dynamic Data: Requisition ID
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP068.json
${csv_path}  ./CSV/td_BP068.csv

*** Test Cases ***

Scenario: Internal Job Application Flow
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter User]
    click on homepage
    Go to my client group hiring
    Log  Step 2
    Search for requisition id  ${data}[Requisition ID]
    Click on Posting link
    Log  Step 3-4
    Select advanced search in Staffing Agents
    Sleep  15s
    Add a Agent  ${data}[Agent Name]
    Logout


