*** Variables ***


${create_record_iframe}   xpath: //iframe[contains(@src,'/studio/')]
${create_contract_btn}   xpath: //span[text()='Create']//preceding::oj-button[@id='new-btn-bp']
#${create_contract_btn}   xpath: (//span[text()='Create']//ancestor::button[1])[2]
${cre_file_field}   xpath: //input[@aria-label='MX CRE File #']
${contract_name_field}   xpath: //input[@aria-label='Contract Name']
${contract_type_select_btn}   xpath: //span[contains(@id,'contract_type')][text()='Select']
${contract_type_oper}   xpath: //li/div[text()='OPER./MAINT. AGRMTS']
${rent_structure_select_btn}   xpath: //span[contains(@id,'mx_rent_structure')][text()='Select']
${mx_rent_structure_ar}   xpath: //li/div[text()='A/R']
${content_status_select_btn}   xpath: //label[text()='Status']//following::a[1]
${original_contract_start_date}   xpath: //label[text()='Original Contract Start Date']//following::input[1]
${current_term_start_date}   xpath: //label[text()='Current Term Start Date']//following::input[1]
${current_term_expiry_date}   xpath: //label[text()='Current Term Expiry Date']//following::input[1]

${head_lease_sublease_btn}   xpath: //label[text()='Head Lease (A/P) or SubLease/3rd Party Lease (A/R)']//following::a[1]
${mx_owned_leased_btn}   xpath: //label[text()='MX Owned or Leased']//following::a[1]
${tenant_entity_type_btn}   xpath: //label[text()='Tenant Entity type']//following::a[1]
${landlord_entity_type_btn}   xpath: //label[text()='Landlord Entity Type']//following::a[1]
${submit_Button}   xpath: //*[text()='Submit']

${notification_alert}   xpath: //div[contains(@class,'alert_dialogbody')]//span
${alert_ok_btn}   xpath: //div[contains(@class,'alert')]//button[contains(@aria-labelledby,'okButtonSave')]

${contract_details_tab}   xpath: //span[text()='Contract Details']

${payment_setup_tab}   xpath: //span[text()='Payment Setup']
${edit_link}   xpath: //*[text()='Edit']
${add_btn}   xpath: //button//span[text()='Add']
${contract_area_type_btn}   xpath: //label[text()='Contract Area Type']//following::a[1]
${unit_of_measure_btn}   xpath: //label[text()='Doc. Unit of Measure']//following::a[1]
${area_size_input_field}   xpath: //label[contains(.,'Doc. Area Size')]//following::input[1][@aria-required='true']
${rent_category_btn}   xpath: //label[text()='Rent Category']//following::a[1]
${payment_type_btn}   xpath: //*[text()='Payment General Setup']//following::label[text()='Payment Type']//following::a[1]
${rollup_area_btn}   xpath: //label[contains(.,'Rollup Area')]//following::a[1]
${payment_amt_before_HST_field}   xpath: //label[text()='Payment Amount before HST']//following::input[1]
${payment_frequency_btn}   xpath: //*[text()='Payment General Setup']//following::label[text()='Payment Frequency']//following::a[1]
${overhold_payment_btn}   xpath: //label[contains(.,'Overhold Payment')]//following::a[1]
${start_date}   xpath: //label[text()='Start Date']//following::input[1]
${end_date}   xpath: //label[text()='End Date']//following::input[1]

${process_rent_select_btn}   xpath: //label[contains(.,'Process Rent')]//following::a[1]

${escalation_method_btn}   xpath: //*[text()='Payment Escalation Setup']//following::label[text()='Escalation Method']//following::a[1]
${next_payment_due_day_btn}   xpath: //label[text()='Next Payment Due Day']//following::a[1]
${lastest_payment_due_day_btn}   xpath: //label[text()='Latest Payment Due Day']//following::a[1]
${payment_notice_lead_time_btn}   xpath: //label[text()='Payment Notice Lead Time']//following::a[1]
${capex_opex_btn}   xpath: //label[text()='CAPEX/OPEX']//following::a[1]

${advanced_search_btn}   xpath: //label[text()='Tax Classification']//following::button[1]
${advanced_search_select_btn}   xpath: //button//span[contains(@id,'picker')][text()='Select']
${advanced_search_cancel_btn}   xpath: //button//span[contains(@id,'picker')][text()='Cancel']
${line_item_save_btn}   xpath: //unifier-record-lineitem//span[text()='Save']

${allownaces_tab}   xpath: //span[text()='Allowances']
${allownaces_type_btn}   xpath: //label[text()='Allowance Type']//following::a[1]
${allownaces_amount_field}   xpath: //label[text()='Allowance Amount']//following::input[1]
${allowance_line_item_save_btn}   xpath: //*[text()='Allowance Details']//following::span[text()='Save'][1]

