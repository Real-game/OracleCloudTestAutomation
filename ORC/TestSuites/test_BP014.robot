*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP014.json
${csv_path}  ./CSV/td_BP014.csv

*** Test Cases ***

Scenario: Plan Recruiting requisition view verification
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Login Using  ${data}[Hiring manager user]
    click on homepage
    Go to my team hiring
    Search for the presence of requisition id  ${data}[Requisition ID from the same hiring team]
    Element Should Be Visible   ${req_title}
    Logout
    Login Using  ${data}[Hiring manager user]
    click on homepage
    Go to my team hiring
    Search for the presence of requisition id  ${data}[Requisition ID from the direct reportees]
    Element Should Be Visible   ${req_title}
    Logout
    Login Using  ${data}[Second hiring manager user]
    click on homepage
    Go to my team hiring
    Search for the absence of requisition id  ${data}[Requisition ID from the other hiring manager]
    Element Should Be Visible   ${no_search_result}
    Logout