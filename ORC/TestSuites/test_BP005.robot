*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CurrentJobs.robot
Resource  ../PageObjects/Jobs.robot
Resource  ../PageObjects/JobPage.robot
Resource  ../PageObjects/CompleteJobApplication.robot
Documentation  Internal Job Application Flow
...            Prerequisite:  Job Id should be available
...            Environment Specific Data:   User Login
...            Reusable Data: Job Id;Min sal;Max sal;Job Type;Resume Path;E-sign
...            Dynamic Data: Not Applicable
...            Automation Data: Job Id (Data fetch from Automation code)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP005.json
${csv_path}  ./CSV/td_BP005.csv
*** Test Cases ***

Scenario: Internal Job Application Flow
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readjson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Login User]
    Log  Step 2
    click on homepage
    Go to Current Jobs
    Log  Step 3
    Click on Search
    Log  Step 4
    Search Job  ${data}[Job Id]
    Log  Step 5 - 7
    Verify Job Details  ${data}[Min sal]  ${data}[Max sal]  ${data}[Job Type]
    Log  Step 8
    Click on Apply
    Log  Step 9 - 10
#    Answer Questions  ${data}
    Sleep  60s
    #manually select questions
    Log  Step 11 - 12
    Upload Resume  ${data}[Resume Path]
    Log  Step 13
    Sign Signature  ${data}[E-sign]
    Log  Step 14
    Click on Submit Job Application
    Logout




