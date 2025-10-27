*** Settings ***
Library  DataDriver  ../CSV/td_TC001_08_Merged_vendors_are_interfaced_in_Unifier_and_the_status_is_updated.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierVendors.robot
Documentation  Merged vendors are interfaced in Unifier and the status is updated
...            Prerequisite: Vendors have to be merged 
...            Environment Specific Data:  Login User
...            Reusable Data: Vendor ID Vendor Name Vendor Number Merged Vendor ID
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Merged vendors are interfaced in Unifier and the status is updated

*** Variables ***
${json_path}    ./TestData/td_TC001_08_Merged_vendors_are_interfaced_in_Unifier_and_the_status_is_updated.json
${csv_path}  ./CSV/td_TC001_08_Merged_vendors_are_interfaced_in_Unifier_and_the_status_is_updated.csv

*** Test Cases ***
TC001_08 Merged vendors are interfaced in Unifier and the status is updated with - ${Id} ${Login_User} ${Vendor_ID} ${Vendor_Name} ${Vendor_Number} ${Merged_Vendor_ID}
    [Tags]  VendorIntegration  ReadOnly

*** Keywords ***
Merged vendors are interfaced in Unifier and the status is updated
    [Arguments]  ${Login_User}  ${Vendor_ID}  ${Vendor_Name}  ${Vendor_Number}  ${Merged_Vendor_ID}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Select MX Company in the Home Page
    Log  Step 3
    Select Vendors from Company Logs
    Select Vendors Frame
    Log  Step 4
    Open a specific Vendor  ${Vendor_ID}
    Log  Step 5
    Verify Vendor Status
    Log  Step 6
    Verify Vendor Header Information  ${Vendor_ID}  ${Vendor_Name}  ${Vendor_Number}
    Log  Step 7
    Switch To Vendor Window
    Open a specific Vendor  ${Merged_Vendor_ID}
    Log  Step 8
    Verify Vendor Status - Inactive


