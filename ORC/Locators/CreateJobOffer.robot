*** Variables ***
${options}  xpath://div[contains(@id,'gp1Btn')]/a[@role='button']
${continue_btn}  xpath://a/span[text()="Contin"]
${req_date}  xpath://div[label[text()="When is the employee start date?"]]/following-sibling::div/input
${emp_type_dropdown}  xpath://div[label[text()="Employee Type"]]/following-sibling::div/span/a
${temp}  xpath: //label[text()="Employee Type"]/following::ul
${continue}  xpath://button[@title="Continue"]
${person_type_dropdown}  xpath://div[label[text()="Proposed Person Type"]]/following-sibling::div/span/a
${assign_status_dropdown}  xpath://div[label[text()="Assignment Status"]]/following-sibling::div/span/a
${assign_temp}  xpath://ul[contains(@id,"asiSel")]/li
${person_type_temp}  xpath://ul[contains(@id,"pwtSel")]/li
${business_unit_field}  xpath://div[label[text()="Business Unit"]]/following-sibling::div//span/input[2]
${collaborator_type_dropdown}  xpath://div[label[text()="Add Collaborator Type"]]/following-sibling::div//span/a
${ass_hiring_manager_input}  xpath://div[label[text()="Assistant Hiring Manager"]]/following-sibling::div//span/input
${select_value}  xpath://table/tr[2]
${hrbp_input}  xpath://div[label[text()="HRBP"]]/following-sibling::div//span/input[@aria-label='HRBP']
${collab_input}  xpath://div[label[text()="Collaborator"]]/following-sibling::div//span/input[@aria-label='Collaborator']
${payroll_add_btn}  xpath://a/span[text()="Add"]
${payroll_dropdown}  xpath://div[label[text()="Payroll"]]/following-sibling::div//span/a
${payroll_temp}  xpath://ul[contains(@id,"sc1Sel")]/li
${tax_report_unit_dropdown}  xpath://div[label[text()="Tax Reporting Unit"]]/following-sibling::div//span/a
${tax_report_temp}  xpath://ul[contains(@id,"sc2Sel")]/li
${salary_basis_dropdown}  xpath://div[label[text()="Salary Basis"]]/following-sibling::div//span/a
${salary_basis_temp}  xpath://table/tr/th/div
${salary_amount_input}  xpath://div[label[text()="Salary Amount"]]/following-sibling::div//td/span/input
${add_file_dropdown}  xpath://a/span[text()="Drag files here or click to add attachment"]
${add_file}  xpath://td[text()="Add File"]
${contract_start_input}  xpath://div[label[text()="Contract Start Date"]]/following-sibling::div/input
${contract_end_input}  xpath://div[label[text()="Contract End Date"]]/following-sibling::div/input
${offer_letter_dropdown}  xpath://div[span[label[text()="Offer Letter"]]]/following-sibling::div//a
${offer_letter_temp}  xpath://div[contains(@id,'offlIcl')]//tr//span
${ol_download_btn}  xpath://button[text()="Download"]
${expiration_input}  xpath://div[label[text()="Expiration Date"]]/following-sibling::div/span/input
${additional1}  xpath://html[head[title[text()="Additional Text 1"]]]/body
${additional2}  xpath://html[head[title[text()="Additional Text 2"]]]/body
${submit_btn}  xpath://a/span[text()="Sub"]
${ot_continue}  xpath://button[text()="Continue"]
${assignment_category_drop_down}    xpath: //a[contains(@id,'emcSel')]
${assignment_category_options}     xpath: //ul[contains(@id,"emcSel")]/li
${bargaining_unit_label}    xpath: //span[contains(@id,'bdSrh::content')]
${employee_action_drop_down}   xpath: //a[contains(@id,'aidis')]
${transfer_option}     xpath: //div[text()='Transfer']
${transfer_offer_option}    xpath: //span[text()[contains(.,'Transfer OR Promotion - Contract to Permanent')]]
${emp_action_dropdown}  xpath://div[label[text()="Action"]]/following-sibling::div/span//a
${action_name_temp}  xpath: //label[text()="Action"]/following::table[@role="grid"]
${omers_drop_down}     xpath: //a[@title='Search: Is the OMERS clause required?']
#${omers_drop_down_option_no}   xpath: (//div[contains(@id,'Iteratoromers')]//span[text()[contains(.,'No')]])[1]
${omers_drop_down_option_no}   xpath:  (//div[contains(@id,'Iteratoromers')]//span[text()[contains(.,'OMERS clause not required')]])[1]
${union_retention_drop_down}     xpath: //a[@title='Search: Union Dues Retention']
${union_retention_drop_down_no}   xpath: (//div[contains(@id,'Iteratorunion')]//span[text()[contains(.,'No')]])[1]
${omers_drop_down_list}        xpath: //div[contains(@id,'Iteratoromers')]//td//span
${union_retention_drop_down_list}   xpath: //div[contains(@id,'Iteratorunion')]//td//span
${offer_letter_search}          xpath: //a[text()[contains(.,'Search')]]
${name_input}                   xpath: //tr[contains(@id,'criterion1')]//input[contains(@id,'Internal')]
${offer_letter_partial_search}  xpath: //div[contains(@id,'offlIcl_afrLovInternalTableId')]//td[@align='left']//span
${name_search_button}           xpath: //button[contains(@id,'search')]
${ok_button_name_popup}         xpath: //button[contains(@id,'lovDialogId')][1]
${contract_type_drop_down}      xpath: //a[contains(@title,'Contract Type')]
#${contract_temp_list}           xpath: //div[contains(@id,'Iteratorcontract')]//td//span
${hiring_manager_txt_box}       xpath: //div[label[text()="Hiring Manager"]]/following-sibling::div//span/input[@aria-label="Hiring Manager"]
${hiring_manager_label}         xpath: //label[text()='Hiring Manager']

${sync_position_dropdown}  xpath: //div[label[text()="Synchronize from Position"]]/following-sibling::div/span/a