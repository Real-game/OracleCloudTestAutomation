*** Variables ***

${legislative_data_group_input_box}  xpath://input[@placeholder="Select"]
${ca_legislative_data_group}  xpath://td[text()='CA Legislative Data Group']
${flow_pattern_input_box}  xpath://input[@placeholder="Flow Pattern"]
${flow_pattern_search_icon}  xpath://a[@title="Search"]
${calculate_retroactive_costing}  link:Calculate Retroactive Costing
${payroll_flow_input_box}  xpath://label[text()="Payroll Flow"]/following::input[1]
${process_start_date_input_box}  xpath:(//label[text()="Process Start Date"]/following::input)[1]
${payroll_input_box}  xpath:(//label[text()="Payroll"]/following::input)[1]
${process_end_date_input_box}  xpath:(//label[text()="Process End Date"]/following::input)[1]
${submit_button}  xpath://a[@accesskey="m"]
${refresh_button}  xpath://button[text()="Refresh"]
${calculate_retroactive_costing_status}  xpath://a[@title="Calculate Retroactive Costing"]/following::span[1]

${payroll_period_input_box}  xpath:(//label[text()="Payroll Period"]/following::input)[1]
${run_type_input_box}  xpath:(//label[text()="Run Type"]/following::input)[1]
${legislative_data_group_dropdown}  xpath: //a[@class="xdv"]
${flow_pattern_search}  xpath: //input[@placeholder="Flow Pattern"]
${flow_pattern_search_button}  xpath: //img[@title="Search"]
${effective_date}  xpath:(//label[text()="Effective Date"]/following::input)[1]

${expand_output_and_log_file}  xpath: (//img[@title="Expand"])[1]

${locate_id}  xpath: //span[text()='Calculate Retroactive Costing']/preceding::span[1]
${click_doc_download_link}  xpath://span[text()='Calculate Retroactive Costing']/following::a[text()="ESS_L_2170708"]

${submit_error_popup}  xpath://div[text()='Error']/following::span[1]

${organization_payment_method_dropdown}  xpath:(//label[text()="Organization Payment Method"]/following::input)[1]

${consolidation_group_dropdown}  xpath:(//label[text()="Consolidation Group"]/following::input)[1]

${start_cheque_number_input}  xpath:(//label[text()="Start Cheque Number"]/following::input)[1]

${end_cheque_number_input}  xpath:(//label[text()="End Cheque Number"]/following::input)[1]

${output_log_file_expand_option}  xpath: //h2[text()='Output and Log Files']//parent::div//parent::td//following-sibling::td//img[@title='Expand']

${person_number_input}  xpath: //label[text()='Person']/preceding-sibling::input