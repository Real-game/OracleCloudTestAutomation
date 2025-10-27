*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Resource  ../PageObjects/ExternalCandidateProfileHomePage.robot
Documentation  Candidate search for jobs using filters
...            Prerequisite:  Requisition ID
...            Environment Specific Data:
...            Reusable Data: Email;Requisition ID;Requisition_ID To Withdraw;Second Requisition ID
...            Dynamic Data: Not Applicable
...            Automation Data: RequisitionId (Data fetch from Automation code)

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}  ./TestData/td_BP060.json
${csv_path}  ./CSV/td_BP060.csv

*** Test Cases ***
Scenario: Candidate Application Submission
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Search Requisition  ${data}[Requisition ID]
    Click on Apply Now
    Enter Email  ${data}[Email]
    Fill Personal Info  ${data}
    Click on Submit Application
    Sleep  5s
    Show menu options and select With Application Submission  ${data}
    Click on Update
    Log  Withdraw an existing application
    Change Status  ${data}[Requisition_ID To Withdraw]
    Sleep  3s
    Go back to career site
    Search Requisition  ${data}[Second Requisition ID]
    Sleep  10s
    Click on Apply Now
    Sleep  10s
    Fill Personal Info  ${data}
    Click on Submit Application
    Sleep  10s