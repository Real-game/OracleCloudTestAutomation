*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/TaxCreditInformation.robot
Resource  ../PageObjects/Pay.robot

Documentation  employee changes Federal Total Claim amount
...            Prerequisite:  Federal Tax Credit Information should already be logged in the system
...            Environment Data:  Login User is environment specific, Total Claim Amount
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ESSPAY_TC008_Employee_changes_Federal_Total_Claim_amount.json
${csv_path}  ./CSV/td_ESSPAY_TC008_Employee_changes_Federal_Total_Claim_amount.csv
*** Test Cases ***

Scenario: employee changes Federal Total Claim amount
    [Tags]  PayrollTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    click on homepage
    Log  Step 4-5
    Click on Pay
    Click on Tax Credit Information
    Click on Edit Federal
    Enter Total Claim Amount as  ${data}[ClaimAmount]
    Click on I agree checkbox
    Click on Save and Close
