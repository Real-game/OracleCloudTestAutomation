*** Variables ***
${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${search_input_assignment_number}  xpath://td[@title='Assignment Number']/following::input[1]
${search_button_assignment_number}  xpath:(//td[text()="Assignment Number"]/following::img[@title="Search"])[1]

${selection_continue_button}  xpath://a[@role='button' and @accesskey='u']

${assignment_start_date}  xpath://label[text()="When does the assignment change start?"]/following::input[1]
#${assignment_way}  xpath://label[text()="What's the way to change the assignment?"]/following::input[2]
${assignment_way_dropdown}  xpath:(//a[@class='xdv'])[1]
${continue}  xpath://button[@title="Continue"]

${select_probotaion_period_value}  xpath://label[text()='Probation Period']/following::input[1]
${select_probotaion_period_unit_dropdown}  xpath:(//label[text()="Probation Period"]/following::input)[2]
${select_probotaion_period_unit}  xpath://label[text()='Probation Period']/following::input[2]

${submit_button}  xpath://a[@role='button' and @accesskey='m']

${recent_search_result}  xpath: //table/tr[2]

${Checkbox_payroll_details}  xpath: //span[text()='Payroll Details']

${payroll_details_action_type_section}  xpath://h1[text()="Action Type"]
${payroll_details_payroll_frequency_section}  xpath://h2[text()="Payroll Frequency"]
${payroll_details_other_info_section}  xpath://h2[text()="Other Info"]

${dropdown_payroll}  xpath: (//label[text()="Payroll"]/following::input)[1]

${dropdown_time_card}  xpath: (//label[text()="Time Card Required for Payroll"]/following::input)[1]

${checkbox_maintain_managers}  xpath: //span[text()='Maintain Managers']
${position_textbox}  xpath: //label[text()='Position']/parent::div//following-sibling::div//input[@type='text']
${yes_button_hire_detail}         xpath: //span[text()='Y']
${edit_but}  xpath: //a[@title='Edit']
${maintain_manager_dropdown}  xpath: //td[text()='Maintain Managers']//following::label[text()='Name']//parent::div//following-sibling::div//a