*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Login.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_BP001.json
#${csv_path}  ./CSV/td_BP001.csv
*** Test Cases ***

Scenario: Run Payroll Report
    #generatejson  ${csv_path}  ${json_path}
    #${data}=  readJson  ${json_path}
    Log  Step 1
    Login Using  raghavi.uthayakumar@accenture.com
    Log  Step 2
    Apply MX Accruals Bank Validation Report