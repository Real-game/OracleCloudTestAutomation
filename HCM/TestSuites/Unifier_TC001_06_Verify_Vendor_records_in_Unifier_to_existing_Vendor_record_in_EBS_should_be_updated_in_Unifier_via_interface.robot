*** Settings ***
Library  DataDriver  ../CSV/td_TC001_06_Verify_Vendor_records_in_Unifier_to_existing_Vendor_record_in_EBS_should_be_updated_in_Unifier_via_interface.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierVendors.robot
Documentation  Verify Vendor records in Unifier to existing Vendor record in EBS should be updated in Unifier via interface
...            Prerequisite: Add Site Information to an existing Vendor
...            Environment Specific Data:  Login User
...            Reusable Data:
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify Vendor records in Unifier to existing Vendor record in EBS should be updated in Unifier via interface

*** Variables ***
${json_path}    ./TestData/td_TC001_06_Verify_Vendor_records_in_Unifier_to_existing_Vendor_record_in_EBS_should_be_updated_in_Unifier_via_interface.json
${csv_path}  ./CSV/td_TC001_06_Verify_Vendor_records_in_Unifier_to_existing_Vendor_record_in_EBS_should_be_updated_in_Unifier_via_interface.csv

*** Test Cases ***
TC001_06 Verify Vendor records in Unifier to existing Vendor record in EBS should be updated in Unifier via interface with - ${Id} ${login_user} ${Vendor_ID} ${Site_ID}
    [Tags]  VendorIntegration  ReadOnly

*** Keywords ***
Verify Vendor records in Unifier to existing Vendor record in EBS should be updated in Unifier via interface
    [Arguments]  ${login_user}  ${login_user}  ${Vendor_ID}  ${Site_ID}
    Log  Step 1
    Unifier Login Using  ${login_user}
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
    Verify Added Site ID  ${Site_ID}


