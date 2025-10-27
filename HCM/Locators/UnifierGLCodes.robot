*** Variables ***

${gl_code_iframe}     xpath: //li[contains(@aria-label,'Metrolinx')]/following::iframe[@class='qaframe'][@title='Content'][1]
${gl_code_create_btn}     xpath: //span[text()='Create']//ancestor::button[1]
${gl_code_combo_first}     xpath: (//h1[text()='GL Codes']/following::table//td[contains(@data-index,'code_combo')])[1]
${accept_btn}   xpath: //a[text()='Accept']
${gl_code_header}   xpath: //label[text()='GL Codes']

${cost_center_search_button}   xpath: //*[@id='find']//span[contains(@class,'search-list')]
${cost_center_code_search_field}   xpath: //th[@data-index='gen_code_name']/input
${gl_codes_tab}  xpath: (//li//span[text()='GL Codes'])[1]
#//td[@data-index='gen_code_name']//mark[text()='0122']

${cost_center_search_icon}   xpath: //h1[text()='Cost Centers']//following::*[@id='search']/button
${cost_center_search_field}   xpath: //input[@aria-label='Code Name']
${location_search_icon}   xpath: //h1[text()='Location']//following::*[@id='search']/button
${account_search_icon}   xpath:  //h1[text()='Account']//following::*[@id='search']/button


${bl_code_value}  xpath: //div[@aria-label='BL Code']
${bl_ID_value}  xpath: //div[@aria-label='BL ID']
${bl_description_value}  xpath: //div[@aria-label='Business Line Desc PK']
#${business_line_value}  xpath: //div[@aria-label='Business Line']

${search_icon}     xpath: //h1[text()='GL Codes']//following::*[@id='search']/button
${gl_code_search_field}     xpath: //input[@aria-label='GL Code Combo']
${apply_btn_search}     xpath: //div[text()='Search']/following-sibling::div//button//span[text()='Apply'][1]
${close_btn_search}   xpath: //div[text()='Search']/following-sibling::div//*[@title='Close']//span[contains(@class,'close')][1]
${vendor_search_icon}     xpath: //h1[text()='Vendors']//following::*[@id='search']/button
${vendor_id_search_condition_link}   xpath: //input[@aria-label='Vendor ID']/preceding::a[1]
${search_condition_equals}   xpath: //li//span[text()='equals']
${vendor_id_search_field}   xpath: //input[@aria-label='Vendor ID']
${site_information_tab}   xpath: //a//span[text()='Site Information']
${work_phone_value}   xpath: //div[@aria-label='Work Phone']

${vendor_name_header}   xpath: //div[@aria-label='Vendor Name']
${vendor_number_header}   xpath: //div[@aria-label='Vendor Number']
${vendor_id_header}   xpath: //div[@aria-label='Vendor ID']
${vendor_status_header}   xpath: //label[text()='Status']//following::span[1]


${gl_codes_action_btn}   xpath: //span[text()='Actions']/ancestor::button
${terminate_record_option}   xpath: //a[contains(text(),'Terminate Record')]
${permission_denied_alert}   xpath: //span[text()='You do not have permission to perform this action.']