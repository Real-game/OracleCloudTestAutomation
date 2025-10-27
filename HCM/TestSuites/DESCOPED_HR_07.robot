*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/NewPerson.robot
Resource  ../PageObjects/HireAnEmployeeIdentification.robot
Resource  ../PageObjects/HireAnEmployeePersonInformation.robot
Resource  ../PageObjects/HireAnEmployeeEmployeeInformation.robot
Resource  ../PageObjects/HireAnEmployeeCompensation.robot
Resource  ../PageObjects/PersonManagement.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_07.json
${csv_path}  ./CSV/td_HR_07.csv
*** Test Cases ***

Scenario: Manual Hire
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Go to my client group New Position
    Log  Step 5
    Go to Hire An Employee Page
    Fill Basic Details  ${data}[Hire Date]  ${data}[Hire Action]  ${data}[Hire Reason]  ${data}[Legal Employer]
    Sleep  5s
    Fill Personal Details  ${data}[Last Name]  ${data}[First Name]  ${data}[Title Value]  ${data}[Middle Name]  ${data}[Gender]  ${data}[Date of Birth]
    Add National ID info   ${data}[Nationality]   ${data}[National ID]  ${data}[SIN Number]
    Click on Next button
    Fill Home Address   ${data}[Address Line 1]  ${data}[Address Line 2]   ${data}[Address Line 3]   ${data}[City]  ${data}[Province]  ${data}[Postal Code]
    Fill Phone Details  ${data}[Phone Type]  ${data}[Country]  ${data}[Area Code]  ${data}[Contact Number]
    Fill Email Details  ${data}[Email Type]  ${data}[Email]
    Fill Legislative section   ${data}[Marital status]  ${data}[Education Level]
    Fill Citizenship And Visa Information   ${data}[Citizenship]  ${data}[Citizenship From Date]   ${data}[Citizenship To Date]  ${data}[Citizenship Status]
    Fill Contacts Info  ${data}[Relationship Type]  ${data}[Contacts Last Name]  ${data}[Contacts First Name]  ${data}[Contacts Title]  ${data}[Contacts Middle Name]  ${data}[Contacts Phone Type]  ${data}[Contacts Country]  ${data}[Contacts Area Code]  ${data}[Contacts Phone Number]
    Sleep  5s
    Click on Next button in Person Information page
    Add Assignment Info  ${data}[Person Type]  ${data}[Assignment Status]  ${data}[Position ID]  ${data}[ATU Initiation Fee Exempt]   ${data}[Floater]  ${data}[Salary status]
    Add Payroll Frequency Info  ${data}[Payroll Frequency]
    Click on Next button
    Fill the salary details   ${data}[Salary Basis]  ${data}[Salary Amount]
    Click on Next button in Compensation page
    Verify review page  ${data}[Salary Basis]  ${data}[Salary Amount]
    Submit the manual hire
    click on homepage
    Go to my client group person management
    Search Person Name in Person Management Page  ${data}[Last Name]  ${data}[First Name]
    Sleep  5s
    Log  Step 17
    Logout
