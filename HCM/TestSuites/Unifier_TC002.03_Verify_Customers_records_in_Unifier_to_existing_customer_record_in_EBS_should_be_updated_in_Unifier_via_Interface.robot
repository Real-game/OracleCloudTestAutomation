*** Settings ***
Library  DataDriver  ../CSV/td_TC002_03_Verify_customer_records_in_unifier_to_existing_customers_record_in_ebs_should_be_updated_in_unifier.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierCustomersSite.robot


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify Customer records in Unifier to existing Customers record in EBS should be updated in Unifier


*** Variables ***
${csv_path}  ./CSV/td_TC002_03_Verify_customer_records_in_unifier_to_existing_customers_record_in_ebs_should_be_updated_in_unifier.csv

*** Test Cases ***
TC002.03-Verify Customer records in Unifier to existing Customers record in EBS should be updated in Unifier via interface with - ${Id} ${Login_User} ${site_id_value} ${customer_site_record_number_value} ${customer_number_value} ${customer_id_value} ${customer_name_value} ${profile_class_value} ${site_name_value} ${site_id_value} ${address_1_value} ${city_value} ${province_value} ${postal_code_value} ${country_value} ${address_2_value} ${site_purpose_value} ${site_currency_value} ${status_value}
    [Tags]  CustomerSiteIntegrationTestCase  ModifyData

*** Keywords ***
Verify Customer records in Unifier to existing Customers record in EBS should be updated in Unifier
    [Arguments]  ${Login_User}  ${site_id_value}  ${customer_site_record_number_value}  ${customer_number_value}  ${customer_id_value}  ${customer_name_value}  ${profile_class_value}  ${site_name_value}  ${site_id_value}  ${address_1_value}  ${city_value}  ${province_value}  ${postal_code_value}  ${country_value}  ${address_2_value}  ${site_purpose_value}  ${site_currency_value}  ${status_value}
    Unifier Login Using  ${Login_User}
    Click on home icon in landing Page
    Click on + Icon and Select Company Workspace
    Select Customer Site link from Company Logs
    Select Customer Site table frame
    Search for customer site  ${site_id_value}
    Open the customer site record  ${customer_site_record_number_value}
    Switch to customer site record window
    Verify Customer Details block  ${customer_number_value}  ${customer_id_value}  ${customer_name_value}  ${profile_class_value}
    Verify Site details block  ${site_name_value}  ${site_id_value}  ${address_1_value}  ${city_value}  ${province_value}  ${postal_code_value}  ${country_value}  ${address_2_value}
    Verify Business Purpose block  ${site_purpose_value}  ${site_currency_value}
    Verify Site Status block  ${status_value}

