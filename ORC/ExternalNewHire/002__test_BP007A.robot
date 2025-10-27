*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Documentation  Submit a Job Requisition
...            Prerequisite:  Requisition in Draft status
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Posting description
...            Dynamic Data: Not Applicable
...            Automation Data: RequisitionId (Get from BP001)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP007A.json
${csv_path}  ./ExternalNewHireCSV/td_BP007A.csv
${prerequisites_json_path}  ./TestData/td_BP001A.json  #If we want to run BP007A seperately - Update BP001A Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Submit a Job Requisition
    [Tags]  ExternalNewHireA
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Login Using  ${common_data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id without detail link  ${data}[Requisition ID]
    Submit Job Requisition by Reviewer  ${data}
    Logout