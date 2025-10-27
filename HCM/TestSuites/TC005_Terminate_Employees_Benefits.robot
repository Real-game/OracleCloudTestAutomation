*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Terminate Employees Benefits in benefits Enrollment
...            Prerequisite: DC09
...            Environment Data:  Login User is environment specific(Benefits_common_test_data.csv)
...            Reusable Data: Not Applicable
...            Dynamic Data: Employee person number whose tenure is more than 30 days(Benefits_common_test_data.csv); terminated and life event is in detected state

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_TC005_Terminate_Employees_Benefits.json
#${csv_path}  ./CSV/td_TC005_Terminate_Employees_Benefits.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***

Scenario: Terminate Employees Benefits in benefits Enrollment
    [Tags]  BenefitsTestCase  ModifyData
#    generatejson    ${csv_path}  ${json_path}
#    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Benefits Administration
    Log  Step 6
    Click on Enrollment
    Log  Step 7 - 8
    Enter Person Number and Click on Advanced Search  ${common_data}[PersonNumber]
    Log  Step 9 - 10
    Check Inactive Assigment Status Checkbox and Click Person  ${common_data}[PersonNumber]
    Log  Step 11
    Verify Termination Event in Potential Life Events
    Log  Step 12
    Click Actions and Select an Action  Evaluate Life Events
    Log  Step 13
    Verify Termination Event in Evaluated Life Events
    Log  Step 14
    Sleep  50s
    Click Benefit Plan and Verify End Date

