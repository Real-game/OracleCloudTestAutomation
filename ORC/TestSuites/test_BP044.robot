*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Documentation  Recruiter checks duplicate candidates
...            Prerequisite:  Multiple Requsitions ID's should be created
...            Environment Specific Data:  Login User
...            Reusable Data:  Requisition ID;Candidate;Notification Action;Recruiter Username;
...            Dynamic Data:  Requisition ID;Candidate

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP044.json
${csv_path}  ./CSV/td_BP044.csv
*** Test Cases ***

Scenario: Present and Manage Offers ( HM Approve Offer )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Login User]
    Log  Step 2
    click on homepage
#    Search for Notifications  ${data}[Candidate]
    Go to my team hiring
    Search for requisition id  ${data}[Requisition ID]
    Click on Active Applications
    Select Application  ${data}[Candidate]
    Log  Step 3 - 4
    Review Offer and Take Action  ${data}[Notification Action]
    Logout
    Log  Step 5
    Login Using  ${data}[Recruiter Username]
    Log  Step 6
    #Search for Notifications  ${data}[Candidate]
    Log  Step 7 - 8
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${data}[Requisition ID]
    Click on Active Applications
    Select Application  ${data}[Candidate]
    Click on Actions and Select  ${data}
    Click on Actions and Select Edit Offer
    Logout
