*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/Termination.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Quick Actions - Reverse termination
...            Prerequisite:  DC09_Terminating_An_Employee_Using_Quick_Actions
...            Environment Specific Data:  HR Login; Person Number; Person Name
...            Reusable Data:  Action; Parent Action; Child Action
...            Dynamic Data:  Terminated Person Number; Person Name


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_90_Quick_Actions_Reverse_termination.json
${csv_path}  ./CSV/td_HR_90_Quick_Actions_Reverse_termination.csv
${common_json_path}    ./TestData/Core_HR_common_test_data.json
${common_csv_path}  ./CSV/Core_HR_common_test_data.csv

*** Test Cases ***
Scenario: Quick Actions - Reverse termination
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 - 3
    Login Using  ${common_data}[HR Login]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click on Termination under Employment
    Log  Step 8 - 11
    Advance Search For Person With Inactive Assignment Filters  ${data}[Person Number]  ${data}[Person Name]
    Log  Step 12
    Select Reverse Termination Option
    Sleep  3s
    Log  Step 13
    Select Action on Reverse Termination Page  ${data}[Action]
#    Add Comments on Reverse Termination Page  Test Comment
    Click Submit Button
    Sleep  90s
    Log  Step 14 - 15
    click on homepage
    Go to my client group person management
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    Sleep  3s
    Select action Dropdown  ${data}[Parent Action]  ${data}[Child Action]
    Verify Termination date is not visible
    click on homepage
    Sleep  5s
    Go to my client group person management
    Search Person in person management  ${data}[Person Name]  ${data}[Person Number]
    wait until element is visible  xpath://span[text()='Active - Payroll Eligible']/preceding::a[@href='#'][2]  20s  Assignment status is inactive
    Select action Dropdown  ${data}[Parent Action2]  ${data}[Child Action2]
    ${text}=  get text  xpath: //span[text()="Enrollment End Date"]/following::td[6]/span
    IF  "${text}"!=""
        fail  Enrolment date is reflecting for plans
    END
    log to console  ${text}
    Click Task Icon
    Wait And Click Element  link: Payroll Relationships
    wait until element is visible  xpath: //span[@title="Biweekly"]  30s  Payroll frequency is not Biweekly
    ${text}=  get text  xpath: //span[@title="Biweekly"]/following::td[2]/span/span/span
    IF  "${text}"!=""
        fail  Close date is not empty
    END
    ${text}=  get text  xpath: //span[@title="Biweekly"]/following::td[2]/span/span/span
    IF  "${text}"!=""
        fail  Close date is not empty
    END
    element attribute value should be  xpath://span[@title="Biweekly"]/following::td[3]/span/span  style  display: none;  End date is not empty