*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Compensation.robot
Resource  ../PageObjects/UserDefinedTable.robot

Documentation  Workforce Compensation - Configuration - Modify Engagement Percentages To Be Allocated Based On Division
...            Prerequisite:  Not Applicable
...            Environment Data:  HR Specialist Login(PFP_common_test_data.csv)
...            Reusable Data: Compensation Option;Name;Range Or Match option;Action;User Defined Row Name;User Defined Value
...            Dynamic Data: Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_CMP_TC001_05_Workforce_Compensation_Configuration_Modify_Engagement_Percentages_To_Be_Allocated_Based_On_Division.json
${csv_path}  ./CSV/td_CMP_TC001_05_Workforce_Compensation_Configuration_Modify_Engagement_Percentages_To_Be_Allocated_Based_On_Division.csv
${common_json_path}  ./TestData/PFP_common_test_data.json
${common_csv_path}  ./CSV/PFP_common_test_data.csv

*** Test Cases ***
Scenario: Workforce Compensation - Configuration - Modify Engagement Percentages To Be Allocated Based On Division
    [Tags]  PFPTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Log  Step 5
    Click on My Client Compensation from Navigator
    Log  Step 7
    Click Option in Compensation page  ${data}[Compensation Option]
    Log  Step 8
    Enter Name in search box  ${data}[Name]
    Log  Step 9
    Select Range or Match option  ${data}[Range Or Match option]
    Select Search option
    Log  Step 10
    Click a search result  ${data}[Name]
    Log  Step 11
    Select Edit option
    Select Next option
    Log  Step 12
    Select User defined table row  ${data}[User Defined Row Name]
    Select Pencil icon to edit  ${data}[Action]
    Log  Step 13 -14
    Modify value in User defined table  ${data}[User Defined Row Name]  ${data}[User Defined Value]
    Log  Step 15
    Select Submit in User defined page

