*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/ManagePositions.robot
Resource  ../PageObjects/UpdatePosition.robot
Resource  ../PageObjects/UpdatePositionReview.robot
Documentation  HR Specialist Update Position - Quick Actions
...            Prerequisite:  HR-78
...            Environment Specific Data:  HR Login
...            Reusable Data:  Action Reason; Regular or Temporary; Full Time or Part Time
...            Dynamic Data:  Position Name; Position Code

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_79_Quick_Actions_Manage_Position_Update.json
${csv_path}  ./CSV/td_HR_79_Quick_Actions_Manage_Position_Update.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: HR Specialist Update Position - Quick Actions
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5-7
    Go to my client group Manage Positions
    Log  Step 8
    Search Position By Name And Code  ${common_data}[Position Name]  ${common_data}[Position Code]
    Log  Step 9
    Select Position By Name  ${common_data}[Position Name]
    Click On Edit Then Update Position
    Log  Step 10
    Check Effective Date
    Log  Step 11-12
    Select Action Reason And Click OK  ${data}[Action Reason]
    Log  Step 13
    Update Details Quick Action  ${data}[Regular or Temporary]  ${data}[Full Time or Part Time]
    Log  Step 14-15
    Click Review Button
    Review Quick Action Details And Click Submit Button  ${data}[Regular or Temporary]  ${data}[Full Time or Part Time]
    Log  Step 13
    Confirm Message
    Wait Until Page Contains  Manage Positions  20s  Manage Positions is not displayed
    Logout