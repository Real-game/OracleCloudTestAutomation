*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot
Documentation  Verify Benefit Plans Can Be Viewed
...            Prerequisite:  SME intervention need
...            Environment Data:  Login User is environment specific; Person Number
...            Reusable Data: Not Applicable
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC086_Verify_Benefit_Plans_Can_Be_Viewed.json
${csv_path}  ./CSV/td_PAY_TC086_Verify_Benefit_Plans_Can_Be_Viewed.csv
${common_json_path}  ./TestData/Payroll_common_test_data.json
${common_csv_path}  ./CSV/Payroll_common_test_data.csv
*** Test Cases ***
Scenario: Verify benefit plans can be viewed
    [Tags]  PayrollTestCase567  ReadOnly  PAY22D
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Login User]
    Log  Step 4 - 6
    click on homepage
    Click on Benefits Administration
    Log  Step 6 - 7
    Click on Enrollment
    Search and click on newly hired Person  ${data}[Person Number]
    Log  Step 8 - 10
    Wait And Verify Page Contains Text  Benefits Summary  30  Benefits Summary page not found
    Wait And Verify Page Contains Text  Benefits Relationships  30  Benefits Relationships page not found
    Wait And Verify Page Contains Text  Benefit Balances  30  Benefit Balances page not found
    Wait And Verify Page Contains Text  Benefit Groups  30  Benefit Groups page not found
    sleep  5s
    Wait And Click Element  link: Benefits Relationships
    wait until element is visible  xpath: //span[text()="Active"]  30  Benefits Relationships plan is not Active
    Capture Page Screenshot And Retry If Required