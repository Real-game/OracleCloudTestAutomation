*** Settings ***
Library  Selenium2Library
Library  DataDriver  ../CSV/td_HR_82_Quick_Actions_Temp_Assignment_Start.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/AddAssignment.robot
Resource  ../PageObjects/EmploymentInfo.robot
Documentation  HR Specialist Temp Assignment Start - Quick Actions
...            Prerequisite:  HR-81
...            Environment Specific Data:  HR Login; Person Name
...            Reusable Data:  Assignment Start Date; Assignment Type; Assignment Way; Assignment Reason; Tax Reporting Unit; Time Card Required; Salary Basics; Salary Amount; Source Assignment Status;Assignment Status
...            Dynamic Data:  Position ID

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test
Test Template  HR Specialist Temp Assignment Start

*** Variables ***
${json_path}    ./TestData/td_HR_82_Quick_Actions_Temp_Assignment_Start.json
${csv_path}  ./CSV/td_HR_82_Quick_Actions_Temp_Assignment_Start.csv
#${common_json_path}    ./TestData/Core_HR_common_test_data.json
#${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
HR Specialist Temp Assignment Start - ${Id} ${HR Login} ${Assignment Start Date} ${Person Number} ${Assignment Type} ${Assignment Way} ${Assignment Reason} ${Position ID} ${Tax Reporting Unit} ${Time Card Required} ${Salary Basics} ${Salary Amount} ${Source Assignment Status} ${Assignment Status}

*** Keywords ***
HR Specialist Temp Assignment Start
#    [Tags]  CoreHRTestCase  ModifyData
    [Arguments]  ${HR Login}  ${Assignment Start Date}  ${Person Number}  ${Assignment Type}  ${Assignment Way}  ${Assignment Reason}  ${Position ID}  ${Tax Reporting Unit}  ${Time Card Required}  ${Salary Basics}  ${Salary Amount}  ${Source Assignment Status}  ${Assignment Status}
#    generatejson  ${csv_path}  ${json_path}
#    ${data}=  readJson  ${json_path}
#    generatejson  ${common_csv_path}  ${common_json_path}
#    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1-3
    Login Using  ${HR Login}
    Log  Step 4
    click on homepage
    Log  Step 5-6
    Go to my client groups show more
    Log  Step 7
    Click Add Assignment Under Employment Section
    Sleep  5s
    Log  Step 8-9
    Search And Select Person  ${Person Number}
    Log  Step 10
    Check Payroll Salary And Compensation Then Click Contiue
    Log  Step 11
    Fill Details In When and Why  ${Assignment Start Date}  ${Assignment Type}  ${Assignment Way}  ${Assignment Reason}  ${Source Assignment Status}
    Log  Step 12
    Continue
    Log  Step 13-14
    Select Position On Assignment Page  ${Assignment Status}  ${Position ID}
    Log  Step 15
    continue
    Log  Step 16-17
    Select Payroll Details  ${Tax Reporting Unit}  ${Time Card Required}
    Log  Step 18
    continue
    Log  Step 19-22
    Select Salary Details  ${Salary Basics}  ${Salary Amount}
    Log  Step 23
    continue
    Log  Step 24
    Submit Details
    page should not contain  Error
    Wait And Verify Page Contains Text  My Client Groups  120s  Failed to submit
    Log  Step 25
    Go to my client groups show more
    Log  Step 26
    Click Employment Info Under Employment Section
    Log  Step 27 - 28
    Search And Select Person  ${Person Number}
    Log  Step 29
    Expand Employment History
    Log  Step 30 - 31
    Verify Employment History has Temporary Assignment
    Sleep  5s
    Logout
