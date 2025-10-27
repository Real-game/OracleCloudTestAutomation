*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/BenefitsServiceCenter.robot

Documentation  Contact Person Number To Identify Benefit Contact
...            Prerequisite:
...            Environment Data:  Login User is environment specific(Benefits_common_test_data.csv)
...            Reusable Data: Person Number(Benefits_common_test_data.csv), Dependent Name, Dependent Person Number
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC801_Contact_Person_Number_To_Identify_Benefit_Contact.json
${csv_path}  ./CSV/td_TC801_Contact_Person_Number_To_Identify_Benefit_Contact.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Contact Person Number To Identify Benefit Contact
    [Tags]  BenefitsTestCase  ReadOnly
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    click on homepage
    Log  Step 4
    Click on Benefits Administration
    Log  Step 5
    Click on Enrollment
    Log  Step 6-7
    Search and click on newly hired Person  ${common_data}[PersonNumber]
    Log  Step 8
    Click on Dental Benefit Plan and Verify Dependent name and number  ${data}[Dependent Name]  ${data}[Dependent Person Number]