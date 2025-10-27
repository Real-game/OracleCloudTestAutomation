*** Variables ***
${employment_search}  xpath: //input[@placeholder='Search for a Person']
${inactive_checkbox}  xpath://label[text()="Inactive"]
${calender_icon}  xpath://a[@title="Select Date"]
#${select_current_date}  xpath://td[@class="x11x p_AFSelected"]
${set_date}  xpath: //input[@placeholder="dd-mmm-yyyy"]
${set_date_ok}  xpath: //input[@placeholder="dd-mmm-yyyy"]//following::button[text()="OK"][1]
${checkbox_work_relationship}  xpath://span[text()='Work Relationship Info']
${checkbox_payroll_details}  xpath://span[text()='Payroll Details']
${checkbox_salary}  xpath://span[text()='Salary']
${checkbox_compensation}  xpath://span[text()='Compensation']
${manage_info_continue_button}  xpath://a[@role='button' and @accesskey='u']

${relationship_start_date}  xpath://label[text()='When is the work relationship start date?']/following::input[1]
${legal_employer_drpdown}  xpath:(//label[@class='x9w']/following-sibling::a)[1]
${legal_employer_input}  xpath:(//label[text()="Legal Employer"]/following::input)[1]
${select_recent_search_result}  xpath://table/tr[2]
${way_to_create_relashionship_dropdown}  xpath:(//label[@class='x9w']/following-sibling::a)[2]
${why_adding_relashionship_dropdown}  xpath:(//label[@class='x9w']/following-sibling::a)[3]

${business_unit}  xpath:(//label[text()='Business Unit']/following::input)[1]
${select_position}  xpath:(//label[text()='Position']/following::input)[1]
${yes_button}  xpath://a[@role='button' and @accesskey='Y']

${tax_reporting_unit}  xpath://label[text()='Tax Reporting Unit']/following::input[1]
${time_card_required}  xpath://label[text()='Time Card Required for Assignment']/following::input[1]

${select_currency}  xpath://label[text()='Currency']/following::input[1]
${salary_basis}  xpath:(//label[text()="Salary Basis"]/following::input)[1]
${salary_amount}  xpath:(//label[text()="Salary Amount"]/following::input)[1]


${continue_button}  xpath://button[@title='Continue']
${submit_button}  xpath://a[@role='button' and @accesskey='m']

${action_dropdown_click}  xpath:(//input[@class='x2h']/following-sibling::a)[1]
${action_reason_dropdown_click}  xpath:(//input[@class='x2h']/following-sibling::a)[2]
${legal_employer_dropdown_click}  xpath://span[@class='x1q1']//a[1]

${next_button}  xpath://div[@title='Next']

${position_dropdown_click}  xpath://a[@title='Search Positions']
${search_position_link}  link: Search...
${position_code_input}  xpath://label[text()="Code"]/following::input[1]
${search_button}  xpath://button[text()="Search"]
${ok_button}  xpath:(//button[text()='OK'])[1]
${warning_ok_button}  xpath://button[@accesskey='K']

${icon_create_payroll}  xpath://img[@title='Create']
${search_and_select_payroll_dropdown}  xpath://a[@title='Search and Select: Payroll']

${salary_basis_dropdown}  xpath://a[@title='Search: Salary Basis']

${submit_button}  xpath://div[@title="Submit"]
${warning_button_Yes}  xpath://button[span[text()="Y"]]
${confirm_button}  xpath://button[@accesskey='K']