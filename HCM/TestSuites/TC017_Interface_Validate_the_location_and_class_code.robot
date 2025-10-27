*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Validate the location and class code
...            Prerequisite: TC015
...            Environment Specific Data:  Login User(Benefits_common_test_data.csv)
...            Reusable Data:  Person Number(Benefits_common_test_data.csv),Report Name(Benefits_common_test_data.csv), On Data
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_TC017_Interface_Validate_the_location_and_class_code.json
${csv_path}  ./CSV/td_TC017_Interface_Validate_the_location_and_class_code.csv
${common_json_path}  ./TestData/Benefits_common_test_data.json
${common_csv_path}  ./CSV/Benefits_common_test_data.csv

*** Test Cases ***
Scenario: Validate the location and class code
    [Tags]  Benefits  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-4
    Login Using  ${common_data}[HR Specialist Login]
    click on homepage
    Go to my client groups show more
    Click Person under Employment
    Search for Person in Responsive UI  ${common_data}[Employee Number]
    Click Person Information
    ${city}  Get Home Address text under Personal Info
    click on homepage
    Verify Warning message and click Yes
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
    Log  Step 16 - 19
    Select Aplly Button Frame
    Input Person Number  ${common_data}[Employee Number]
    Click Apply Button
    Click Apply Button
    Select Text Frame
    Verify text format
    Verify Location Presence  ${city}  ${data}[On Data]