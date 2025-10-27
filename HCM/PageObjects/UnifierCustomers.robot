*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierCustomers.robot

*** Keywords ***

Select Customers table frame
    ${check}=  Run Keyword and Return Status  Wait Until Element Is Visible  ${customers_table_frame}  30s  Customers table frame is not displayed
    IF  '${check}'=='False'
         Fail  Customers table frame is not displayed
    END
    Select Frame  ${customers_table_frame}
    Capture Page Screenshot


Select First Customer Record
    Wait Until Element Is Visible  ${first_customer_record}  30s  First customer record is not displayed
    Click Element  ${first_customer_record}
    Sleep  3s
    Capture Page Screenshot

Terminate the Record
    Click Element  ${actions_drop_down}
    Wait Until Element Is Visible  ${terminate_record_link}  30s  Terminate record link is not displayed
    Click Element  ${terminate_record_link}

Verify that customer record cannot be deleted
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Wait Until Element Is Visible  ${alert_message_text}  10s
    Sleep  5s
    Wait and Click Element  ${ok_button_customer_record}
    Sleep  10s

Verify Create Customer button is not displayed
    ${check}=  Run Keyword and return status  Wait Until Page Contains Element  ${create_customer_button}  35s  Create button is not displayed in the page
    IF  '${check}'=='True'
        Fail  Create text is displayed
    END
    Capture Page Screenshot

Open the customer record
    [Arguments]  ${customer_record_number_value}
    ${customer_record_xpath}=  Catenate  SEPARATOR=  //a[text()='${customer_record_number_value}']
    Wait Until Element Is Visible  xpath: ${customer_record_xpath}  35s  Customer record is not displayed
    Click Element  xpath: ${customer_record_xpath}
    Sleep  15s
    Capture Page Screenshot

Switch to customer record window
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Wait Until Page Contains  Customer Information  30s  Customer record window has not loaded
    Capture Page Screenshot

Verify General Information block
    [Arguments]  ${record_number_value}  ${status_value}
    Wait And Verify Text Value  ${record_number_input}  ${record_number_value}
    Wait And Verify Text Value  ${record_status_drop_down}  ${status_value}
    Capture Page Screenshot

Verify Customer Details block
    [Arguments]  ${customer_number_value}  ${customer_id_value}  ${customer_name_value}  ${profile_class_value}
    Wait And Verify Text Value  ${customer_number_input}  ${customer_number_value}
    Wait And Verify Text Value  ${customer_id_input}  ${customer_id_value}
    Wait And Verify Text Value  ${customer_name_input}  ${customer_name_value}
    Wait And Verify Text Value  ${profile_class_input}  ${profile_class_value}
    Capture Page Screenshot

Click on Site Details tab
    Wait And Click Element  ${site_details_tab}
    Sleep  3s
    Capture Page Screenshot

Verify Site details block
    [Arguments]  ${site_name_value}  ${site_id_value}  ${address_1_value}  ${city_value}  ${province_value}  ${postal_code_value}  ${country_value}
    Wait And Verify Text Value  ${site_name_input}  ${site_name_value}
    Wait And Verify Text Value  ${site_id_input}  ${site_id_value}
    #Wait And Verify Text Value  ${address_1_input}  ${address_1_value}
    Wait And Verify Text Value  ${city_input}  ${city_value}
    Scroll Element Into View  ${province_input}
    Wait And Verify Text Value  ${province_input}  ${province_value}
    Wait And Verify Text Value  ${postal_code_input}  ${postal_code_value}
    Wait And Verify Text Value  ${country_input}  ${country_value}
    Capture Page Screenshot

Verify Business Purpose block
    [Arguments]  ${site_purpose_value}  ${site_payment_value}  ${site_currency_value}
    Scroll Element Into View  ${site_purpose_input}
    Wait And Verify Text Value  ${site_purpose_input}  ${site_purpose_value}
    Wait And Verify Text Value  ${payment_term_input}  ${site_payment_value}
    Wait And Verify Text Value  ${site_currency_input}  ${site_currency_value}
    Capture Page Screenshot

Verify Site Status block
    [Arguments]  ${status_value}
    Scroll Element Into View  ${site_status_input}
    Wait And Verify Text Value  ${site_status_input}  ${status_value}
    Capture Page Screenshot

Search for the customer record
    [Arguments]  ${customer_number}
    Wait Until Element Is Visible  ${search_customer_icon}  60s
    Click Required Element  ${search_customer_icon}
    Sleep  5s
    Capture Page Screenshot
    Click Required Element  ${customer_id_search_input}
    Input Text  ${customer_id_search_input}  ${customer_number}
    Sleep  5s
    Click Required Element  ${search_customer_apply}
    Sleep  3s
    Capture Page Screenshot











