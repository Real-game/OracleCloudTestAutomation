*** Settings ***
Library  DataDriver  ../CSV/td_TC27_01_Generate_Property_Tax_Invoice_User_Defined_Report.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_User_Defined_Reports.robot
Library  ../Helpers/Excel_Helpers.py
Documentation  Generate Property Tax Invoice (User Defined Report)
...            Prerequisite: NA
...            Environment Specific Data:  Login User, Vendor Name, Vendor ID
...            Reusable Data:  Not applicable
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Generate Property Tax Invoice

*** Variables ***
${json_path}    ./TestData/td_TC27_01_Generate_Property_Tax_Invoice_User_Defined_Report.json
${csv_path}  ./CSV/td_TC27_01_Generate_Property_Tax_Invoice_User_Defined_Report.csv

*** Test Cases ***
Generate Property Tax Invoice (User Defined Report) with - ${Id} ${login_user} ${vendor_name} ${vendor_id}
    [Tags]  PropertyTaxInvoice  ReadOnly

*** Keywords ***
Generate Property Tax Invoice
    [Arguments]  ${login_user}  ${vendor_name}  ${vendor_id}
    Log  Step 1
    Unifier Login Using  ${login_user}
    Log  Step 2
    Click on home icon in landing Page
    Select MX Company in the Home Page
    Log  Step 3
    Select User Defined from Reports
    Select User Defined Reports Frame
    Log  Step 4
    Open Property Tax Invoices
    Log  Step 5
    Select Excel Radio Button
    Input Vendor Name and Vendor ID  ${vendor_name}  ${vendor_id}
    Log  Step 6
    delete_File  report
    Click Run Report
    Validate Presence of File

