*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobOffers.robot
Documentation  Add Temporary Assignment For Internal Employee
...            Prerequisite:  Requisition Id
...            Environment Specific Data:  Journeys Specialist User
...            Reusable Data: Action;Source Assignment Status;Comments
...            Dynamic Data: Requisition Id;Candidate;Assignment Change Start;Contract Start Date;Contract End Date;Manager;Salary Basis;Salary Amount
...            Automation Data: RequisitionId (Data fetch from Automation code)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP084_Temporary_Assignment.json
${csv_path}  ./CSV/td_BP084_Temporary_Assignment.csv
*** Test Cases ***

Scenario: Enter Hire Information ( Temporary Assignment for Internal Employee )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Journeys Specialist User]
    click on homepage
    Go to my client groups show more
    Click on Manage Job Offers
    Take Action on Job Offer  ${data}[Requisition Id]  ${data}[Candidate]  ${data}[Action]    ${data}
    Logout