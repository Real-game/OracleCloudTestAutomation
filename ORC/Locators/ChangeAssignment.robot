*** Variables ***
${ca_options}  xpath: //div[contains(@id,':gp1Btn')]/a[@role="button"]
${ca_continue_btn}  xpath://a/span[text()="Contin"]
${ca_req_date}  xpath://div[label[text()="When does the assignment change start?"]]/following-sibling::div/input
${ca_continue}  xpath://button[@title="Continue"]
${ca_assign_status_dropdown}  xpath://div[label[text()="Assignment Status"]]/following-sibling::div/span/a
${ca_assign_temp}  xpath://ul[contains(@id,"asiSel")]/li
${ca_business_unit_field}  xpath://div[label[text()="Business Unit"]]/following-sibling::div//span/input[2]
${ca_contract_start_input}  xpath://div[label[text()="Contract Start Date"]]/following-sibling::div/input
${ca_contract_end_input}  xpath://div[label[text()="Contract End Date"]]/following-sibling::div/input
${ca_edit}  xpath://a[@title="Edit"]
${ca_man_name}  xpath://div[label[text()="Name"]]/following-sibling::div//span/input[@aria-label="Name"]
${ca_select}  xpath://table/tr[2]
${ca_ok}  xpath://a[span[text()="OK"]]
${ca_salary_basis_dropdown}  xpath://div[label[text()="Salary Basis"]]/following-sibling::div//span/a
${ca_salary_basis_temp}  xpath://table/tr/th/div
${ca_salary_amount_input}  xpath://div[label[text()="Salary Amount"]]/following-sibling::div//td/span/input
${ca_comments_input}  xpath://div[label[text()="Comments"]]/following-sibling::div/textarea
${ca_submit_btn}  xpath://a/span[text()="Sub"]
${date_ranks}  xpath: //h2[text()='Dates and Ranks']
${line_manager}  xpath: //span[text()='Line manager']
${payroll_freq}  xpath: //h2[text()='Payroll Frequency']
${ca_req_start_date}    xpath: //div[label[text()="When does the assignment start?"]]/following-sibling::div/input
${source_assignment_status_dropdown}  xpath: //div[label[text()="Source Assignment Status"]]//following-sibling::div//a