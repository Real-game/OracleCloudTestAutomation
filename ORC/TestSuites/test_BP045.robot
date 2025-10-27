*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot
Resource  ../PageObjects/Jobs.robot
Resource  ../PageObjects/ReferACandidate.robot
Documentation  Refer a Job (Employee)
...            Prerequisite:  Job ID
...            Environment Specific Data:  Hiring Manager Login
...            Reusable Data: Mobile Number Code; Mobile Number Prefix; Mobile Number Suffix; Notes
...            Dynamic Data: Email Address; Candidate Title; Candidate First Name; Candidate Last Name; Employee Title
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***

${json_path}    ./TestData/td_BP045.json
${csv_path}  ./CSV/td_BP045.csv


*** Test Cases ***

Scenario: Refer a Job (Employee)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring Manager user]
    click on homepage
    Go to Current Jobs
    Click on Search
    Search for the job and click on actions  ${data}[Job Id]
    Click on Refer A candidate option
    Refer a Candidate   ${data}[Email Address]   ${data}[Candidate Title]   ${data}[Candidate First Name]   ${data}[Candidate Last Name]    ${data}[Mobile Number Code]  ${data}[Mobile Number Prefix]  ${data}[Mobile Number Suffix]
    Submit the candidate referral
    Logout



