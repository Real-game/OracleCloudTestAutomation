*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../PageObjects/JobRequisitions.robot
Documentation  Requisition View
...            Prerequisite: Requisition linked with Login User
...            Environment Specific Data: Hiring Manager Login
...            Reusable Data: Not Applicable
...            Dynamic Data: Requisition ID from the same hiring team
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP020.json
${csv_path}  ./CSV/td_BP020.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***
Scenario: Requisition View
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Hiring Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my team hiring
    Log  Step 7 - 11
    Search for the presence of requisition id  ${data}[Requisition ID from the same hiring team]