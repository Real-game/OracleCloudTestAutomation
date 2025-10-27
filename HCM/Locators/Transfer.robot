*** Variables ***

${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${continue_button}  xpath: //a[@role='button' and @accesskey='u']
${transfer_start_date}  xpath: //input[@placeholder='dd-mmm-yyyy' and contains(@id,'ipDt')]
${transfer_reason}  xpath: //a[contains(@id,'aridis')]
${continue}  xpath://button[@title="Continue"]

${select_position}  xpath://input[@placeholder='Select a value' and contains(@id,'pidSrh')]
${select_recent_search_result}  xpath://table/tr[2]
${yes_button}  xpath://a[@role='button' and @accesskey='Y']

${submit_button}  xpath: //a[@role='button' and @accesskey='m']
${href_my_client}   id:groupNode_workforce_management

${Additional_Assignments_info}  xpath: //span[text()='Additional Assignment Info']
${maintain_managers_info}  xpath: //span[text()='Maintain Managers']
${salary_info}  xpath: //span[text()='Salary']
${compensation_info}  xpath: //span[text()='Compensation']
${reassign_report_info}  xpath: //span[text()='Reassign Existing Reports']
${add_direct_report_info}  xpath: //span[text()='Add Direct Reports']
${comment_attachment_info}  xpath: //span[text()='Comments and Attachments']

${direct_report_all_checkbox}  xpath: //td[text()='Reassign Existing Reports']//following::label[contains(@id,'allChk::Label0')]
${direct_report_input}  xpath: //input[contains(@id,'managerIdId::content')]
${direct_report_select}  xpath: //table/tr[2]

${add_direct_report_input}  xpath:     //label[contains(text(),'add as reports')]//parent::div//following-sibling::div//input

${comment_box}  xpath://label[text()="Comments"]/following::textarea

${position_seniority_rank_input}  xpath: //label[text()='Position Seniority Rank']//parent::div//following-sibling::div/input
${bargaining_unit_seniority_rank_input}  xpath: //label[text()='Bargaining Unit Seniority Rank']//parent::div//following-sibling::div/input
${section_seniority_date_input}  xpath: //label[text()='Section Seniority Date']//parent::div//following-sibling::div/input
${contract_start_date_input}  xpath: //label[text()='Contract Start Date']//parent::div//following-sibling::div/input
${contract_end_date_input}  xpath: //label[text()='Contract End Date']//parent::div//following-sibling::div/input
${contract_type_dropdown}  xpath: //label[text()='Contract Type']//parent::div//following-sibling::div//a
${contract_reason_dropdown}  xpath: //label[text()='Reason']//parent::div//following-sibling::div//a

${salary_basis_dropdown}  xpath: //label[text()='Salary Basis']//parent::div//following-sibling::div//a
${salary_value}  xpath: //label[text()='Salary Amount']//parent::div//following-sibling::div//input
${salary_header}  xpath: //label[text()='Salary Amount']

${add_direct_report_header}  xpath: //td[text()='Add Direct Reports']
${compensation_header}  xpath: //td[text()='Compensation']
${salary_heading}  xpath: //td[text()='Salary']
${maintain_managers_header}  xpath: //td[text()='Maintain Managers']
${additional_assignment_info_header}  xpath: //td[text()='Additional Assignment Info']
