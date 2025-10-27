*** Settings ***
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot

*** Settings ***

Suite Setup  Before Suite ExternalSite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP064.json
${csv_path}  ./CSV/td_BP064.csv
*** Test Cases ***
Scenario: Candidate Pool, Talent Community ( Join the talent pool (External Candidate) )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 2
    Click on View All Jobs
    Log  Step 3 - 11
    Click on Join Our Talent Pool  ${data}