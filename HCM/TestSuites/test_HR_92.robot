*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Termination.robot
Resource  ../PageObjects/TerminateWorkRelationship.robot

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_92.json
${csv_path}  ./CSV/td_HR_92.csv
*** Test Cases ***

Scenario: Quick Actions - Voluntary Termination with direct reports - (Current Date)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Termination Under Employment Section
    Log  Step 8
    Advance Search For Person  ${data}[Person Number]  ${data}[Person Name]
    Log  Step 9 - 13
    Fill Details On When and Why Page  ${data}[Notification Date]  ${data}[Effect Date]  ${data}[Way To Terminate]  ${data}[Why Changing Direct Reports]  ${data}[Termination Reason]
    Log  Step 14
    Click Continue Button
    Log  Step 15
    Click Continue Button
    Log  Step 16
    Check Select All
    Log  Step 17
    Search And Select Proposed Manager  ${data}[Proposed Manager]
    Log  Step 18
    Click Continue Button
    Log  Step 19
    Click Submit Button