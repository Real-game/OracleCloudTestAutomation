*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/PersonManagement.robot
Documentation  Absence HR - Validate absence plans upon termination
...            Prerequisite:  DC09
...            Environment Specific Data:  Login User meeting the prerequisite, Person number, Person Name
...            Reusable Data: Parent Action,Child Action,Accruals Plan,Status,Effective date
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ABS_TC004_Validate_Absence_Plans_Upon_Termination.json
${csv_path}  ./CSV/td_ABS_TC004_Validate_Absence_Plans_Upon_Termination.csv
*** Test Cases ***

Scenario: Validate absence plans upon termination
    [Tags]  AbsenceHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5
    Go to my client group person management
    Log  Step 6 - 8
    Click Include Terminated Work Relationship checkbox
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Log  Step 9
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Log  Step 10
    Select Plan Participation Status  ${data}[Status]
    Log  Step 11 - 12
    Select Run Accruals for All Active Plans  ${data}[Accruals Plan]  ${data}[Effective date]
    Verify Enrollment End date has Value
