*** Variables ***

${filter_icon}   xpath: //img[@title='Filters']
${eligibility_status_drop_down}  xpath: //label[text()='Eligibility Status']/parent::td/following-sibling::td//a
${eligible_check_box}   xpath: //input[@_adftrueval='Eligible']
${go_icon}  xpath: //label[text()='Eligibility Status']/parent::td/parent::tr/parent::tbody/parent::table/parent::td/following-sibling::td//a[@title='Go']
${first_employee_person_number}  xpath: ((//span[text()='Significantly Exceeds' or text()='Achieves' or text()='Goes Beyond'])[1]/parent::span/parent::td/parent::tr/td)[1]//span
${first_employee_name}   xpath: ((//span[text()='Significantly Exceeds' or text()='Achieves' or text()='Goes Beyond'])[1]/parent::span/parent::td/parent::tr/td)[2]/span/span
${columns_hidden_text}  xpath: //*[text()='Columns Hidden']
${first_employee_rating}   xpath: (//span[text()='Significantly Exceeds' or text()='Achieves' or text()='Goes Beyond'])[1]
${ineligible_employee}  xpath: //span[text()='Ineligible']
${ineligible_check_box}   xpath: //input[@_adftrueval='Ineligible']
${eligible_employee}  xpath: //span[text()='Eligible']
