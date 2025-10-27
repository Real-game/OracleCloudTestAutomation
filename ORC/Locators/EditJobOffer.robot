*** Variables ***
${ejo_options}  xpath://div/div/a//*[name()="svg" and contains(@class,"x1mc")]
${ejo_continue_btn}  xpath://a/span[text()="Contin"]
${ejo_req_date}  xpath://div[label[text()="When is the employee start date?"]]/following-sibling::div/input
${ejo_emp_type_dropdown}  xpath://div[label[text()="Employee Type"]]/following-sibling::div/span/a
${ejo_temp}  xpath://ul/li[@class="x1n6"]
${ejo_continue}  xpath://button[@title="Continue"]
${ejo_person_type_dropdown}  xpath://div[label[text()="Proposed Person Type"]]/following-sibling::div/span/a
${ejo_assign_status_dropdown}  xpath://div[label[text()="Assignment Status"]]/following-sibling::div/span/a
${ejo_assign_temp}  xpath://ul[contains(@id,"asiSel")]/li[contains(@class,"x1n6")]
${ejo_person_type_temp}  xpath://ul[contains(@id,"pwtSel")]/li[contains(@class,"x1n6")]
${ejo_business_unit_field}  xpath://div[label[text()="Business Unit"]]/following-sibling::div//span/input[2]
${ejo_collaborator_type_dropdown}  xpath://div[label[text()="Add Collaborator Type"]]/following-sibling::div//span/a
${ejo_ass_hiring_manager_input}  xpath://div[label[text()="Assistant Hiring Manager"]]/following-sibling::div//span/input
${ejo_select_value}  xpath://table/tr[2]
${ejo_hrbp_input}  xpath://div[label[text()="HRBP"]]/following-sibling::div//span/input
${ejo_collab_input}  xpath://div[label[text()="Collaborator"]]/following-sibling::div//span/input
${ejo_payroll_add_btn}  xpath://a/span[text()="Add"]
${ejo_payroll_dropdown}  xpath://div[label[text()="Payroll"]]/following-sibling::div//span/a
${ejo_payroll_temp}  xpath://ul[contains(@id,"sc1Sel")]/li[contains(@class,"x1n6")]
${ejo_tax_report_unit_dropdown}  xpath://div[label[text()="Tax Reporting Unit"]]/following-sibling::div//span/a
${ejo_tax_report_temp}  xpath://ul[contains(@id,"sc2Sel")]/li[@class="x1n6"]
${ejo_salary_basis_dropdown}  xpath://div[label[text()="Salary Basis"]]/following-sibling::div//span/a
${ejo_salary_basis_temp}  xpath://table/tr/th/div
${ejo_salary_amount_input}  xpath://div[label[text()="Salary Amount"]]/following-sibling::div//td/span/input
${ejo_add_file_dropdown}  xpath://a/span[text()="Drag files here or click to add attachment"]
${ejo_add_file}  xpath://td[text()="Add File"]
${ejo_contract_start_input}  xpath://div[label[text()="Contract Start Date"]]/following-sibling::div/input
${ejo_contract_end_input}  xpath://div[label[text()="Contract End Date"]]/following-sibling::div/input
${ejo_offer_letter_dropdown}  xpath://div[span[label[text()="Offer Letter"]]]/following-sibling::div//a
${ejo_offer_letter_temp}  xpath://table[@_rowcount="3"]//tr/td/span
${ejo_ol_download_btn}  xpath://button[text()="Download"]
${ejo_expiration_input}  xpath://div[label[text()="Expiration Date"]]/following-sibling::div/span/input
${additional1}  xpath://html[head[title[text()="Additional Text 1"]]]/body
${additional2}  xpath://html[head[title[text()="Additional Text 2"]]]/body
${ejo_submit_btn}  xpath://a/span[text()="Sub"]
${ejo_ot_continue}  xpath://button[text()="Continue"]
${eoj_remove_temp}  xpath://img[contains(@title,"Remove")]
