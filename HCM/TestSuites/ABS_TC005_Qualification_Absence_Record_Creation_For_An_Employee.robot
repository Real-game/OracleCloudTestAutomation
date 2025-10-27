*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/AbsenceAdministration.robot
Resource  ../PageObjects/AbsenceRecords.robot
Resource  ../PageObjects/ManageAbsencesAndEntitlements.robot
Documentation  Qualification Absence Record Creation For an Employee
...            Prerequisite:  Person number from ORC as a Converted Employee
...            Environment Data:  Login User
...            Reusable Data: Absence Type; Absence Start Date; Absence End date; Absence Reason
...            Dynamic Data: NA


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_ABS_TC005_Qualification_Absence_Record_Creation_For_An_Employee.json
${csv_path}  ./CSV/td_ABS_TC005_Qualification_Absence_Record_Creation_For_An_Employee.csv
${common_json_path}    ./TestData/Absence_common_test_data.json
${common_csv_path}  ./CSV/Absence_common_test_data.csv

*** Test Cases ***

Scenario: Qualification Absence Record Creation For an Employee
    [Tags]   AbsenceHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group absence
    Log  Step 7
    Click on Absence Records link
    Log  Step 8 - 9
    Search for a person in Absence Records page  ${data}[Person Number]
    Log  Step 10 - 11
    Click on Add an Absence Record
    Log  Step 12 - 21
    Add a Absence Record   ${data}[Absence Type]  ${data}[Absence Start Date]  ${data}[Absence End Date]  ${data}[Absence Reason]