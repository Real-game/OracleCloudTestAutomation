*** Variables ***

${search_text_box}  xpath: //input[@placeholder='Search for a Person']

#Evaluated Life Events
${evaluated_life_events_new_hire}  xpath: //div[@title = 'Evaluated Life Events']//span[text() = "New Hire"]

#Potential Life Events
${potential_life_events_new_hire}  xpath: //div[@title = 'Potential Life Events']//span[text() = "New Hire"]
${potential_life_events_transfer}  xpath: (//div[@title = 'Potential Life Events']//span[text() = "Transfer"])[1]
${potential_life_events_salary_change}  xpath: (//div[@title = 'Potential Life Events']//span[text() = "Salary Change"])[1]
${potential_life_events_transfer_date}  xpath: (//h2[text() = "Potential Life Events"]/following::span[text()="Transfer"]/following::span[1])[1]
${potential_life_events_benefit_admin}  xpath: (//div[@title = 'Potential Life Events']//span[text() = "Benefit Admin"])[1]

${override_enrollment}  xpath: //td[text()='Override Enrollment']
${coverage_start_date}  xpath: //label[text()='Coverage Start Date']//parent::div//following-sibling::div/input[contains(@id,'OePse:EcsDt')]
${save_and_close}    xpath: //span[text()="ave and Close"]

${potential_life_events_section}  xpath: //h2[text()='Potential Life Events']
${potential_life_events_add_button}  xpath: //h2[text()='Potential Life Events']//following::div[@title='Add'][1]
${potential_life_event_dropdown}  xpath: //input[@value='Select a value']
${potential_life_event_save_close_button}  xpath: //a[@accesskey='S']
${potential_life_events_actions_button}  xpath: //h2[text()='Potential Life Events']//following::span[text()='Actions'][1]
${potential_life_events_termination_Detected}  xpath: //div[@title='Potential Life Events']//span[text()='Termination']/ancestor::tr[1]//span[contains(text(),'Detected')]
${back_button}  xpath: //a[@title='Back']

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

${people_to_cover}  xpath: //div[text()='People to Cover']
${people_to_cover_header}  xpath: //h1[text()='People to Cover']
${people_to_cover_Child}  xpath: //span[text()='Child']/ancestor::tr/preceding-sibling::tr//a
${people_to_cover_Spouse}  xpath: //span[text()='Spouse']/ancestor::tr/preceding-sibling::tr//a

${dental_family_benefit_plan}  xpath: //a[contains(text(),'Dental Family')]
${dental_family_benefit_plan_header}  xpath: //h1[contains(text(),'Dental Family')]
${dependents_expand_option}  xpath: //h2[text()='Dependents']/following::img[1][@title='Expand']

${effective_as_of_date_field}  xpath: //label[text()='Effective As-of Date']/preceding-sibling::input
${edit_first_enroll}  xpath: (//div[@title='Edit'])[1]
${checkbox_second_enroll}  xpath: (//input[@type='checkbox'])[2]/following-sibling::label
${single_ftu_checkbox_first_enroll}  xpath: (//span[contains(text(),'Single ')])[1]/preceding::input[1]/following-sibling::label
${family_ftu_checkbox_first_enroll}  xpath: (//span[contains(text(),'Family')])[1]/preceding::input[1]
${family_ftu_checkbox_select_first_enroll}  xpath: (//span[contains(text(),'Family')])[1]/preceding::input[1]/following-sibling::label
${continue_button_enroll}  xpath: //a/span[text()='Continue']
${submit_button_enroll}  xpath: //a/span[text()='Sub']
${confirmation_enroll}  xpath: //span[text()='Confirmation']

${benefits_relationship_section}  xpath: //div[text()='Benefits Relationships']

