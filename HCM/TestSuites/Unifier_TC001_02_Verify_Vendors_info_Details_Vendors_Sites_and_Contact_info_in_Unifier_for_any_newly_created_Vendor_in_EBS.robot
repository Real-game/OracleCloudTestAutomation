*** Settings ***
Library  DataDriver  ../CSV/td_TC001_02_Verify_Vendors_info_Details_Vendors_Sites_and_Contact_info_in_Unifier_for_any_newly_created_Vendor_in_EBS.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierVendors.robot
Documentation  Vendor's info (Details Vendor’s Sites and Contact info) in Unifier for any newly created Vendor in EBS
...            Prerequisite: New Vendor has to be created in EBS
...            Environment Specific Data:  Login User
...            Reusable Data:
...            Dynamic Data: Not applicable


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify the Vendor Info in Unifier for any newly created vendor in EBS

*** Variables ***
${json_path}    ./TestData/td_TC001_02_Verify_Vendors_info_Details_Vendors_Sites_and_Contact_info_in_Unifier_for_any_newly_created_Vendor_in_EBS.json
${csv_path}  ./CSV/td_TC001_02_Verify_Vendors_info_Details_Vendors_Sites_and_Contact_info_in_Unifier_for_any_newly_created_Vendor_in_EBS.csv

*** Test Cases ***
Vendor's info (Details Vendor’s Sites and Contact info) in Unifier for any newly created Vendor in EBS with - ${Id} ${login_user} ${Vendor_ID} ${Site_ID} ${Site_Work_Phone}
    [Tags]  VendorIntegration  ReadOnly

*** Keywords ***
Verify the Vendor Info in Unifier for any newly created vendor in EBS
    [Arguments]  ${login_user}  ${Vendor_ID}  ${Site_ID}  ${Site_Work_Phone}
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
    Verify Site Information and Contact Info  ${Site_ID}  ${Site_Work_Phone}


