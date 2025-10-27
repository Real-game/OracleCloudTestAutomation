*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Resource  ../PageObjects/AnalyticsHomePage.robot
Documentation  Mandatory Vaccination Reports (Admin and MSS)
...            Prerequisite:  Data setup test cases DC08
...            Environment Specific Data:  Login User1, Login User2
...            Reusable Data:  Folder Name, Report Name1, Report Name2
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_909_Mandatory_Vaccination_Reports_Admin_and_MSS.json
${csv_path}  ./CSV/td_HR_909_Mandatory_Vaccination_Reports_Admin_and_MSS.csv

*** Test Cases ***
Scenario: Mandatory Vaccination Reports (Admin and MSS)
    [Tags]  CoreHRTestCase  ReadOnly
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 4
    Login Using  ${data}[Login User1]
    Log  Step 5 - 7
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 8
    Click Browse Catalog Button
    Log  Step 9 - 15
    Expand Shared Folders
    Expand Custom
    Expand Metrolinx
    Expand Reports
    Expand HR Reports
    Select Folder  ${data}[Folder Name]
    Log  Step 16
    Select And Open Report  ${data}[Report Name1]
    Log  Step 17
    Select Aplly Button Frame
    Sleep  5s
    Click Apply Button
    Verify Report Completed Message
    Sleep  7s
    unselect frame
    Log  Step 18 - 19
    log  Reference Input For Data Validation${\n} Column Name: Person Number${\n} Value: ${data}[Person Number]${\n} Report Name: ${data}[Downloaded Report Name]${\n}
    log  Data To Be Validated${\n} Validation Column: Vaccination Status${\n} Validation Value: ${data}[Vaccination Status]${\n}
    ${result}=  validate_single_column_data  Person Number  ${data}[Person Number]  Vaccination Status  ${data}[Vaccination Status]  ${data}[Downloaded Report Name]
    IF  "${result}"!="Validation Successful"
        fail  ${result}
    END
    Log  Step 20
    switch window  Reports and Analytics - Oracle Fusion Cloud Applications
    Logout
    Login Using  ${data}[Login User2]
    click on homepage
    Go To My Team
    Select MX Mandatory Vaccination Report
    Sleep  10s
    ${status}=  Run Keyword and Return Status  switch window  MX_Mandatory_Vaccination_Report - Oracle Analytics Publisher
    IF  '${status}'!='True'
        Select MX Mandatory Vaccination Report
        Sleep  20s
        switch window  MX_Mandatory_Vaccination_Report - Oracle Analytics Publisher
    END
    Select Aplly Button Frame
    Sleep  5s
    Click Apply Button
    Select Report Or Data Frame
    Sleep  8s
    Log  Step 22
    page should not contain  ${data}[Person Name]