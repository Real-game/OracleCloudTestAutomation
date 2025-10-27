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
${payroll_details_no_data}  xpath: //table[@summary='Payroll Details']/parent::div[text()='No data to display.']
${payroll_details_create_button}  xpath: //a[@title='Create']
${payroll_duration_field}  xpath: //table[@summary='Payroll Details']//input
${save_button}  xpath: //button[text()='Save']
${back_button}  xpath: (//td[@valign='top']//a)[1]

${payroll_realtionship_worker_assignment_old}  xpath: (//span[text()='Payroll Relationship: Worker']/ancestor::tr/following-sibling::tr//a)[2]
${payroll_realtionship_worker_assignment_latest}  xpath: (//span[text()='Payroll Relationship: Worker']/ancestor::tr/following-sibling::tr//a)[1]