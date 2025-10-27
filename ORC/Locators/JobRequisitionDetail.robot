*** Variables ***
${PD_Expand}  xpath://div[@title='Posting Description']//child::div[@title='Expand']
${PD_Edit}  xpath://div[@title='Posting Description']//child::div[@title='Edit']
#${Desc_input}   xpath://div/span[@class='xdu xkg x1a']/span/span/input
#${Selected_value}   xpath://div/table[@class='xk6' and contains(@id,'idLbl')]
${Save_btn}  xpath://div[@title='Save']
${PD_Collapse}  xpath://div[@title='Posting Description']//div[@title='Collapse']
#${checker}  xpath://div/table[@class='x1v p_AFReadOnly']/tbody/tr/td[@class='x197']/span/span/img
${Att_Expand}  xpath://div[@title='Attachments']//child::div[@title='Expand']
${Att_Edit}  xpath://div[@title='Attachments']//child::div[@title='Edit']
${Att_Link}  xpath://a[@title='Add File']
${Att_Add}  xpath://td[text()='Add File']
${Att_Collapse}  xpath://div[@title='Attachments']//div[@title='Collapse']

${Off_Expand}   xpath://div[@title='Offer Info']//child::div[@title='Expand']
${Off_Collapse}  xpath://div[@title='Offer Info']//div[@title='Collapse']


${basic_info_edit_button}  xpath://div[contains(@title,'Basic')]//div[contains(@title,'Edit')]//a[1]
${requisition_title}  xpath://input[contains(@name,'tieInp')]
${other_requisition_title}  xpath://input[contains(@name,'mteInp')]
${language_dropdown}  xpath://input[contains(@name,'lang')]
${comment_box}  xpath: //textarea[contains(@id,'coeInp')]
${save_button}  xpath://div[@title='Save']/a
${cancel_button}  xpath://div[@title='Cancel']/a

${hiring_team_edit_button}  xpath://div[contains(@title,'Hiring Team')]//div[contains(@title,'Edit')]//a[1]
${hiring_manager_drop_down}  xpath://span[contains(@id,'hmSis')]//a
${recruiter_drop_down}  xpath://span[contains(@id,'reSis')]//a
${add_collaborator_type_drop_down}  xpath://span[contains(@id,'cTypSel')]//a
${collaborator_drop_down}  xpath://span[contains(@id,'coIs')]//a
${add_collaborator_link}  xpath://a[@title='Add Another Collaborator']

${posting_description_check_box}    xpath: //table[contains(@id,'icdChk')]//input[contains(@id,'Chk::content')]/parent::span
${continue_button}      xpath: //*[@title='Continue']
${submit_button}                xpath: //a[@accesskey='m']
${posting_description_input}     xpath: //input[contains(@id,'ipdIs::content')]
${collaborator_input}  xpath://input[contains(@id,'cTypSel')]
${selected_collaborator}  xpath://div/table/tr[2]
${internal_description}  xpath://textarea[@aria-label="Short Description for Internal Candidates"]
${configuration_expand}  xpath://div[@title='Configuration']//div[@title='Expand']
${configuration_edit}  xpath://div[contains(@title,'Configuration')]//child::div[contains(@title,'Edit')]
${automatic_fill_field}  xpath://div[label[text()="Automatically Fill Requisition"]]/following-sibling::div/span
${temp}  xpath: //div[label[text()="Automatically Fill Requisition"]]//following::ul[contains(@id,'pop')]//li
${configuration_collapse}  xpath://div[@title='Configuration']//div[@title='Collapse']
${internal_question}  xpath://div//*[*[*[*[*[child::div[@title="Internal Prescreening Questionnaire"]]]]]]/following-sibling::div//*[label[text()="Add Question"]]/following-sibling::div//span/input
${questionnaire_expand}  xpath://div[@title='Questionnaires']//div[@title='Expand']
${questionnaires_edit}  xpath://div[contains(@title,'Questionnaires')]//div[contains(@title,'Edit')]//a[1]
${selected_temp}  xpath://table/tr[2]
${external_question}  xpath://div//*[*[*[*[*[child::div[@title="External Prescreening Questionnaire"]]]]]]/following-sibling::div//*[label[text()="Add Question"]]/following-sibling::div//span/input
${questionnaires_collapse}  xpath://div[@title='Questionnaires']//div[@title='Collapse']
${posting_description_checker}    xpath: //table[contains(@id,'icdChk')]//input[contains(@id,'Chk::content')]
#${posting_description_result}     xpath:   //tr[contains(@class,'p_AFSelected')]
${warning_close_icon}           xpath: //a[contains(@id,'cil5')]
${jd_collob_dropdown}  xpath: //div[label[text()="Add Collaborator Type"]]/following-sibling::div//a
${jd_assis_hiring_manager_input}  xpath://div[label[text()="Assistant Hiring Manager"]]/following-sibling::div//span/input
${jd_hrbpinput}  xpath: //span[@aria-label="HRBP"]//input[contains(@id,'content')]
${jd_collabinput}  xpath: //span[@aria-label="Collaborator"]//input[contains(@id,'content')]
${jd_xpath_template}    xpath://ul[contains(@id,'pop')]//li
${jd_selected_value}  xpath://table/tr[2]
${requisition_structure_expand}  xpath://div[@title='Requisition Structure']//child::div[@title='Expand']
${org_label}  xpath://div[label[text()="Organization"]]
${details_expand}  xpath://div[@title='Details']//child::div[@title='Expand']
${pay_label}  xpath://div[label[text()="Minimum Pay Range"]]
${posting_description_checkbox}  xpath: //label[text()="Enter Custom Internal Posting Description"]