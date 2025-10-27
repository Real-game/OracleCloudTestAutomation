*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Performance.robot
Documentation  Manager views employee Check-In
...            Prerequisite:  PMP_TC122
...            Environment Data:  Login User, Employee Name
...            Reusable Data: Review Period,Review Section
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv
*** Test Cases ***

Scenario: Manager views employee Check-In
    [Tags]  PMPTalentTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on Performance under My Team via Navigator
    Log  Step 6
    Select Performance Review Period  ${data}[Review Period]
    Click on Document status filter as Completed
    Log  Step 7
    Select Employee Self Evaluation Section  ${data}[Employee Name]  ${data}[Review Section]
    Log  Step 8
    Select Click Here
    Log  Step 9
    Expand Performance Documents Employee Comments section
    Log  Step 10
    Check Employee Comments in performance document  ${data}[Met With Manager]  ${data}[Employee Check in Comments]
    Check Manager Comments in performance document  ${data}[Test Comment]

