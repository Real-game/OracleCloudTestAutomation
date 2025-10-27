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
${json_path}    ./TestData/td_BP007.json
${csv_path}  ./CSV/td_BP007.csv
${prerequisites_json_path}  ./TestData/td_BP001.json  #If we want to run BP007 seperately - Update BP001 Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Submit a Job Requisition
    [Tags]  ExternalNewHire  April19
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