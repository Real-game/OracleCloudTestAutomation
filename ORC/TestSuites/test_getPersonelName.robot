*** Settings ***
Library  Selenium2Library
Library  DataDriver  ../CSV/td_getPersonelName.csv

Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test
Test Template  Fetch Names of Users

*** Variables ***
${json_path}    ./TestData/td_getPersonelName.json
${csv_path}  ./CSV/td_getPersonelName.csv

*** Test Cases ***
Fetch Names of Users - ${Id} ${LoginUser}

*** Keywords ***
Fetch Names of Users
    [Arguments]  ${Id}  ${LoginUser}
    Log  Step 1
    Login Using  ${LoginUser}
    Log  Step 2
    click on homepage
    Go to Personal Details Page
    store username in csv  ${csv_path}  ${Id}  Name
    Logout