*** Variables ***

${customers_table_frame}   xpath: (//iframe[contains(@src,'/studio')])[1]
${first_customer_record}   xpath: (//tr[@data-group-id='columnGroup_0'][contains(@id,'12grid')])[1]
${actions_drop_down}       xpath: //span[text()='Actions']
${terminate_record_link}    xpath: //a[text()='Terminate Record...']
${alert_message_text}       xpath: //span[text()='You do not have permission to perform this action.']
${ok_button_customer_record}     xpath: //span[text()='Alert']//ancestor::oj-dialog//span[text()='OK']

${record_number_input}      xpath: //label[text()='Record Number']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${record_status_drop_down}   xpath: (//label[text()='Status']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//span)[1]

${create_customer_button}    xpath: xpath: //span[text()='Create']/parent::span/parent::span/parent::div/parent::button[@tabindex='-1']/parent::oj-button[contains(@class,'default')]

${customer_number_input}    xpath: //label[text()='Customer Number']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${customer_id_input}        xpath: //label[text()='Customer ID']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${customer_name_input}      xpath: //label[text()='Customer Name']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${profile_class_input}      xpath: (//label[text()='Profile Class']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//span)[1]

${site_details_tab}    xpath: //span[text()='Site Details']

${site_name_input}         xpath: //label[text()='Site Name']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${site_id_input}           xpath: //label[text()='Site ID']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${address_1_input}         xpath: //label[text()='Address 1']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${city_input}              xpath: //label[text()='City']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${province_input}          xpath: //label[text()='Province']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${postal_code_input}       xpath: //label[text()='Postal Code']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${country_input}           xpath: //label[text()='Country']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']

${site_purpose_input}       xpath: //label[text()='Site Purpose']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']
${payment_term_input}       xpath: (//label[text()='Payment Term']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//span)[1]
${site_currency_input}      xpath: //label[text()='Site Currency']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']

${site_status_input}        xpath: (//label[text()='Site Status']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//span)[1]
${record_status_drop_down}   xpath: (//label[text()='Status']//ancestor::oj-label/parent::div/parent::div/following-sibling::div//span)[1]

${search_customer_icon}     xpath: //button//span[contains(@class,'search')][@slot='startIcon']
${search_customer_apply}    xpath: (//span[text()='Apply'])[1]
${customer_id_search_input}          xpath: //label[text()='Customer ID']/parent::div/ancestor::search-string-field//input[@aria-label='Customer ID']