*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot
Resource  ../PageObjects/Jobs.robot
Resource  ../PageObjects/ReferAnEmployee.robot
Documentation  Refer an Employee
...            Prerequisite:  Job ID
...            Environment Specific Data:  Hiring Manager Login
...            Reusable Data: Not Applicable
...            Dynamic Data: Employee Title;Job Id;Candidate Name;Notes
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP050.json
${csv_path}  ./CSV/td_BP050.csv

*** Test Cases ***

Scenario: Internal Job Application Flow
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring Manager user]
    click on homepage
    Go to Current Jobs
    Click on Search
    Search for the job and click on actions  ${data}[Job Id]
    Click on Refer An Employee option
    Refer an Employee   ${data}[Employee Title]  ${data}[Notes]
    Submit the Employee referral
    Sleep  10s
    Click on Jobs Done button
    Click on Referral tab
    Verify the submitted referral  ${data}[Job Id]   ${data}[Candidate Name]
    click on homepage
    Logout

#    Login Using  ${data}[Internal Candidate]
#    click on homepage
#    Click on Notifications Icon
#    Verify referred notification   ${data}[Job Position]
#    click on homepage
#    Logout