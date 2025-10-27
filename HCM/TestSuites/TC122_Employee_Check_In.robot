*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Employee Check-In
...            Prerequisite: PMP_TC118 and  Annual Performance Document should be Active status
...            Environment Specific Data:  Employee Login User
...            Reusable Data: Review Period, Review Section,Met With Manager,Employee Check in Comments
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv

*** Test Cases ***
Scenario: Employee Check-In
    [Tags]  PMPTalentTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Employee Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Career and performance from Navigator
    Click Performance
    Log  Step 6
    Select Employee Performance Review Period  ${data}[Review Period]
    Select Employee's Performance Document  ${data}[Review Section]
    Log  Step 7
    Select Click Here
    Log  Step 8
    Select met with your manager dropdown  ${data}[Met With Manager]
    Log  Step 9
    Enter Comments for performance document by Employee  ${data}[Employee Check in Comments]
    Log  Step 10
    Expand Performance Documents Manager Comments section
    Check Manager Comments in performance document  ${data}[Test Comment]
    Log  Step 11
    Click Save And Close
    Log  Step 12
    Click on Submit Button