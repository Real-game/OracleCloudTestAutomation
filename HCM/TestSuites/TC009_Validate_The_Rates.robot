*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot
Documentation  Validate The Rates
...            Prerequisite:  Employee person number should be available in environment
...            Environment Data:  Login User(Benefits_common_test_data.csv); Person Number(Benefits_common_test_data.csv)
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_TC009_Validate_The_Rates.json
#${csv_path}  ./CSV/td_TC009_Validate_The_Rates.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Validate The Rates
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
    Log  Step 7
    Search and click on newly hired Person  ${common_data}[PersonNumber]
    Log  Step 8
    Select First Enrollment plan
    Log  Step 9 - 12
    Expand and Check Defined and Communicated Amount
