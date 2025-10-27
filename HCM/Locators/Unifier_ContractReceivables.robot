*** Variables ***

${payment_due_date}   xpath: //label[text()='Payment Due Date']//following::div[@role='textbox'][1]
${invoiceNumberEBS}     xpath: //label[text()='EBS Invoice #']//following::div[@role='textbox'][1]
${invoiceEBSID}     xpath: //label[text()='EBS Invoice ID']//following::div[@role='textbox'][1]
${creationDateEBS}     xpath: //label[text()='EBS Creation Date']//following::div[@role='textbox'][1]
${search_icon}     xpath: //h1[text()='Contract Receivables']//following::*[@id='search']/button
${ebs_invoice_field}     xpath: //input[@aria-label='EBS Invoice #']
${apply_btn_search}     xpath: //div[text()='Search']/following-sibling::div//button//span[text()='Apply'][1]
${close_btn_search}     xpath: //div[text()='Search']/following-sibling::div//*[@title='Close']//span[contains(@class,'close')][1]

${contract_receivable_frame}   xpath: //iframe[contains(@src,'/studio')]
${contract_receivable_iframe}  xpath: //iframe[contains(@src,'/master_log')]
${reference_property_contract_number}  xpath: (//label[text()='Ref. Contract Record']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${search_icon}      xpath: //oj-button[@title='Search'][@id='search']
${invoice_ref_number_input}    xpath: (//input[@aria-label='Invoice Ref ID'])[1]
${apply_button}           xpath: //oj-dialog[@data-oj-subid='search-dialog'][not(contains(@style,'display:none'))]//span[text()='Apply']
${contract_name_input}    xpath: //div[@aria-label='Contract Name']
${mx_cre_file_number_input}   xpath: (//div[@aria-label='MX CRE File #'])[1]
${payment_details_tab}      xpath: //span[text()='Payment Details']
${first_contract_receivable_record}   xpath: (//a[text()[contains(.,'CONR')]])[1]
${payment_amount_input}     xpath: //td[contains(@id,'payment_amount')]/div/div

${comments_tab}     xpath: //span[contains(@class,'tabbar')]/span[text()='Comments']
${comments_text_area}   xpath: //textarea[@aria-label='Comment']
${post_button}          xpath: //button//span[text()='Post']

${contract_receivable_details_tab}   xpath: //a//span[text()='Contract Receivable Details']
${invoive_num}  xpath: //a[contains(@title,'open the record')]

#${cost_center_clear_data}  xpath: //label[text()='Cost Center']//following::button[2]
#${cost_center_lookup}  xpath: //label[text()='Cost Center']//following::button[1]
#${search_filter_lookup}  xpath : //*[@id='pickerLogFind']//span[contains(@class,'search-list')]
#${cost_center_code_search_field}  xpath: //th[@data-index='gen_code_name']/input
#${lookup_select_button}             xpath: //span[contains(@id,'picker-selectButton')]
${accept_but}  xpath: //span[text()='Accept']
