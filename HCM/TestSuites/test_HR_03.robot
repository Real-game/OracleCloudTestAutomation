*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ManagePositions.robot
Resource  ../PageObjects/UpdatePosition.robot
Resource  ../PageObjects/UpdatePositionReview.robot
Resource  ../PageObjects/SetupCompensationManagement.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_03.json
${csv_path}  ./CSV/td_HR_03.csv
*** Test Cases ***

Scenario: HR Admin updats a Position
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    Click Settings And Action Menu
    Select Setup And Maintenance
    Click Workforce Structures Then Show All Tasks
    Click Manage Positions
    Log  Step 5
    Search Position By Name And Code  ${data}[Name]  ${data}[Code]
    Log  Step 6
    Select Position By Name  ${data}[Name]
    Click On Edit Then Update Position
    Log  Step 7
    Check Effective Date
    Log  Step 8-9
    Select Action Reason And Click OK  ${data}[Action Reason]
    Log  Step 10
    Update Details  ${data}[Type]  ${data}[Head Count]  ${data}[FTE]  ${data}[Warning Button (Y/N)]
    Log  Step 11
    Click Review Button
    Log  Step 12
    Review Details And Click Submit Button  ${data}[Type]  ${data}[Head Count]
    Log  Step 13
    Confirm Message
    Logout