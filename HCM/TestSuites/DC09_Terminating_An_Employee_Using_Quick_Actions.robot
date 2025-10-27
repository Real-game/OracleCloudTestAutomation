*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Termination.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Terminating an Employee - Using Quick Actions
...            Prerequisite:  Data from Staff List BI is used with the retention period greater than 30 days.
...            Environment Specific Data:  Login User, Person Number, Proposed Manager
...            Reusable Data:  Action, Comments, Proposed Manager
...            Dynamic Data:  Person Number


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC09_Terminating_An_Employee_Using_Quick_Actions.json
${csv_path}  ./CSV/td_DC09_Terminating_An_Employee_Using_Quick_Actions.csv

*** Test Cases ***
Scenario: Terminating an Employee - Using Quick Actions
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    MAXIMIZE BROWSER WINDOW
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click on Termination under Employment
    Log  Step 8
    Search Person in Termination page  ${data}[Person Number]
    Log  Step 9
    Select way to terminate employee  ${data}[Action]
    Log  Step 10
    Select Continue button
    Log  Step 11
    Select Continue button
    Log  Step 12
    Click Reassign Existing Reports  ${data}[Proposed Manager]
    Select Continue button
    Log  Step 13
    Add Comments on Terminate page  ${data}[Comments]
    Log  Step 14
    Click Submit Button

