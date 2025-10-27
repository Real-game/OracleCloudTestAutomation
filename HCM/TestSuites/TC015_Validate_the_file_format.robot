*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Documentation  Validate the File Format
...            Prerequisite:
...            Environment Specific Data:  Login User(Benefits_common_test_data.csv)
...            Reusable Data:  Person Number(Benefits_common_test_data.csv), Report Name(Benefits_common_test_data.csv)
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_TC015_Validate_the_file_format.json
#${csv_path}  ./CSV/td_TC015_Validate_the_file_format.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Validate the file format
    [Tags]  Benefits  ReadOnly
#    generatejson  ${csv_path}  ${json_path}
#    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-4
    Login Using  ${common_data}[HR Specialist Login]
    Log  Step 5 - 6
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 7
    Click Browse Catalog Button
    Log  Step 8 - 11
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Log  Step 12 - 15
    Expand Interface Folder
    Expand Benefits Interface Folder
    Select BEN-INT-01 Folder
    Select And Open Report  ${common_data}[Report Name]
    Log  Step 16 - 18
    Select Aplly Button Frame
    Input Person Number  ${common_data}[Employee Number]
    Click Apply Button
    Click Apply Button
    Select Text Frame
    Verify text format