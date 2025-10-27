*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/EmploymentInfo.robot
Resource  ../PageObjects/MyTeamOverview.robot
Resource  ../PageObjects/PersonManagement.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_39.json
${csv_path}  ./CSV/td_HR_39.csv

*** Test Cases ***

Scenario: Manager views direct reports
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Step 1-3 login as HR Specialist
    Login Using  ${data}[HR Specialist Login]
    Log  Step 4
    click on homepage
    Go to my client group person management
    Log  Step 5 - 6
    Search employee number in person management  ${data}[Person Number]
    Log  Step 7
    ${position}  ${job}  ${grade}  ${department}  ${location}  ${manager_name}  ${bargaining_unit}  Get Employment Info
    Log  Step 8
    Logout

    Log  Step 9-11
    Login Using  ${data}[HR Login]
    Log  Step 12
    click on homepage
    Go To My Team
    Click My Team Icon
    Log  Step 13
    Select Employee By Name  ${data}[Employee Name]
    Log  Step 14
    Click Show More
    Log  Step 15
    Verify Employment Info Page  ${job}  ${position}  ${data}[Business Title]  ${department}  ${grade}  ${bargaining_unit}  ${location}  ${data}[Manager Name]
    Log  Step 16
    Click And Verify All Pages Should Be Visible