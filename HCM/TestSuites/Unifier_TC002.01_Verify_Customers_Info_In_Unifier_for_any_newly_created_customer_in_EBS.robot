*** Settings ***
Library  DataDriver  ../CSV/td_TC002_01_Verify_Customers_info_Details_Customers_Sites_and_Contact_info_in_Unifier_for_any_newly_created_Customer_in_EBS.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierCustomers.robot
Documentation  Verify Customers info (Details Customers Sites and Contact info) in Unifier for any newly created Customer in EBS
...            Prerequisite: Not applicable
...            Environment Specific Data:  Login User
...            Reusable Data: record number
...            Dynamic Data: Not applicable

*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Verify Customers info in Unifier for any newly created Customer in EBS

*** Variables ***
${csv_path}  ./CSV/td_TC002_01_Verify_Customers_info_Details_Customers_Sites_and_Contact_info_in_Unifier_for_any_newly_created_Customer_in_EBS.csv

*** Test Cases ***
TC002.01-Verify Customers info (Details Customers Sites and Contact info) in Unifier for any newly created Customer in EBS with -${Id} ${Login_User} ${record_number_value} ${status_value} ${customer_number_value} ${customer_id_value} ${customer_name_value} ${profile_class_value} ${site_name_value} ${site_id_value} ${address_1_value} ${city_value} ${province_value} ${postal_code_value} ${country_value} ${site_purpose_value} ${site_payment_value} ${site_currency_value}
    [Tags]  CustomerIntegrationTestCase  ModifyData

*** Keywords ***
Verify Customers info in Unifier for any newly created Customer in EBS
    [Arguments]  ${Login_User}  ${record_number_value}  ${status_value}  ${customer_number_value}  ${customer_id_value}  ${customer_name_value}  ${profile_class_value}  ${site_name_value}  ${site_id_value}  ${address_1_value}  ${city_value}  ${province_value}  ${postal_code_value}  ${country_value}  ${site_purpose_value}  ${site_payment_value}  ${site_currency_value}
    Unifier Login Using  ${login_user}
    Click on home icon in landing Page
    Click on + Icon and Select Company Workspace
    Select a Customer from Company Logs
    Select Customers table frame
    Search for the customer record  ${record_number_value}
    Open the customer record  ${record_number_value}
    Switch to customer record window
    Verify General Information block  ${record_number_value}  ${status_value}
    Verify Customer Details block  ${customer_number_value}  ${customer_id_value}  ${customer_name_value}  ${profile_class_value}
    Click on Site Details tab
    Verify Site details block  ${site_name_value}  ${site_id_value}  ${address_1_value}  ${city_value}  ${province_value}  ${postal_code_value}  ${country_value}
    Verify Business Purpose block  ${site_purpose_value}  ${site_payment_value}  ${site_currency_value}
    Verify Site Status block  ${status_value}

