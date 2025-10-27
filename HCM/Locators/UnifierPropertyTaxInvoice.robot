*** Variables ***

${property_tax_invoice_iframe}     xpath: //li[contains(@aria-label,'Home')]/following::iframe[@class='qaframe'][@title='Home Content']
${create_prop_tax_invoice_btn}     xpath: //*[@id='new-btn-other']//span[text()='Create']//ancestor::button
${business_origin_field}     xpath: //*[@id='createNewDialog_layer']//input[@id='shellselect|input']
${business_origin_field_btn}     xpath: //*[@id='shellselect']//a
${create_btn_dialogue_}     xpath: //*[@id='createNewDialog_layer']//span[text()='Create']

${roll_num_invoice_field}     xpath: //input[@aria-label='Roll Number on Invoice']
${invoice_num_field}     xpath: //input[@aria-label='Invoice Number']
${reciept_date_field}     xpath: //label[text()='Receipt Date']//following::input[1]
${education_levy_field}     xpath: //label[text()='Education Levy']//following::input[1]
${total_annual_property_tax_field}     xpath: //label[text()='Total Annual Property Tax (per statement)']//following::input[1]
${property_tax_amt_per_invoice_field}     xpath: //label[text()='Property Tax Amount per Invoice']//following::input[1]
${ebs_number_field}     xpath: //input[@aria-label='EBS No.']
${subject_pin_field}     xpath: //label[contains(.,'Subject PIN')]/following::textarea[1]
${process_date_field}     xpath: //label[text()='Process Date']//following::input[1]

${assessment_year_btn}     xpath: //label[text()='Assessment Year']//following::a[1]
//li//span[contains(text(),'155 CORNWALL ROAD')]