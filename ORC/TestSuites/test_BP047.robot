*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot
Resource  ../PageObjects/Jobs.robot
Resource  ../PageObjects/JobPage.robot
Resource  ../PageObjects/CompleteJobApplication.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP047.json
${csv_path}  ./CSV/td_BP047.csv

*** Test Cases ***

Scenario: Internal Job Application Flow
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring Manager user]
    click on homepage
    Go to Current Jobs
    Click on Search
    Search Job  ${data}[Job Id]
    Sleep  10s
    #Verify Job Details  ${data}[Min sal]  ${data}[Max sal]  ${data}[Job Type]
    Click on Apply
#    Answer Questions  ${data}
    Sleep  20s
    Upload Resume  ${data}[Resume Path]
    Sign Signature  ${data}[E-sign]
    Click on Submit Job Application
    Logout




