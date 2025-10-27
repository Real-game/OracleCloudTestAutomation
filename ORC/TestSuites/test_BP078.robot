*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobOffers.robot
Documentation  Transfer the internal Employee
...            Prerequisite:  Candidate details already present in environment
...            Environment Specific Data:  Email
...            Reusable Data: Menu Option
...            Dynamic Data: Title; First Name; Last Name; Country Code; Phone Number
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP078.json
${csv_path}  ./CSV/td_BP078.csv
*** Test Cases ***

Scenario: Enter Hire Information ( Promotion Internal Employee )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Journeys Specialist User]
    click on homepage
    Go to my client groups show more
    Click on Manage Job Offers
    Take Action on Job Offer  ${data}[Requisition Id]  ${data}[Candidate]  ${data}[Action]  ${data}
    Logout