*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Resource  ../PageObjects/EvaluatePerformance.robot
Documentation  Manager - Share Annual Performance Review Document with the employee
...            Prerequisite:  Annual Performance Review Document for Employee should be available in Share and release status
...            Environment Specific Data:  Manager Login(PMP_Talent_common_test_data.csv)
...            Reusable Data: Not Applicable
...            Dynamic Data: Review Period; Performace Doc; Manager Name

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PMP_TC07_Manager_Share_Annual_Performance_Review_Document_with_the_Employee.json
${csv_path}  ./CSV/td_PMP_TC07_Manager_Share_Annual_Performance_Review_Document_with_the_Employee.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Manager - Share Annual Performance Review Document with the employee
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[Manager Login]
    Log  Step 4
    click on homepage
    Go To My Team
    Log  Step 5
    Click On Performance
    Log  Step 6
    Select Performance Review Period  ${common_data}[Review Period]
    Search For Person  ${common_data}[Person Name]
    Select Document  ${common_data}[Performace Doc]
#    Select Employee Self Evaluation Section  ${data}[Manager Name]  ${data}[Review Section]
    Log  Step 7
    Click on share and release
    Log  Step 8
    Click on Submit Button