${accept_btn}   xpath: //*[text()='Accept']
${send_btn}   xpath: //*[text()='Send']
${payment_details_tab}   xpath: //span[text()='Payment Details']
${total_amount}   xpath: //div[@aria-label='Amount']
${workflow_actions_btn}   xpath: //label[text()='Workflow Actions']//following::a[1]
${workflow_actions_send_btn}   xpath: //button//span[text()='Send']

${options_critical_dates_tab}   xpath: //span[text()='Options/Critical Dates']
${short_description_field}   xpath: //label[text()='LI Short Description']//following::input[1]
${contract_option_type_btn}   xpath: //label[text()='Contract Option Type']//following::a[1]
${notice_date_no_earlier_than_field}   xpath: //label[text()='Notice Date (No Earlier Than)']//following::input[1]
${notice_date_no_later_than_field}   xpath: //label[text()='Notice Date (No Later Than/or Single Notice)']//following::input[1]
${effective_renewal_extension_date}   xpath: //label[text()='Effective Renewal/Extension Date']//following::input[1]
${options_critical_dates_line_item_save_btn}   xpath: //oj-button[contains(@class,'save')]//span[text()='Save']
#//span[contains(.,'Assigned Task')]//following::span[text()='Save']

${comments_tab}   xpath: //a//span[text()='Comments']
${comments_field}   xpath: //textarea[@aria-label='Comment']
${comments_post_button}   xpath: //button//span[text()='Post']
${gear_icon}  xpath: //div[@class='row-menu-button']
${first_row_click}  xpath: //table//tbody/tr[1]/td[@data-index='li_num']
${copy_option}  xpath: //li/a[text()='Copy']

${gl_combo_list}  xpath: //td[contains(@data-index,'code_combo')]

