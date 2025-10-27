*** Variables ***

${legal_employer_drop_down}  xpath: //a[@title='Legal Employer']
${legal_employer_option}   xpath://span[text()='Metrolinx']
${last_name_input}      xpath: //label[text()='Last Name']/parent::td//following-sibling::td//input
${first_name_input}      xpath: //label[text()='First Name']/parent::td//following-sibling::td//input
${gender_drop_down}   xpath: //label[text()='Gender']/parent::td//following-sibling::td//a
${date_of_birth_input}  xpath: //label[text()='Date of Birth']/parent::td//following-sibling::td//input

${national_identifier_add_icon}  xpath: //div[@title='Add Row']/a
${national_ID_field}  xpath: //label[text()='National ID']/preceding-sibling::input
${next_button}  xpath: //div[@title='Next']/a

${address_line_1_input}   xpath: //label[text()='Address Line 1']/parent::td//following-sibling::td//input
${city_input}   xpath: //label[text()='City']/parent::td//following-sibling::td//input
${postal_code_input}  xpath: //label[text()='Postal Code']/parent::td//following-sibling::td//input

${phone_details_add_icon}  xpath: //h1[text()='Phone Details']/following::div[@title='Add Row'][1]/a
${phone_type_drop_down}  xpath: //label[text()='Type']/preceding-sibling::span//a
${phone_number_input_field}  xpath: //label[text()='Number']/preceding-sibling::input

${business_unit_drop_down}   xpath: //a[@title='Business Unit']
${position_drop_down}   xpath: //label[text()='Position']/preceding-sibling::input
#${position_drop_down}   xpath: //a[@title='Search Positions']

${salary_basis_drop_down}   xpath: //label[text()='Salary Basis']/following-sibling::span//a
${salary_amount_input}      xpath: //label[text()='Salary Amount']/preceding-sibling::input
${submit_button}            xpath: //div[@title='Submit']/a
${warning_pop_up_yes_btn}   xpath: //span[text()='Y']/parent::button[text()='es']
${confirmation_pop_up_ok_btn}   xpath: //span[text()='K']/parent::button[text()='O']
${error_popup}            xpath: //div[text()='Error']



