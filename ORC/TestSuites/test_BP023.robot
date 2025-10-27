*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Questions.robot
Resource  ../pageObjects/EditQuestion.robot
Documentation  Recruiter access to the question library
...            Prerequisite:  Requisition should be in extended status
...            Environment Specific Data:  Recruiter User
...            Reusable Data: Not Applicable
...            Dynamic Data: Subscriber;Question Library;Question Code;Question Library;Score;Response Description
...            Automation Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP023.json
${csv_path}  ./CSV/td_BP023.csv
*** Test Cases ***
Scenario: Prescreening Questionnaire ( Recruiter access to the question library )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Recruiter Username]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group questions
    Log  Step 7
    Select Subscriber  ${data}[Subscriber]
    Log  Step 8 - 9
    Select Question Library  ${data}[Question Library]
    Log  Step 10
    Search Question Code  ${data}[Question Code]
    Log  Step 11
    Click on Search
    Log  Step 12 - 16
    Sleep  2s
    Select Question and Click on Edit  ${data}[Question Library]
    Log  Step 17
    Edit Score  ${data}[Response Description]  ${data}[Score]
    Log  Step 18 - 19
    Click on Save and Close
    Logout
