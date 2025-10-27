*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/Login.robot
Documentation  Candidate search for jobs using filters
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Not Applicable
...            Reusable Data:  Sort By Work Locations
...            Dynamic Data:  Not Applicable


*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP015.json
${csv_path}  ./CSV/td_BP015.csv
*** Test Cases ***
Scenario: Candidate search for jobs using filters
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 2
    Click on View All Jobs
    Log  Step 3
    Click on Filter
    Log  Step 4
    Apply WorkLocations  ${data}[Sort By Work Locations]
    Log  Step 5
    Click on IamEmployee
    Log  Step 6 - 7
#    Login Using  ${data}[Candidate User]
#    Reload Page
#    Logout
