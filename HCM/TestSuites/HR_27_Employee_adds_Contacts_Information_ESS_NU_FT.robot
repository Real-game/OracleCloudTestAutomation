*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PersonalInformation.robot
Documentation  Employee adds Contact Infomration
...            Prerequisite:  No data dependency
...            Environment Specific Data:  Login User
...            Reusable Data:  Title, Relationship, Start Date
...            Dynamic Data:  First Name, Last Name

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_HR_27_Employee_adds_Contacts_Information_ESS_NU_FT.json
${csv_path}  ./CSV/td_HR_27_Employee_adds_Contacts_Information_ESS_NU_FT.csv

*** Test Cases ***
Scenario: Employee adds Contact Infomration
    [Tags]  CoreHRTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1-3
    Login Using  ${data}[Login User]
    Log  Step 4
    click on homepage
    Click On Personal Information
    Log  Step 5
    Click Family And Emergency Contacts
    Log  Step 6
    Click Add And Then Create A New Contact  Create a New Contact
    Log  Step 7
    Enter Last Name  ${data}[Last Name]
    Log  Step 8
    Enter First Name  ${data}[First Name]
    Log  Step 9
    Select Title  ${data}[Title]
    Log  Step 10
    Selet Relationship  ${data}[Relationship]
    Log  Step 11
    Select Relationship Start Date  ${data}[Start Date]
    Log  Step 12
    Submit Contact Information
    Log  Step 13-14
    Sleep  5s
    page should not contain  Error
    Wait Until Page Contains  Family and Emergency Contacts  20s  Family and Emergency page is not displayed
    page should contain  ${data}[First Name]
    page should contain  ${data}[Last Name]
    Logout