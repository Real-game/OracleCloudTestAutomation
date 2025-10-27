*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP055.json
${csv_path}  ./CSV/td_BP055.csv
*** Test Cases ***

Scenario: Present and Manage Offers ( Candiate offer response (Internal) )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Internal Candidate]
    Log  Step 2
    click on homepage
    Log  Step 3
    Go to Current Jobs
    Log  Step 4
    Click on Submitted Applications
    Log  Step 5
    Click on Accept button
    Log  Step 6
    Sign Employee Signature  ${data}[Signature]
    Log  Step 7
    Click on Submit Accept Offer
    Sleep    10s
    Logout
#    Search for Offer Notifications
#    Log  Step 3 - 11
#    Respond to Job Offer Internal  ${data}[Respond to Offer]  ${data}[Decline Reason]  ${data}[Comments]  ${data}[Employee Name]
#    Logout
