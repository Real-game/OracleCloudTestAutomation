*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../PageObjects/PostingDetail.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Documentation  Post Job Requisition in Internal and External sites
...            Prerequisite:  Requisition in Submitted Status
...            Environment Specific Data:  Recruiter user
...            Reusable Data: External career site posting option;Internal career site posting option
...            Dynamic Data: External career site Expiry date;Internal career site Expiry date
...            Automation Data: Requisition ID (Get from BP001)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP021A.json
${csv_path}  ./ExternalNewHireCSV/td_BP021A.csv
${prerequisites_json_path}  ./TestData/td_BP001A.json  #If we want to run BP021A seperately - Update BP001A Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Post Job Requisition
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
    Search for requisition id    ${data}[Requisition ID]
    Sleep  3s
    Click on Actions dropdown
    Click on Move to Posting
    Edit Internal Career Site Posting Information   ${data}[External career site Expiry date]
    Sleep  2s
    Edit External Career Site Posting Information Section   ${data}[External career site Expiry date]
    Logout
    Sleep  480s
