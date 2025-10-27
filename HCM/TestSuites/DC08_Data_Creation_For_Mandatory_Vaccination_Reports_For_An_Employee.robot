*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/DocumentRecords.robot
Documentation  Data Creation for Mandatory Vaccination Reports for an Employee
...            Prerequisite:  Not Applicable
...            Environment Data:  Login User
...            Reusable Data: Document Type;Vaccination Status;Fully Vaccinated Status;Read COVID attestaion and Data provided;File Name
...            Dynamic Data: Not Applicable

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_DC08_Data_Creation_For_Mandatory_Vaccination_Reports_For_An_Employee.json
${csv_path}  ./CSV/td_DC08_Data_Creation_For_Mandatory_Vaccination_Reports_For_An_Employee.csv
*** Test Cases ***

Scenario: Data Creation for Mandatory Vaccination Reports for an Employee
    [Tags]  BenefitsTestCase  ModifyData  22D-NoData
    generatejson    ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[LoginUser]
    Log  Step 4
    click on homepage
    Click on Personal info
    Log  Step 5
    Click My Documents
    Log  Step 6
    Click on show filter
    Log  Step 7
    Click on Add button in Document record page
    Log  Step 8
    Select Document type from dropdown  ${data}[Document Type]
    Log  Step 9
    Select Vaccination Status form dropdown  ${data}[Vaccination Status]
    Log  Step 10
    Select fully vaccinated by November dropdwon  ${data}[Fully Vaccinated Status]
    Log  Step 11
    Select covid attestation and data provided is correct dropdown  ${data}[Read COVID attestaion and Data provided]
    Log  Step 12
    Upload file in Add Document page  ${data}[File Name]
    Log  Step 13
    Click on Submit button
    Wait Until Page Contains  Document Records  20s  Document Records page is not displayed
    ${xpath}=  Catenate  SEPARATOR=  //span[text()='    ${data}[Document Type]  ']
    Wait Until Page Contains Element  xpath: ${xpath}  20s  Uploaded document is not displayed in Document Records page