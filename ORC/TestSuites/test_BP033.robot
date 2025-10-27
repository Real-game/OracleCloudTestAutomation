*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/RolesAndDelegation.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP033.json
${csv_path}  ./CSV/td_BP033.csv


*** Test Cases ***
Scenario: Plan Recruiting(Recruiter and hiring manager previlege)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  ${data}[Recruiter user]
    click on homepage
    Log  Step 2
    Click on Roles & Delegation
    Log  Step 3
    Verify roles associated are listed in Roles section  ${data}[Roles Associated]
    Log  Step 4-9
    Add Role & Delegation   ${data}[Role Name]   ${data}[Start date]   ${data}[End date]   ${data}[Delegated to]
    Logout
    Log  Step 11
    Login Using  ${data}[Delegated user]
    click on homepage
    Log  Step 12
    Click on Roles & Delegation
    Log  Step 13
    Verify roles associated are listed in Roles section  ${data}[Delegated Roles Added]
    Logout
    Log  Step 1
    Login Using  ${data}[Hiring manager user]
    click on homepage
    Log  Step 2
    Click on Roles & Delegation
    Log  Step 3
    Verify roles associated are listed in Roles section  ${data}[Hiring manager Roles Associated]
    Log  Step 4-5
    Verify Role Addition Permission   ${data}[Hiring manager Role Name]
    Logout




