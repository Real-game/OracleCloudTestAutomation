*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierCustomersSite.robot

*** Keywords ***

Select Customer Site table frame
    ${check}=  Run Keyword and Return Status  Wait Until Element Is Visible  ${customers_site_table_frame}  70s  Customers site table frame is not displayed
    IF  '${check}'=='False'
         Fail  Customers Site table frame is not displayed
    END
    Select Frame  ${customers_site_table_frame}
    Capture Page Screenshot


Select First Customer Site Record
    Wait Until Element Is Visible  ${first_customer_site_record}  30s  First customer site record is not displayed
    Click Element  ${first_customer_site_record}
    Sleep  3s
    Capture Page Screenshot

Terminate Customer Site Record
    Click Element  ${customer_site_actions_drop_down}
    Wait Until Element Is Visible  ${terminate_customers_site_record_link}  30s  Terminate customer sites record link is not displayed
    Click Element  ${terminate_customers_site_record_link}

Verify that customer site record cannot be deleted
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Wait Until Element Is Visible  ${alert_customers_site_message_text}  10s
    Sleep  5s
    Wait and Click Element  ${ok_button_customer_site_record}
    Sleep  10s

Verify Create Customer sites button is not displayed
    ${check}=  Run Keyword and return status  Wait Until Page Contains Element  ${create_customer_site_button}  35s  Create button is not displayed in the page
    IF  '${check}'=='True'
        Fail  Create text is displayed
    END
    Capture Page Screenshot

Open the customer site record
    [Arguments]  ${customer_site_record_number_value}
    ${customer_site_record_xpath}=  Catenate  SEPARATOR=  //a[text()='${customer_site_record_number_value}']
    Wait Until Element Is Visible  xpath: ${customer_site_record_xpath}  35s  Customer site record is not displayed
    Click Element  xpath: ${customer_site_record_xpath}
    Sleep  15s
    Capture Page Screenshot

Verify Site details block
    [Arguments]  ${site_name_value}  ${site_id_value}  ${address_1_value}  ${city_value}  ${province_value}  ${postal_code_value}  ${country_value}  ${address_2_value}
    Verify the text if deleted  ${site_name_input}  ${site_name_value}
    Verify the text if deleted  ${site_id_input}  ${site_id_value}
    #Verify the text if deleted  ${address_1_input}  ${address_1_value}
    Verify the text if deleted  ${city_input}  ${city_value}
    Verify the text if deleted  ${province_input}  ${province_value}
    Verify the text if deleted  ${postal_code_input}  ${postal_code_value}
    Verify the text if deleted  ${country_input}  ${country_value}
    Verify the text if deleted  ${address_2_input}  ${address_2_value}
    Capture Page Screenshot

Verify Customer Details block
    [Arguments]  ${customer_number_value}  ${customer_id_value}  ${customer_name_value}  ${profile_class_value}
    Verify the text if deleted  ${customer_number_input}  ${customer_number_value}
    Verify the text if deleted  ${customer_id_input}  ${customer_id_value}
    Verify the text if deleted  ${customer_name_input}  ${customer_name_value}
    Verify the text if deleted  ${profile_class_input}  ${profile_class_value}
    Capture Page Screenshot

Switch to customer site record window
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Wait Until Page Contains  Customer+Site Details  30s  Customer site record window has not loaded
    Capture Page Screenshot

Verify Business Purpose block
    [Arguments]  ${site_purpose_value}  ${site_currency_value}
    Scroll Element Into View  ${site_purpose_input}
    Verify the text if deleted  ${site_purpose_input}  ${site_purpose_value}
    Verify the text if deleted  ${site_currency_input}  ${site_currency_value}
    Capture Page Screenshot

Verify Site Status block
    [Arguments]  ${status_value}
    Scroll Element Into View  ${record_status_drop_down}
    Verify the text if deleted  ${record_status_drop_down}  ${status_value}
    Capture Page Screenshot


Verify the text if deleted
    [Arguments]  ${element}  ${text}
    IF  '${text}'=='Deleted'
        ${actual_text}=  Get Element Attribute  ${element}  innerHTML
        Should be Empty  ${actual_text}
    ELSE
        Wait and Verify Text Value  ${element}  ${text}
    END

Search for customer site
    [Arguments]  ${site_id_value}
    Wait Until Element Is Visible  ${search_customer_site_icon}  60s
    Click Required Element  ${search_customer_site_icon}
    Sleep  5s
    Capture Page Screenshot
    Click Required Element  ${site_id_search_input}
    Input Text  ${site_id_search_input}  ${site_id_value}
    Sleep  5s
    Click Required Element  ${search_customer_site_apply}
    Sleep  3s
    Capture Page Screenshot
