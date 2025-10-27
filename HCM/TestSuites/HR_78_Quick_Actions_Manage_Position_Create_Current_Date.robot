*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreatePositionBasicDetails.robot
Resource  ../PageObjects/CreatePositionPositionDetails.robot
Resource  ../PageObjects/CreatePositionReview.robot
Resource  ../PageObjects/ManagePositions.robot
Documentation  HR Specialist create Position - Quick Actions
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  HR Login
...            Reusable Data:  Business Unit; Status; Department; Job; Full Time or Part Time; Regular or Temporary; Org Chart is Assistant; Hiring Status; Type; FTE; Head Count; Overlap Allowed
...            Dynamic Data:  Position Name; Position Code; Effective Start Date

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_78_Quick_Actions_Manage_Position_Create_Current_Date.json
${csv_path}  ./CSV/td_HR_78_Quick_Actions_Manage_Position_Create_Current_Date.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***

Scenario: HR Specialist create Position - Quick Actions
    [Tags]  CoreHRTestCase  ModifyData  22D-NoData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Login]
    Log  Step 4-7
    click on homepage
    Go to my client group Manage Positions
    Log  Step 8
    Click on Create
    Log  Step 9 Add Position Basic Details
    Create Position Basic Details  ${data}[Effective Start Date]   ${common_data}[Business Unit]  ${common_data}[Position Name]  ${common_data}[Position Code]
    Log  Step 10
    Click Next
    Log  Step 11 Add Position Details
    Add Position Description   ${data}[Status]  ${data}[Department]  ${data}[Job]  ${data}[Full Time or Part Time]  ${data}[Regular or Temporary]  ${data}[Org Chart is Assistant]
    Log  Step 12
    Add Hiring Information   ${data}[Hiring Status]  ${data}[Type]  ${data}[FTE]  ${data}[Head Count]  ${data}[Overlap Allowed]
    Log  Step 13
    Click Next
    Log  Step 14 Evaluation Criteria Page
    Click Next
    Log  Step 15 Profiles Page
    Click Next
    Log  Step 16-17 Review and submit
    Review Details And Submit  ${data}  ${common_data}
    Log  Step 18
    Select Warning Yes
    Sleep  5s
    Log  Step 19
    Confirm Message
    Sleep  5s
    Wait Until Page Contains  Manage Positions  20s  Manage Positions is not displayed
    Logout