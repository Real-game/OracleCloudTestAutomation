*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Documentation  EA/AA initiates a Job requisition on behalf of Hiring Manager
...            Prerequisite:  Position Code
...            Environment Specific Data:  EA or AA User
...            Reusable Data: Use; Business Justification; File Path; Recruiting type
...            Dynamic Data: position_id; Hiring Manager; HRBP; Collaborator; Recruiter
...            Automation Data: RequisitionId (fetch from Automation code)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP008.json
${csv_path}  ./CSV/td_BP008.csv
*** Test Cases ***

Scenario: Create Job Requisition
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[EA or AA User]
    Log  Step 4
    click on homepage
#    Go to my team create job requisition
    Log  Step 5
    Go to hiring
    Log  Step 6
    Click on add button
    Log  Step 7 - 25
    Create Requisition  ${data}
    ${req_id} =  Get Requisition Id
    appendtojson  ${json_path}  RequisitionId  ${req_id}
    generatecsv  ${json_path}  ${csv_path}
    Logout