*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CareerAndPerformance.robot
Resource  ../PageObjects/Performance.robot
Documentation  Participant submits the feedback requested by Manager
...            Prerequisite:  TC119_Participant Feedback(Manager requests for Participant feedback),Review Section and Employee Name Used in TC119
...            Environment Data:  Participant Login user
...            Reusable Data: Participant Comment
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.json
${csv_path}  ./CSV/td_TC124_Manager_Updates_Goals_In_Mid_Year_Document.csv
*** Test Cases ***

Scenario: Participant submits the feedback requested by Manager
    [Tags]  PMPTalentTestCase130702  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Participant Login User]
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Click on Career and Performance under Me via Navigator
    Log  Step 7
    Click Performance
    Log  Step 8-9
    Click on the performance document of the employee to provide feedback   ${data}[Employee Name]  ${data}[Review Section]
    Log  Step 10
    Click Edit Button On Overall Feedback
    Log  Step 11
    Fill Comments Under Participant Comments Section  ${data}[Participant Comment]
    Log  Step 12
    Save Changes
    Log  Step 13
    Click Submit
    Sleep  10s