*** Variables ***
${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${select_recent_search_result}  xpath://table/tr[2]
${select_payroll_details}  xpath: //span[text()="Payroll Details"]
${select_salary}  xpath://span[text()="Salary"]
${select_compensation}  xpath://span[text()="Compensation"]

${selection_continue_button}  xpath://a[@role='button' and @accesskey='u']
${continue}  xpath://button[@title="Continue"]

${assignment_start_date}  xpath://div[label[text()="When does the assignment start?"]]//following-sibling::div//input
${assignment_type}  xpath://label[text()="Will the assignment be temporary or permanent?"]/following::input[1]
${assignment_way_dropdown}  xpath://div[label[text()="What's the way to add the assignment?"]]//following-sibling::div//a
${assignment_way}  xpath://div[label[text()="What's the way to add the assignment?"]]//following-sibling::div//input[contains(@id,'content')]
${assignment_reason_dropdown}  xpath://div[label[text()="Why are you adding the new assignment?"]]//following-sibling::div//a
${source_assignment_status_dropdown}  xpath: //div[label[text()="Source Assignment Status"]]//following-sibling::div//a
${assignment_status_dropdown}  xpath: //div[label[text()="Assignment Status"]]//following-sibling::div//a

${select_position}  xpath:(//input[@placeholder='Select a value'])[2]
${yes_button}  xpath://a[@role='button' and @accesskey='Y']

${tax_reporting_unit_dopdown}  xpath://label[text()="Tax Reporting Unit"]/following::input[1]
${time_card_required_dopdown}  xpath://label[text()="Time Card Required for Assignment"]/following::input[1]
${salary_basis}  xpath:(//label[text()="Salary Basis"]/following::input[1])[1]
${select_components}  xpath://button[@title='Select Components']
${temp_assignment_field}  xpath://label[text()='Temporary Assignment']
#${temp_assignment}  xpath://div[@class='xqz']/table/tbody/tr/td[@class='x1ne']
${apply_button_components}  xpath://button[@title='App&ly']
${temp_assignment_value}  xpath://span[text()="Temporary Assignment"]/following::input[1]

${submit_button}  xpath://a[@role='button' and @accesskey='m']