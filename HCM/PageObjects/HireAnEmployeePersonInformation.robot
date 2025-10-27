*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/HireAnEmployeePersonInformation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Fill Home Address
    [Arguments]  ${address_line_1_value}  ${address_line_2_value}  ${address_line_3_value}  ${city_value}  ${province_value}   ${postal_code_value}
    Wait Until Page Contains   Home Address  20s  Home address section is not displayed
    Wait And Input Text From Input   ${address_line_1_input}  ${address_line_1_value}
    Wait And Input Text From Input   ${address_line_2_input}  ${address_line_2_value}
    Wait And Input Text From Input   ${address_line_3_input}  ${address_line_3_value}
    Wait And Click Element  ${city_drop_down}
    Wait And Click Element  ${city_search_link}
    Sleep  3s
    Wait And Input Text From Input   ${geography_input}  ${city_value}
    Sleep  2s
    Wait And Click Element  ${search_button}
    Sleep  2s
    ${xpath_value}=  Catenate  SEPARATOR=  //span[text()='  ${city_value}  ']/parent::td/parent::tr
    Click Element  xpath: ${xpath_value}
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Sleep  2s
    Wait And Click Element  ${province_input}
    Wait And Click Element  ${city_search_link}
    Sleep  2s
    Wait And Input Text From Input   ${geography_input}  ${province_value}
    Sleep  2s
    Wait And Click Element  ${search_button}
    Sleep  2s
    ${xpath_value}=  Catenate  SEPARATOR=  //span[text()='  ${province_value}  ']/parent::td/parent::tr
    Click Element  xpath: ${xpath_value}
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Sleep  2s
    Wait And Click Element  ${postal_code_input}
    Wait And Click Element  ${city_search_link}
    Sleep  3s
    Wait And Input Text From Input   ${geography_input}  ${postal_code_value}
    Sleep  2s
    Wait And Click Element  ${search_button}
    Sleep  2s
    ${xpath_value}=  Catenate  SEPARATOR=  //span[text()='  ${postal_code_value}  ']/parent::td/parent::tr
    Click Element  xpath: ${xpath_value}
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Sleep  2s
    Capture Page Screenshot
    Sleep  2s

Fill Phone Details
    [Arguments]   ${phone_type_value}   ${country_code_value}   ${area_code_value}  ${number_value}
    Wait And Click Element  ${phone_details_add_row}
    Wait Until Page Contains  Country Code  20s  Country code option is not displayed even after adding a new row for phone details
    Wait And Click Element  ${phone_type_drop_down}
    Wait And Select Value From Input  ${phone_type_options}  ${phone_type_value}
    Sleep  1s
    Wait And Input Text From Input   ${country_drop_down}  ${country_code_value}
    Sleep  2s
    Wait And Select Containing Value From Input  ${country_options}  ${country_code_value}
    Wait And Input Text From Input   ${area_code_input}  ${area_code_value}
    Wait And Input Text From Input   ${number_input}  ${number_value}
    Capture Page Screenshot
    Sleep  2s

Fill Email Details
    [Arguments]  ${work_email_type}  ${work_email_value}
    Wait And Click Element  ${email_details_add_row}
    Sleep  2s
    Wait And Click Element  ${email_type_drop_down}
    Wait And Select Value From Input  ${email_options}  ${work_email_type}
    Sleep  2s
    Wait And Input Text From Input   ${email_input}  ${work_email_value}
    Sleep  2s
    Capture Page Screenshot

Fill Legislative section
    [Arguments]  ${marital_status_value}   ${highest_education_level_value}
    Wait And Click Element  ${marital_status_drop_down}
    Wait And Select Value From Input  ${marital_status_options}  ${marital_status_value}
    Sleep  1s
    Wait And Click Element  ${highest_education_drop_down}
    Wait And Select Value From Input  ${highest_education_level_options}  ${highest_education_level_value}
    Sleep  1s
    Capture Page Screenshot

Fill Citizenship And Visa Information
    [Arguments]  ${citizenship_value}  ${from_date_value}  ${to_date_value}  ${citizenship_status_value}
    Wait And Click Element  ${expand_citizenship_section}
    Sleep  2s
    #Wait And Input Text From Input  ${citizenship_drop_down}  ${citizenship_value}
    Wait And Click Element  ${citizenship_drop_down}
    Sleep  2s
    ${citizenship_xpath}=  Catenate  SEPARATOR=  //li[contains(@class,'x1n6')][text()='  ${citizenship_value}  ']
    Wait And Click Element  xpath: ${citizenship_xpath}
    Sleep  2s
    Wait And Input Text From Input  ${citizenship_from_date_input}  ${from_date_value}
    Sleep  2s
    Wait And Input Text From Input  ${citizenship_to_date_input}  ${to_date_value}
    Sleep  2s
    Wait And Click Element  ${citizenship_status_drop_down}
    Sleep  1s
    #Wait And Click Element  ${citizenship_status_drop_down}
    #Sleep  2s
    Wait And Select Value From Input  ${citizenship_status_options}  ${citizenship_status_value}

Fill Contacts Info
    [Arguments]  ${contacts_type_value}  ${last_name_value}  ${first_name_value}  ${title_value}  ${middle_name_value}  ${contacts_phone_type_value}  ${phones_country_code_value}  ${contacts_area_code_value}  ${contacts_number_value}
    Wait And Click Element  ${contact_type_drop_down}
    Wait And Select Value From Input  ${contact_type_options}  ${contacts_type_value}
    Sleep  2s
    Wait And Input Text From Input  ${last_name_input_contacts}  ${last_name_value}
    Wait And Input Text From Input  ${first_name_input_contacts}  ${first_name_value}
    Wait And Input Text From Input  ${middle_name_input_contacts}  ${middle_name_value}
    Click Element  ${title_drop_down_contacts}
    Wait And Select Value From Input  ${title_drop_down_contacts}  ${title_value}
    Sleep  2s
    Add Phone Info  ${contacts_phone_type_value}  ${phones_country_code_value}  ${contacts_area_code_value}  ${contacts_number_value}

Add Phone Info
    [Arguments]  ${contacts_phone_type_value}  ${phones_country_code_value}  ${contacts_area_code_value}  ${contacts_number_value}
    Wait And Click Element  ${phones_add_row}
    Wait And Click Element  ${phones_type_drop_down}
    Wait And Select Value From Input  ${phones_phone_type_options}  ${contacts_phone_type_value}
    Sleep  1s
    Wait And Input Text From Input   ${phones_country_drop_down}  ${phones_country_code_value}
    Sleep  2s
    Wait And Select Containing Value From Input  ${phones_country_options}  ${phones_country_code_value}
    Wait And Input Text From Input   ${phones_area_code_input}  ${contacts_area_code_value}
    Wait And Input Text From Input   ${phones_number_input}  ${contacts_number_value}
    Sleep  2s
    Capture Page Screenshot


Click on Next button in Person Information page
    Sleep  4s
    Wait And Click Element  ${next_button_person_information}
    Log  Next button is clicked in Hire an Employee: person information page