${error_icon}       xpath: (//span[contains(@class,'danger')])[1]
${error_message_text}   xpath: //span[contains(@title,'Date Validation')]

${payment_setup_tab}   xpath: //span[contains(text(),'Payment Setup')]/parent::span/parent::a
${add_button_payment_setup_tab}    xpath: (//span[text()='Add'])

${li_short_description_input}     xpath: (//label[text()="LI Short Description"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${cre_process_rent_drop_down}     xpath: (//label[text()="CRE Process Rent (Y/N)?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${mx_contract_rent_structure_drop_down}   xpath: (//label[text()="MX Contract Rent Structure"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${tax_classification_drop_down}     xpath: (//label[text()="Tax Classification"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${capex_opex_drop_down}         xpath: (//label[text()="CAPEX/OPEX"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${rent_category_drop_down}      xpath: (//label[text()="Rent Category"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${payment_type_drop_down}       xpath: (//label[text()="Payment Type"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${payment_amount_before_hst_input}   xpath: (//label[text()="Payment Amount before HST"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${payment_frequency_drop_down}      xpath: (//label[text()="Payment Frequency"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${payment_start_date_input}         xpath: (//label[text()="Start Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${payment_end_date_input}           xpath: (//label[text()="End Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${payment_proration_method_drop_down}   xpath: (//label[text()="Payment Proration Method"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]

${escalation_method_drop_down}      xpath: (//label[text()="Escalation Method"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${next_payment_due_day_drop_down}   xpath: (//label[text()="Next Payment Due Day"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${latest_payment_due_day_drop_down}  xpath: (//label[text()="Latest Payment Due Day"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${payment_notice_lead_time_drop_down}    xpath: (//label[text()="Payment Notice Lead Time"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]

${save_payment_setup_button}    xpath: //oj-button[contains(@class,'save')]//span[text()='Save']
#(//span[text()='Save'])[4]

${tax_classification_start_icon}    xpath: (//span[text()[contains(.,'Tax Classification Code')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[1]
${lookup_first_row}                 xpath: (//tr[@data-group-id='columnGroup_0'])[1]
${lookup_select_button}             xpath: //button[contains(@aria-labelledby,'picker-selectButton')]
#//span[contains(@id,'picker-selectButton')]

${customer_id_start_icon}    xpath: (//span[text()[contains(.,'Customer ID')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[1]
${customer_start_id_start_icon}    xpath: (//span[text()[contains(.,'Site ID')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[3]
${business_line_start_icon}     xpath: (//span[text()[contains(.,'Type a Code')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[1]
${cost_centre_start_icon}     xpath: (//span[text()[contains(.,'Type a Code')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[3]
${GL_code_start_icon}         xpath: (//span[text()[contains(.,'GL Code')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[1]

${option_details_tab}   xpath: //span[contains(text(),'Options/Critical Dates')]/parent::span/parent::a
${li_short_description_option_details_input}     xpath: (//label[text()="LI Short Description"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[2]

${contract_option_type_drop_down}    xpath: (//label[text()='Contract Option Type']//following::a)[1]
${option_status_drop_down}           xpath: (//label[text()='Option Status']//following::a)[1]
${notice_date_no_earlier_than_input}       xpath: (//label[text()='Notice Date (No Earlier Than)']//following::input)[1]
${notice_date_future_date_input}        xpath: (//label[text()='Notice Date (No Later Than/or Single Notice)']//following::input)[1]
${lead_planning_months_input}        xpath: (//label[text()='Lead Planning Months']//following::input)[1]

${vendor_id_startup_icon}           xpath: (//span[text()[contains(.,'Vendor ID')]]/parent::div//ancestor::div[@role='presentation']/parent::oj-select-one/parent::div/following-sibling::div//span[@slot='startIcon'])[1]
${vendor_site_id_startup_icon}     xpath: (//label[text()='Vendor Site ID']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//span[@slot='startIcon'])[1]

${payable_record_number}           xpath: //tr//div[text()[contains(.,'CONP')]]
${contract_number}                 xpath: //label[text()='Record Number']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//div[@role='textbox']

${ebs_number_field}     xpath: //input[@aria-label='EBS No.']

${expand_copy_block_icon}     xpath: //span[text()='Copy']/parent::h3/preceding-sibling::a
${copy_record_drop_down}      xpath: //label[text()='Copy Record']//ancestor::div[@slot='label']/parent::div/following-sibling::div//a
${yes_option_copy_drop_down}    xpath: (//div[text()='Yes'])[1]
${property_shell_startup_icon}   xpath: (//span[text()='Type a Property Name...']/parent::div/parent::div/parent::div//following-sibling::div/ancestor::oj-select-one/parent::div/parent::div//span[@slot='startIcon'])[1]

${property_name_search_input}    xpath: //input[@aria-label='Property Name']
${search_close_icon}             xpath: (//span[contains(@class,'ico-close')])[1]

${copied_owned_property_number_input}   xpath: //div[@aria-label='Copied To Property Contract']
${refresh_property_contract_icon}   xpath: //oj-button[@title='Refresh']
${search_owned_property_icon}     xpath: (//span[contains(@class,'search')])[1]
${search_owned_property_apply}    xpath: (//span[text()='Apply'])[2]
${select_button}                 xpath: (//span[text()='Select'])[1]

${record_created_notification_message}   xpath: //span[text()[contains(.,'has been created successfully.')]]
${ok_button_confirmation_window}     xpath: //span[text()='OK']
${receivable_record_number}           xpath: //tr//div[text()[contains(.,'CONR')]]
${payment_amount_line_item}           xpath: //td[contains(@id,'pay_amount')]/div/div

${lease_action_record_number}         xpath: //td//div[contains(text(),'LACT')]

${CRE_tab}	xpath: //a[contains(@title,'CRE Master Log')]
${Property_tab}  xpath:	//a[contains(@title,'Property Contracts')]

${Search_PC}   xpath: //oj-button[@title='Search'][@id='search']
${record_title}  xpath: //span[text()="Record"]
${record_num}   xpath: //input[@aria-label='Record No.']

${apply_button}     xpath: (//oj-button[contains(@class,'apply-btn')])[1]

${record_id}    xpath:  //a[contains(@title,'Click to open the record')]
${record_edit_info}   xpath: //h3//span[text()='General Information']

${payment_setup}   xpath: //*[@id="tab0-tab"]

${cost_center_clear_data}  xpath: //label[text()='Cost Center']//following::button[2]
${cost_center_lookup}  xpath: //label[text()='Cost Center']//following::button[1]
${search_filter_lookup}  xpath : //*[@id='pickerLogFind']//span[contains(@class,'search-list')]
${cost_center_code_search_field}  xpath: //th[@data-index='gen_code_name']/input

${GL_Code_combo_lookup}  xpath: //label[text()='GL Code Combo']//following::button[1]
${clear_GL_data}  xpath:  //label[text()='GL Code Combo']//following::button[2]
${GL_code_combo_search_field}  xpath: //th[contains(@data-index,'code_combo')]/input

${property_contract_frame}  xpath: //iframe[contains(@src,"/master_log")]

${home_icon}    xpath: //a[@aria-label='Home']
${save_draft}  xpath: //span[text()='Save Draft']
${alert_ok}  xpath: //span[text()='OK']
${draft_message}  xpath: //span[contains(text(),'Draft has been saved')]