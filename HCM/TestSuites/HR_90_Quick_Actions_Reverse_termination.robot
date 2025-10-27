*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Termination.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Quick Actions - Reverse termination
...            Prerequisite:  DC09_Terminating_An_Employee_Using_Quick_Actions
...            Environment Specific Data:  Login User, Person Number and Person Name
...            Reusable Data:  Action, Parent Action, Child Action
...            Dynamic Data:  Terminated Person Number and Person Name


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_90_Quick_Actions_Reverse_termination.json
${csv_path}  ./CSV/td_HR_90_Quick_Actions_Reverse_termination.csv

*** Test Cases ***
Scenario: Quick Actions - Reverse termination
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
    Log  Step 8 - 11
    Advance Search For Person With Inactive Assignment Filters  ${data}[Person Number]  ${data}[Person Name]
    Log  Step 12
    Select Reverse Termination Option
    Sleep  3s
    Log  Step 13
    Select Action on Reverse Termination Page  ${data}[Action]
    Add Comments on Reverse Termination Page  Test Comment
    Click Submit Button
    Sleep  90s
    Log  Step 14 - 15
    click on homepage
    Go to my client group person management
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Sleep  3s
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Verify Termination date is not visible
