*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/WorkForceCompensationPlans.robot
Resource  ../PageObjects/ConfigureWorksheet.robot

Documentation  Workforce Compensation - Configuration - Modify individual performance percentages to be allocated based on performance rating
...            Prerequisite:  Not Applicable
...            Environment Data:  HR Specialist Login(PFP_common_test_data.csv)
...            Reusable Data: Worksheet Task;Task Name;Detail Column Name;User Defined Column Name;Column result value
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_06_Workforce_Compensation_Configuration_Modify_Iindividual_Performance_Percentages_To_Be_Allocated_Based_On_Performance_Rating.json
${csv_path}  ./CSV/td_CMP_TC001_06_Workforce_Compensation_Configuration_Modify_Iindividual_Performance_Percentages_To_Be_Allocated_Based_On_Performance_Rating.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Workforce Compensation - Configuration - Modify Individual Performance Percentages To Be Allocated based On Performance Rating
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Click on My Client Compensation from Navigator
    Log  Step 7
    Click on WorkForce Compensation Plans
    Log  Step 8
    Click on Pay for Performance
    Log  Step 9
#    Click Go To Task From given Worksheet Task List  ${data}[Worksheet Task]
    Click on Worksheet Display
    Log  Step 10
    Select configure task layout for given task display name  ${data}[Task Name]
    Log  Step 11
    Select Detail Table
    Expand Detail Columns options in Configure Worksheet Page Laoyout  ${data}[Detail Column Name]
    Log  Step 12
    Select Dynamic coulmn of user defined column  ${data}[User Defined Column Name]
    Log  Step 13
    Modify Column result value  ${data}[Column result value]
    Log  Step 14
    Click Save And Close
