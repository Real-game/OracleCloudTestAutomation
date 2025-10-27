*** Variables ***
${address_line_1_input}         xpath://label[text()='Address Line 1']/parent::td/following-sibling::td//input
${address_line_2_input}         xpath://label[text()='Address Line 2']/parent::td/following-sibling::td//input
${address_line_3_input}         xpath://label[text()='Address Line 3']/parent::td/following-sibling::td//input
${city_drop_down}               xpath://label[text()='City']/parent::td/following-sibling::td//a
${province_input}               xpath://label[text()='Province']/parent::td/following-sibling::td//a
${postal_code_input}            xpath://label[text()='Postal Code']/parent::td/following-sibling::td//a
${city_search_link}             xpath: //a[contains(@id,'popupsearch')]
${geography_input}              xpath: //label[text()='Geography']/parent::td/following-sibling::td//input
${search_button}                xpath: //button[text()='Search']
${ok_button}                    xpath: //td[contains(@id,'Dialog')]/button[text()='OK']
${phone_details_add_row}        xpath: //div[contains(@id,'Perso2:0:pt_r1')]//img[@title='Add Row']
${phone_type_drop_down}         xpath: //a[contains(@id,'soc1')][contains(@id,'Perso2:0:pt_r1')]
${phone_type_options}           xpath: //ul[contains(@id,'soc1')][contains(@id,'Perso2:0:pt_r1')]/li
${country_drop_down}            xpath: //input[contains(@id,'iclov1')][contains(@id,'Perso2:0:pt_r1')]
${country_options}              xpath: //ul//li[contains(@id,'iclov1')][contains(@id,'Perso2:0:pt_r1')]
${area_code_input}              xpath: //input[contains(@id,'it2')][contains(@id,'Perso2:0:pt_r1')]
${number_input}                 xpath: //input[contains(@id,'it3')][contains(@id,'Perso2:0:pt_r1')]
${email_details_add_row}        xpath: //div[contains(@id,'Perso2:0:pt_r2')]//img[@title='Add Row']
${email_type_drop_down}         xpath: //a[contains(@id,'soc1')][contains(@id,'Perso2:0:pt_r2')]
${email_options}                xpath: //ul[contains(@id,'soc1')][contains(@id,'Perso2:0:pt_r2')]//li
${email_input}                  xpath: //input[contains(@id,'it1')][contains(@id,'Perso2:0:pt_r2')]
${marital_status_drop_down}     xpath: //a[contains(@id,'soc2')][contains(@id,'Perso2:0:pt_r3')]
${marital_status_options}       xpath: //ul[contains(@id,'soc2')][contains(@id,'Perso2:0:pt_r3')]//li
${highest_education_level_options}      xpath: //ul[contains(@id,'hoc2')][contains(@id,'Perso2:0:pt_r3')]//li
${highest_education_drop_down}      xpath: //a[contains(@id,'hoc2')][contains(@id,'Perso2:0:pt_r3')]
${expand_citizenship_section}       xpath: //a[@title='Expand Citizenship and Visa Information']
${citizenship_drop_down}            xpath: //input[contains(@id,'soc1')][contains(@id,'Perso2:0:pt_r4')]
${citizenship_drop_down_options}    xpath: //ul[contains(@id,'soc1')][contains(@id,'Perso2:0:pt_r4')]//li
${citizenship_from_date}        xpath: //a[@title='Select Date'][contains(@id,'id1')]
${citizenship_to_date}          xpath: //a[@title='Select Date'][contains(@id,'id2')]
${citizenship_status_drop_down}     xpath: //a[contains(@id,'soc2')][contains(@id,'pt_r4')]
${citizenship_status_options}       xpath: //ul[contains(@id,'soc2')][contains(@id,'pt_r4')]//li
${contact_type_drop_down}           xpath: //label[text()='Contact Type']/parent::td/following-sibling::td//a
${contact_type_options}             xpath: //ul[contains(@id,'Perso2:0:soc1')]//li
${last_name_input_contacts}            xpath://label[text()='Last Name']/parent::td/following-sibling::td//input
${first_name_input_contacts}           xpath://label[text()='First Name']/parent::td/following-sibling::td//input
${middle_name_input_contacts}          xpath://label[text()='Middle Name']/parent::td/following-sibling::td//input
${title_drop_down_contacts}            xpath://label[text()='Title']/parent::td/following-sibling::td//a
${phones_add_row}        xpath: //div[contains(@id,'Perso2:0:pt_r6')]//img[@title='Add Row']
${phones_type_drop_down}         xpath: //a[contains(@id,'soc5')][contains(@id,'Perso2:0:pt_r6')]
${phones_phone_type_options}           xpath: //ul[contains(@id,'soc5')][contains(@id,'Perso2:0:pt_r6')]/li
${phones_country_drop_down}            xpath: //input[contains(@id,'iclov1')][contains(@id,'Perso2:0:pt_r6')]
${phones_country_options}              xpath: //ul//li[contains(@id,'iclov1')][contains(@id,'Perso2:0:pt_r6')]
${phones_area_code_input}              xpath: //input[contains(@id,'it15')][contains(@id,'Perso2:0:pt_r6')]
${phones_number_input}                 xpath: //input[contains(@id,'it16')]
${next_button}              xpath: //a[@accesskey='x']
${citizenship_from_date_year_input}       xpath: //input[contains(@id,'id1::pop')]
${citizenship_from_date_month_dropdown}   xpath: //span[contains(@id,'id1')]/select
${citizenship_to_date_year_input}       xpath: //input[contains(@id,'id2::pop')]
${citizenship_to_date_month_dropdown}   xpath: //span[contains(@id,'id2')]/select
${citizenship_from_date_input}              xpath: //label[text()='From Date']/parent::td/following-sibling::td//a[@title='Select Date']//preceding-sibling::input
${citizenship_to_date_input}          xpath: //label[text()='To Date']/parent::td/following-sibling::td//a[@title='Select Date']//preceding-sibling::input
${next_button_person_information}              xpath: //a[@accesskey='x']



