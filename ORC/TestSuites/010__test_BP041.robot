*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Documentation  Present and Manage Offers ( HM Approve Offer )
...            Prerequisite:  Requisition has Active Application with Job Offer in Sumbitted Status
...            Environment Specific Data:  Hiring Manager Login
...            Reusable Data: Notification Action
...            Dynamic Data: Not Applicable
...            Automation Data: Requisition_ID (Get from BP001); Candidate (Name Get from BP017)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP041.json
${csv_path}  ./CSV/td_BP041.csv
${prerequisites_json_path}  ./TestData/td_BP001.json  #If we want to run BP041 seperately - Update BP001 Json
${prerequisites_json_path2}  ./TestData/td_BP017.json  #If we want to run BP041 seperately - Update BP017 Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Present and Manage Offers ( HM Approve Offer )
    [Tags]  ExternalNewHire  April19
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition ID  ${prerequisites_data}[RequisitionId]
    ${prerequisites_data2}=  readJson  ${prerequisites_json_path2}
    appendtojson  ${json_path}  Candidate  ${prerequisites_data2}[Candidate Name]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1
    Login Using  ${common_data}[Hiring Manager Login]
    Log  Step 2
    click on homepage
#    Search for Notifications  ${data}[Candidate]
    Log  Step 3 - 4
    Go to my team hiring
    Log  Step 5 - 7
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 8
    Click on Active Applications
    Log  Step 9
    Select Application  ${data}[Candidate]
    Log  Step 10 - 13
    Review Offer and Take Action  ${data}[Notification Action]
    Logout