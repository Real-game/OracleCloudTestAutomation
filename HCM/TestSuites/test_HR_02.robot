*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreatePositionBasicDetails.robot
Resource  ../PageObjects/CreatePositionPositionDetails.robot
Resource  ../PageObjects/CreatePositionReview.robot
Resource  ../PageObjects/ManagePositions.robot
Resource  ../PageObjects/SetupCompensationManagement.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_02.json
${csv_path}  ./CSV/td_HR_02.csv
*** Test Cases ***

Scenario: HR Admin Creates a Position
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
    Click on Create
    Log  Step 6 Add Position Basic Details
    Create Position Basic Details  ${data}[Effective Start Date]   ${data}[Business Unit]  ${data}[Name]  ${data}[Code]
    Log  Step 7
    Click Next
    Log  Step 8 Add Position Details
    Add Position Description   ${data}[Status]  ${data}[Department]  ${data}[Job]  ${data}[Full Time or Part Time]  ${data}[Regular or Temporary]  ${data}[Org Chart is Assistant]
    Log  Step 9
    Add Hiring Information   ${data}[Hiring Status]  ${data}[Type]  ${data}[FTE]  ${data}[Head Count]  ${data}[Overlap Allowed]
    Log  Step 10
    Click Next
    Log  Step 11 Evaluation Criteria Page
    Click Next
    Log  Step 12 Profiles Page
    Click Next
    Log  Step 13-14 Review and submit
    Review Details And Submit  ${data}
    Log  Step 15
    Select Warning Yes
    Sleep  5s
    Log  Step 16
    Confirm Message
    Sleep  5s
    Log  Step 17
    Logout