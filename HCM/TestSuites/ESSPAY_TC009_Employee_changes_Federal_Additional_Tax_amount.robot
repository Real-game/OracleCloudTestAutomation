*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/TaxCreditInformation.robot
Resource  ../PageObjects/Pay.robot

Documentation  employee changes Federal Additional Tax amount
...            Prerequisite:  Federal Additional Tax Information should already be logged in the system
...            Environment Data:  Login User is environment specific; Additional Tax Amount
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC009_Employee_changes_Federal_Additional_Tax_amount.json
${csv_path}  ./CSV/td_ESSPAY_TC009_Employee_changes_Federal_Additional_Tax_amount.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***

Scenario: employee changes Federal Additional Tax amount
    [Tags]  PayrollTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[ESSPAY Login User]
    click on homepage
    Log  Step 4-5
    Click on Pay
    Click on Tax Credit Information
    Click on Edit Federal
    Enter Additional Tax as  ${data}[AdditionalTax]
    Click on I agree checkbox
    Click on Save and Close
