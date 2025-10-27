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
Documentation  Create and validate offer letter for internal candidate
...            Prerequisite:  Candidate profile must be created
...            Environment Specific Data:  Recruiter User
...            Reusable Data:  Requisition ID;Candidate
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP048.json
${csv_path}  ./CSV/td_BP048.csv

*** Test Cases ***

Scenario: Manage offers - Executive ( Create an executive offer for external candidate)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step-1
    Login Using  ${data}[Recruiter User]
    Log  Step-2
    click on homepage
    Go to my client group hiring
    Log  Step-3 - 4
    Search for requisition id  ${data}[Requisition_ID]
    Log  Step-5
    Click on Active Applications
    Log  Step-6
    Select Application By Candidate Name  ${data}[Candidate]
    Log  Step-7
    Click on Actions and Select  ${data}
    Log  Step-8 - 9
    Select Sections
    Log  Step-10 - 11
    Fill When and Why with Transfer Action  ${data}
    Log  Step-12 - 13
    Fill Assignment Info for Transfer  ${data}
    Log  Step-14 - 15
    Fill Offer Team  ${data}
    Log  Step-16 - 17
    Fill Payroll Info  ${data}
    Log  Step-18 - 19
    Fill Salary  ${data}
    Log  Step-20 - 21
    Fill Attachments  ${data}
    Log  Step-22 - 23
    Fill Additional Info  ${data}
    Log  Step-24 - 28
    Fill Offer Letter  ${data}
    Log  Step-29
    Click on Submit
    Logout



