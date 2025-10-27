*** Variables ***
${pos_input_box}    xpath:(//label[text()="Position"]/following::input[1])[1]
${selected_value}  xpath://table/tr[2]
${btn_continue}  xpath://button[@title='Continue']
${BusJus_input_box}  xpath://label[text()="Business Justification"]/following::input[1]
#${RT_input_box}  xpath://div[@class='xv5']/span/input[contains(@id,'rtSel')]
${Org_input_box}  xpath://span/a[contains(@id,'orgIs')]
${Loc_input_box}  xpath://span/a[contains(@id,'locIs')]
${selected_RT}  xpath://li[contains(text(),'Professional')]
${selected_Org}  xpath://input[contains(@id,'orgSis')]
${selected_Loc}  xpath://input[contains(@id,'locIs')]
${Attach_img}   xpath://a[@title='Add File']
${Attach_file}   xpath://td[text()='Add File']
${xpath_template}    xpath://ul[contains(@id,'pop')]//li
${Use_input_box}    xpath://label[text()="Use"]/following::input[1]
${save_close_btn}   xpath://span[contains(text(),'ave and Close')]
#${req_page_title}   class:xnr
${HM_input_box}  xpath:(//label[text()="Hiring Manager"]/following::input[@type="text"])[1]
${Alert_No_btn}  xpath://table//tbody/tr/td/div/a/span[text()='No']


${continue_button}      xpath: //*[@title='Continue']
${work_contract_input}  xpath: //div[contains(@id,'isThisAContractPosition')]//input
${minimum_salary_input}     xpath: //a[@title ="Search: Minimum Pay Range"]
${minimum_salary_input_selection}   xpath: //td//tr[2]
${maximum_salary_input}     xpath: //a[@title ="Search: Maximum Pay Range"]
${maximum_salary_input_selection}   xpath: //td//tr[2]

${posting_description_input}     xpath: //input[contains(@id,'ipdIs::content')]
${internal_questionnaire_1}     xpath: //a[contains(@id,'qrIt:0:qrPce:qrsIt:0:qssSis:qssSrh::btn')]
${question_1}                   xpath:  //tr[contains(@id,'qrsIt:0:qssSis:qssSrh::item0')]

${submit_button}                xpath: //a[@accesskey='m']
${org_selection}                xpath: //tr[contains(@id,'orgIs::item0')]/th/div
${loc_selection}                xpath: //tr[contains(@id,'locIs::item0')]/th/div

${no_of_openings_value}               xpath: //label[text()[contains(.,'Number')]]/parent::div/following-sibling::div//span[text()[contains(.,'1')]]/parent::span
${recruiter_name}                     xpath: //input[contains(@id,'reSis:reIs::content')]
${requisition_drop_down}              xpath:  //input[contains(@id,'reqSis:reqIs::content')]
${requisition_result}       xpath://tr[contains(@id,'item0')]
${collob_dropdown}  xpath://div[label[text()="Add Collaborator Type"]]/following::a[contains(@id,"drop")]
#${dif_collob_input}  xpath://div[@class='xv5 xk7']/span/table//div/div/span/span/span/input

${paragraph}  xpath:  //div/span/p
${req_para}  xpath: (//td[@valign="top"])[8]//a  #Alternate locator - ((//table)[40]//a)[1]

${assis_hiring_manager_input}  xpath://div[label[text()="Assistant Hiring Manager"]]/following-sibling::div//span/input
${hrbpinput}  xpath://div[label[text()="HRBP"]]/following-sibling::div//span/input
${collabinput}  xpath://div[label[text()="Collaborator"]]/following-sibling::div//span/input

${division_input}  xpath: //a[@title ="Search: Division"]
${division_select}  xpath: //tr[@_afrrk='0']
${requisition_type}   xpath: //input[contains(@id,'reTySel')]
${business_unit_value}   xpath: //input[contains(@id,'buSis')]
${recruiting_type_drop_down}    xpath: //label[text()='Recruiting Type']//parent::div//following-sibling::div//a
${recruiting_type_list}     xpath: //label[text()= "Recruiting Type"]//following::ul[contains(@id,"rtSel")]//li
${recruiting_type_input}    xpath: //input[contains(@id,'rtSel')]
#${posting_description_result}     xpath:   //tr[contains(@class,'p_AFSelected')]

${candidate_selection_process}   xpath: //input[contains(@id,'cspSel')]
${posting_description_check_box}   xpath: //input[@type='checkbox'][contains(@id,'icdChk')]/parent::span
${recruiter}  xpath: (//label[text()="Recruiter"]/following::input[@type="text"])[1]