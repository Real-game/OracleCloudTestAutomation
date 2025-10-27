*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Override Benefit Plans in Benefits Enrollment
...            Prerequisite:  TC006
...            Environment Data:  Login User, Person Number
...            Reusable Data: Start Date
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC007_Override_Benefit_Plans.json
${csv_path}  ./CSV/td_TC007_Override_Benefit_Plans.csv
*** Test Cases ***

Scenario: Override Benefit Plans
    [Tags]  BenefitsTestCase  ModifyData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    click on homepage
    Log  Step 4
    Click on Benefits Administration
    Log  Step 5
    Click on Enrollment
    Log  Step 6-7
    Search and click on newly hired Person  ${data}[PersonNumber]
    Log  Step 8-9
    Wait And Verify Page Contains Text  Benefits Summary  10s  Benefits Summary page for selected person is not displayed
    ${plan_number}   Select Enrollment plan for Override
    Log  Step 10
    Enter Coverage Start Date  ${data}[Start Date]
    Log  Step 11
    Click Save And Close
    Log  Step 12
    Verify Enrollment Plan has Overrided  ${plan_number}