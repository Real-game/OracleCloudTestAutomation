*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Payroll.robot

Documentation  Add payroll frequency (single assignment and multiple assignment)
...            Prerequisite: HR - 81
...            Environment Data:  Login User is environment specific
...            Reusable Data: Not Applicable
...            Dynamic Data: New Hire Employee Number with no Payroll Details

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC13_add_Payroll_frequency.json
${csv_path}  ./CSV/td_DC13_add_Payroll_frequency.csv

*** Test Cases ***

Scenario: Add payroll frequency (single assignment and multiple assignment)
    [Tags]  DataSetup  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go To My Client Group
    Log  Step 6 - 7
    Click on Payroll
    Click on Payroll Relationships
    Log  Step 8
    Search and click on Person  ${data}[Single Assignment Employee Number]
    Log  Step 9
    Select Effective As on Date
    Log  Step 10 - 16
    Click on Assigment under Payroll Relationship:Worker  ${data}[Payroll Duration]
#    Log  Step 17
#    Click on Payroll Relationships
#    Search and click on Person  ${data}[Multiple Assignment Employee Number]
#    Log  Step 18 - 19
#    Click on Latest Assignment under Payroll Relationship:Worker
#    Log  Step 20 -22
#    Click on old Assignment under Payroll Relationship:Worker
#    Log  Step 23 - 25
#    Click on Latest Assignment under Payroll Relationship:Worker
#    Log  Step 26 - 30
#    Add Payroll Frequency  ${data}[Payroll Duration]