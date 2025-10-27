*** Variables ***

${contract_payable_frame}   xpath: //iframe[contains(@src,'/studio')]
${reference_property_contract_number}  xpath: (//label[text()='Ref. Property Contract']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${search_icon}      xpath: //oj-button[@title='Search'][@id='search']
${record_number_input}    xpath: //input[@aria-label='Record No.']
${apply_button}           xpath: //oj-dialog[@data-oj-subid='search-dialog'][not(contains(@style,'display:none'))]//span[text()='Apply']
${contract_name_input}    xpath: //div[@aria-label='Contract Name']
${title_input}            xpath: (//div[@aria-label='Title'])[1]
${mx_cre_file_number_input}   xpath: (//div[@aria-label='MX CRE File #'])[1]
${payment_details_tab}      xpath: //span[text()='Payment Details']
${rent_category_input}      xpath: //label[text()='Rent Category']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//span[@class='oj-select-chosen']
${payment_type_input}       xpath: //label[text()='Payment Type']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//span[@class='oj-select-chosen']
${contract_line_item_input}   xpath: (//div[@aria-label='Contract Line Item'])[1]
${capex_opex_input}         xpath: //label[text()='CAPEX/OPEX']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//span[@class='oj-select-chosen']

${first_contrat_payable_record}   xpath: (//a[text()[contains(.,'CONP')]])[1]

${accept_btn}   xpath: //*[text()='Accept']
${send_btn}   xpath: //*[text()='Send']
${workflow_actions_btn}   xpath: //label[text()='Workflow Actions']//following::a[1]
${workflow_actions_send_btn}   xpath: //button//span[text()='Send']

${payment_details_tab}      xpath: //span[text()='Payment Details']
${payment_amount_input}     xpath: //td[contains(@id,'payment_amount')]/div/div

${gl_date_input}            xpath: //input[contains(@id,'GL_Date')]
${organization_drop_down}            xpath: //label[text()='Organization']//following::a[1]
${reference_property_contract_number_input}     xpath: //a[contains(@id,'ref_contract')]

