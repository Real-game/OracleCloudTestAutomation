*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/CreateJobOffer.robot
Documentation  Create & validate Offer letter for External candidate
...            Prerequisite:  Requisition should be in extended status
...            Environment Specific Data:  Recruiter User
...            Reusable Data: Not Applicable
...            Dynamic Data: Requisition_ID;Candidate
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP026.json
${csv_path}  ./CSV/td_BP026.csv

*** Test Cases ***

Scenario: Create & validate Offer letter for External candidate
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Recruiter Username]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7 - 8
    Search for requisition id  ${data}[Requisition_ID]
    Log  Step 9
    Click on Active Applications
    Log  Step 10
    Select Application  ${data}[Candidate]
    Log  Step 11
    Click on Actions and Select  ${data}
    Log  Step 12 - 13
    Select Sections
    Log  Step 14 - 15
    Fill When and Why  ${data}
    Log  Step 16 - 17
    Fill Assignment Info  ${data}
    Log  Step 17 - 18
    Fill Offer Team  ${data}
    Log  Step 19 - 20
    Fill Payroll Info  ${data}
    Log  Step 21 - 22
    Fill Salary  ${data}
    Log  Step 23 - 24
    Fill Attachments  ${data}
    Log  Step 25 - 26
    Fill Additional Info  ${data}
    Log  Step 27 - 31
    Fill Offer Letter  ${data}
    Log  Step 32
    Click on Save
#    Click on Submit
    Sleep  20s
    Click on Details
    Wait Until Page Contains   Offer,   20   Offer phase text is not displayed
#    Wait Until Page Contains   approved   20   Offer state text is not displayed
    Sleep  10s
    Logout



