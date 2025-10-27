*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobOffers.robot
Documentation  Transfer Internal Employee (Internal Candidate #1)
...            Prerequisite:  Requisition Id
...            Environment Specific Data:  Journeys Specialist User
...            Reusable Data: Requisition Id;Candidate;Action
...            Dynamic Data: Not Applicable
...            Automation Data: RequisitionId (Data fetch from Automation code)

*** Settings ***

Suite Setup  Before Suite
#Suite Teardown  After Suite
#Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP077.json
${csv_path}  ./CSV/td_BP077.csv
*** Test Cases ***

Scenario: Enter Hire Information ( Transfer Internal Employee )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Journeys Specialist User]
    click on homepage
    Go to my client groups show more
    Click on Manage Job Offers
    Take Action on Job Offer  ${data}[Requisition Id]  ${data}[Candidate]  ${data}[Action]  ${data}
    Logout