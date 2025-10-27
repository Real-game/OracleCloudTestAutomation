*** Variables ***
${submit_a_flow}  link:Submit a Flow
${payroll_relationship_first}  xpath: (//a[text()='Payroll Relationships'])[1]
${search_text_box}  xpath: //input[@placeholder='Search for a Person']
${start_date}  xpath: //label[text()='Start Date']/parent::td/following-sibling::td/span
${effective_start_date}  xpath: //label[text()='Effective Start Date']/parent::td/following-sibling::td/span
${effective_end_date}  xpath: //label[text()='Effective End Date']/parent::td/following-sibling::td/span
${effective_as_of_date_field}  xpath: //label[text()='Effective As-of Date']/parent::td/following-sibling::td/input
${payroll_start_date}  xpath: (//table[@summary='Payroll Details']//td//span[contains(@id,'Date')])[2]

${payroll_realtionship_worker_assignment}  xpath: //span[text()='Payroll Relationship: Worker']/ancestor::tr/following-sibling::tr//a
${payroll_details_no_data}  xpath: //table[@summary='Payroll Details']/following-sibling::div/div[text()='No data to display.']
#//table[@summary='Payroll Details']/parent::div[text()='No data to display.']
${payroll_details_create_button}  xpath: //a[@title='Create']
${payroll_duration_field}  xpath: //table[@summary='Payroll Details']//input
${save_button}  xpath: //button[text()='Save']
${back_button}  xpath: (//td[@valign='top']//a)[1]

${payroll_realtionship_worker_assignment_old}  xpath: (//span[text()='Payroll Relationship: Worker']/ancestor::tr/following-sibling::tr//a)[2]
${payroll_realtionship_worker_assignment_latest}  xpath: (//span[text()='Payroll Relationship: Worker']/ancestor::tr/following-sibling::tr//a)[1]

${relationship_type_value}  xpath: //label[contains(text(),'Relationship Type')]//parent::td//following-sibling::td//span
${search_person_left_side}  xpath: //div[text()='Search Person']
${Keywords_input}  xpath: //label[text()='Keywords']//parent::td//following-sibling::td//input
${Search_input}  xpath: //input[contains(@id,'hp01Srh::content')]
${Search_keyword}  xpath: //button[@title='Search']
${Search_1st_row}   xpath: //table/tr[2]
${action_button}  xpath: //img[@title='Actions']
${quick_pay}  xpath: //td[text()='QuickPay']
${simplified_quick_pay}  xpath: //td[text()='Simplified QuickPay']
${submit_quick_pay}  xpath: //button[text()='Submit']
${statement_of_earning}  xpath: //h2[text()='Statement of Earnings']
${standard_entry}  xpath: //h1[text()='Standard Entries']
${calculation_cards}  xpath: //td[text()='Calculation Cards']
${element_entries}  xpath: //td[text()='Element Entries']
${submit_button}  xpath: //button[text()="Submit"]
${voluntary_deduction_checkbox}  xpath: (//div[text()='Voluntary Deductions']/preceding::label[3]//preceding-sibling::input)[1]
${voluntary_deduction_label}  xpath: (//div[contains(text(),'Voluntary Deductions')])[1]
${pretax_checkbox}  xpath: (//div[contains(text(),'Tax')]/preceding::label[3]//preceding-sibling::input)[1]
${tax_label}  xpath: (//div[contains(text(),'Tax')])[1]
${absences_checkbox}  xpath: (//div[contains(text(),'Absences')]/preceding::label[3]//preceding-sibling::input)[1]
${absence_label}  xpath: (//div[contains(text(),'Absences')])[1]
${information_checkbox}  xpath: (//div[contains(text(),'Information')]/preceding::label[3]//preceding-sibling::input)[1]
${information_label}  xpath: (//div[contains(text(),'Information')])[1]

${tax_credit_info_link}  xpath: //a[text()='Tax Credit Information']
${regional_total_claim_amount}  xpath: //h2[text()='Regional']/following::label[text()='Total Claim Amount'][1]//following::span[1]
${federal_total_claim_amount}  xpath: //h2[text()='Federal']/following::label[text()='Total Claim Amount'][1]//following::span[1]
${federal_additional_tax}  xpath: //h2[text()='Federal']/following::label[text()='Additional Tax'][1]//following::span[1]
${add_calculation_card}  xpath: //img[@title='Create']
${create_calc_card_name}  xpath: //a[@title='Search: Name']
${calc_card_eff_date}  xpath: //label[text()='Effective As-of Date']//parent::td//following-sibling::td//input[contains(@id,'id1Dt::content')]
${calc_card_continue}  xpath: //button[text()='Contin']
${involuntary_deduction_link}  xpath: //a[text()='Involuntary deductions']
${add_calculation_component}  xpath: //h3[text()='Calculation Components']//following::img[@title='Create']
${calculation_component_dropdown}  xpath: //label[text()='Calculation Component']//following::a[contains(@id,'componentNameId::drop')]
${calculation_component_dropdown_value}  xpath: //ul[@aria-label='Calculation Component']//following::li
${reference_code}  xpath: //span[@title='Required']//following-sibling::label[text()='Reference Code']//parent::td//following-sibling::td//input
${ok_button}  xpath: //button[@accesskey='K']
${order_amount_payee_dropdown}  xpath: //label[text()='Order Amount Payee']//parent::td//following-sibling::td//a[@title='Search: Order Amount Payee']
${order_amount_payee_dropdown_value}  xpath: (//div[contains(@id,'orderAmtPayee_Display::dropdownPopup::dropDownContent::db')]//child::td)[1]
${received_date}  xpath: //label[text()='Received Date']//parent::td//following-sibling::td//input
${enter_calc_value_on_calc_cards}  xpath: (//a[text()='Enterable Calculation Values on Calculation Cards'])[1]
${add_calc_value}  xpath: (//a[text()='Enterable Calculation Values on Calculation Cards'])[1]//following::img[@title='Create']
${display_value_dropdown}  xpath: //label[text()='Display Value']//parent::td//following-sibling::td//a
${amount_value_on_calc_value}  xpath: //label[text()='Amount']//parent::td//following-sibling::td//input
${edit_calc_value_ok}  xpath: //div[text()='Edit Calculation Values']//following::button[@accesskey='K']
${save_and_close_calc_component}  xpath: //span[text()='ave and Close']
${involuntary_deduc_main_link}  xpath: (//a[text()='Involuntary Deductions'])[1]
${calc_component_detail}  xpath: (//a[text()='Calculation Component Details'])[1]
${element_entries_scroller}  xpath: //div[contains(@id,'table1::scroller')]
${element_entry}  xpath: //a[text()='Element Entries']
${involuntary_deduction_header}  xpath: //h1[contains(text(),"Involuntary Deductions")]
${element_entries_header}   xpath:  //h1[text()="Element Entries"]
