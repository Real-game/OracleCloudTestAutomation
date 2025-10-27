*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Terminate Employees Benefits in benefits Enrollment
...            Prerequisite:
...            Environment Data:  Login User is environment specific
...            Reusable Data: Not Applicable
...            Dynamic Data: Employee person number whose tenure is more than 30 days, terminated and life event is in detected state

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC005_Terminate_Employees_Benefits.json
${csv_path}  ./CSV/td_TC005_Terminate_Employees_Benefits.csv

*** Test Cases ***

Scenario: Terminate Employees Benefits in benefits Enrollment
    [Tags]  BenefitsTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Benefits Administration
    Log  Step 6
    Click on Enrollment
    Log  Step 7 - 8
    Enter Person Number and Click on Advanced Search  ${data}[PersonNumber]
    Log  Step 9 - 10
    Check Inactive Assigment Status Checkbox and Click Person  ${data}[PersonNumber]
    Log  Step 11
    Verify Termination Event in Potential Life Events
    Log  Step 12
    Click Actions and Select an Action  Evaluate Life Events
    Log  Step 13
    Verify Termination Event in Evaluated Life Events
    Log  Step 14
    Click Benefit Plan and Verify End Date

