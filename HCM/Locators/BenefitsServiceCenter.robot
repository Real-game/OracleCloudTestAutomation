*** Variables ***

${search_text_box}  xpath: //input[@placeholder='Search for a Person']

#Evaluated Life Events
${evaluated_life_events_new_hire}  xpath: //div[@title = 'Evaluated Life Events']//span[text() = "New Hire"]

#Potential Life Events
${potential_life_events_new_hire}  xpath: //div[@title = 'Potential Life Events']//span[text() = "New Hire"]
${potential_life_events_transfer}  xpath: (//div[@title = 'Potential Life Events']//span[text() = "Transfer"])[1]
${potential_life_events_salary_change}  xpath: (//div[@title = 'Potential Life Events']//span[text() = "Salary Change"])[1]
${potential_life_events_transfer_date}  xpath: (//h2[text() = "Potential Life Events"]/following::span[text()="Transfer"]/following::span[1])[1]

${override_enrollment}  xpath: //td[text()='Override Enrollment']
${coverage_start_date}  xpath: //label[text()='Coverage Start Date']//parent::div//following-sibling::div/input[contains(@id,'OePse:EcsDt')]
${save_and_close}    xpath: //span[text()="ave and Close"]

${potential_life_events_section}  xpath: //h2[text()='Potential Life Events']
${potential_life_events_add_button}  xpath: //h2[text()='Potential Life Events']//following::div[@title='Add'][1]
${potential_life_event_dropdown}  xpath: //input[@value='Select a value']
${potential_life_event_save_close_button}  xpath: //a[@accesskey='S']
${potential_life_events_actions_button}  xpath: //h2[text()='Potential Life Events']//following::span[text()='Actions'][1]
${potential_life_events_termination_Detected}  xpath: //div[@title='Potential Life Events']//span[text()='Termination']/ancestor::tr[1]//span[contains(text(),'Detected')]
${back_button}  xpath: //a[@title='Done']

${evaluated_life_events_salary_change}  xpath: //div[@title='Evaluated Life Events']//span[text()='Salary Change']
${evaluated_life_events_processed_closed}  xpath: //div[@title='Evaluated Life Events']//span[contains(text(),'Processed and closed')]
${evaluated_life_events_termination_processed}  xpath: //div[@title='Evaluated Life Events']//span[text()='Termination']/ancestor::tr[1]//span[contains(text(),'Processed')]
${evaluated_life_events_new_hire_enrollment}  xpath: //div[@title='Evaluated Life Events']//span[text()='New Hire']/ancestor::tr[1]//span[contains(text(),'Enrollment window started')]

${show_filters_button}  xpath: //span[text()='Show Filters']
${assignment_status_Inactive_checkbox}  xpath: //label[text()='Inactive']

${benefit_plan_link}  xpath: (//div[@title='Enrollments']//table[1]//table//a[1])[1]
${coverage_start_end_date}  xpath: //label[text()='Coverage Start and End Dates']/parent::div/following-sibling::div/span
${enrollment_first_plan}  xpath: (//span[text()='Metrolinx Benefit Program']//following::div//a[contains(@id,'bEnPse:PnOpLnk')])[1]
${enroll_button}  xpath: //a/span[text()='Enroll']

${employment_info_section}  xpath: //div[text()='Employment Info']
${employment_history_expand_icon}  xpath: //h2[text()='Employment History']//following::div[@title='Expand']/a
${temp_assigment_employment_history}  xpath: //a[text()='Temporary Assignment']