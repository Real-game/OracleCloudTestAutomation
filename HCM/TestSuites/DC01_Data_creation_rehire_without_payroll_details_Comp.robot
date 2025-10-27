*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/CreateWorkRelationship.robot
Documentation  Data Creation for Quick Actions -Rehire Manual Without Payroll Details
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User, Person Number and Person Name
...            Reusable Data:  Relationship Start Date, Legal Employer, Way To Relationship, Why Adding Relationship, Business Unit, Position ID, Currency, Salary Basis, Salary Amount
...            Dynamic Data: Login User, Person Number and Person Name

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC01_Data_creation_rehire_without_payroll_details_Comp.json
${csv_path}  ./CSV/td_DC01_Data_creation_rehire_without_payroll_details_Comp.csv

*** Test Cases ***
Scenario: Data Creation for Quick Actions -Rehire Manual Without Payroll Details
    [Tags]  DataCreationTestCase
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Create Work Relationship Under Employment Section
    Log  Step 8 - 9
    Advance Search For Person With Filters  ${data}[Person Number]  ${data}[Person Name]  ${data}[Relationship Start Date]
    Log  Step 10
    Select Manage Info Checkbox
    Manage Info Continue Button
    Log  Step 11-14
    Fill When And Why Details For Create Work Relationship  ${data}[Relationship Start Date]  ${data}[Legal Employer]  ${data}[Way To Relationship]  ${data}[Why Adding Relationship]
    Log  Step 15 - 16
    Click Continue Button
    wait until page contains  Person Number  20s
    Click Continue Button
    Log  Step 17-19
    Fill Employment Details For Create Work Relationship    ${data}[Business Unit]  ${data}[Position ID]
    Log  Step 20-21
    Click Continue Button
    wait until page contains  NAICS Override Code  20s
    Click Continue Button
    wait until page contains  Payroll Frequency  20s
    Log  Step 22
    Click Continue Button
    Log  Step 23-25
    Select Salary Details For Create Work Relationship  ${data}[Currency]  ${data}[Salary Basis]  ${data}[Salary Amount]
    Log  Step 26
    Click Continue Button
    Sleep  5s
    Log  Step 27
    Click Submit Button
    Sleep  7s
    page should not contain  Error
