*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot
Resource  ../PageObjects/Jobs.robot
Resource  ../PageObjects/ReferAnEmployee.robot
Resource  ../PageObjects/CurrentJobsJobApplication.robot
Resource  ../PageObjects/ReferACandidate.robot
Documentation  Agent refer Candidate
...            Prerequisite:  Requisition Id
...            Environment Specific Data:  Hiring Manager user
...            Reusable Data: Not Applicable
...            Dynamic Data: Candidate First Name;Candidate Last Name;Candidate Email
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP059.json
${csv_path}  ./CSV/td_BP059.csv

*** Test Cases ***

Scenario: Job Application Flow - Internal Candidates(Refer a candidate and Refer an employee)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring Manager user]
    click on homepage
    Go to Current Jobs
#    Click on Job Applications
#    Withdraw an active job application  ${data}[Job Id]
#    Verify the requisition is shown as withdrawn after withdrawn  ${data}[Job Id]
#    Navigate back in Current jobs job application page
#    Click on Search
    Search for the job and click on actions  ${data}[Job Id]
    Click on Refer A candidate option
    Refer a Candidate   ${data}[Email Address]   ${data}[Candidate Title]   ${data}[Candidate First Name]   ${data}[Candidate Last Name]    ${data}[Mobile Number Code]  ${data}[Mobile Number Prefix]  ${data}[Mobile Number Suffix]
    Upload Resume    ${data}[File]
    Submit the candidate referral
    Sleep  7s
#    Click on Jobs Done button
    Refer Job Action
#    Search for the job and click on actions  ${data}[Job Id]
    Click on Refer An Employee option
    Refer an Employee   ${data}[Employee Title]  ${data}[Notes]
    Submit the Employee referral
    Sleep  10s
    Click on Jobs Done button
    Click on Referral tab
    Verify the submitted referral  ${data}[Job Id]   ${data}[Employee Title]
    click on homepage
    Logout




