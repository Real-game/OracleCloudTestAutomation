*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Performance Document Self Evaluation by Employee
...            Prerequisite:  Require a new annual performance document and then assign the performance document.[DC10; TC117 and TC12]
...            Environment Specific Data:  Employee Login(PMP_Talent_common_test_data.csv)
...            Reusable Data:  Comment; FY Year; Rating; Status
...            Dynamic Data: Performace Doc(PMP_Talent_common_test_data.csv)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC01_Employee_Self_Evaluation.json
${csv_path}  ./CSV/td_TC01_Employee_Self_Evaluation.csv
${common_json_path}  ./TestData/PMP_Talent_common_test_data.json
${common_csv_path}  ./CSV/PMP_Talent_common_test_data.csv

*** Test Cases ***
Scenario: Performance Document Self Evaluation by Employee
    [Tags]  PMPTalentTestCase  ModifyData  PMP22D
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[Employee Login]
    Log  Step 4
    click on homepage
    Click Career And Performance
    Log  Step 5
    Click Performance
    Log  Step 6
    Click Current Financial Year Annual Review Manager  ${common_data}[Performace Doc]
    Log  Step 7
    Click Performance Goals
    Log  Step 8
    Click On The Goal  ${data}[Goal Name]
    Log  Step 9
    Click Edit Button
    Log  Step 10
    Change Status  ${data}[Status]
    Log  Step 11
    Save Changes
    Log  Step 12
    Click Back Arrow To Comeback To Performance Goals Page
    Log  Step 13
    Click On Click Here Button
    Wait And Verify Page Contains Text  Evaluate Topic Performance Goals  20s  Evaluate Topic Performance Goals page not found
    Log  Step 14
    Under Each Goal Give Test Comments  ${data}[Comment]
    Log  Step 15
    Click Save And Close
    Log  Step 16
    Click Back Arrow To Comeback To Employee Self Evaluation Page
    Log  Step 17
    Click Competencies
    Log  Step 18
    Click On Click Here Button
    Wait And Verify Page Contains Text  Evaluate Topic Competencies  20s  Evaluate Topic Competencies page not found
    Log  Step 19
    For Each Competency Select Rating and Give Comments  ${data}[Rating]  ${data}[Comment]
    Log  Step 20
    Click Save And Close
    Wait And Verify Page Contains Text  Competencies  20s  Competencies page not found
    Log  Step 21
    Click Back Arrow To Comeback To Employee Self Evaluation Page
    Log  Step 22
    Sleep  5s
    Click Submit
    Sleep  5s
    page should not contain  Error