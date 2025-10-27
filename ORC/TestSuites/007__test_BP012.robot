*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobRequisitionInterviews.robot
Resource  ../PageObjects/CreateInterviewSchedule.robot
Documentation  Schedule Interviews ( Recruiter schedule Interviews )
...            Prerequisite:  Requisition has Active Application
...            Environment Specific Data:  Recruiter user
...            Reusable Data: Template; Number of openings; Actions
...            Dynamic Data: Not Applicable
...            Automation Data: Requisition ID (Get from BP001)


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP012.json
${csv_path}  ./CSV/td_BP012.csv
${prerequisites_json_path}  ./TestData/td_BP001.json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***
Scenario: Schedule Interviews ( Recruiter schedule Interviews )
    [Tags]  ExternalNewHire
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1
    Login Using  ${common_data}[Recruiter user]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 4
    Click on Interviews
    Log  Step 5
    Click on Add Interview
    Log  Step 6 - 18
    Schedule Interview  ${data}
    Log  Step 19
#    Publish Interview  ${data}[Actions]
    Logout

