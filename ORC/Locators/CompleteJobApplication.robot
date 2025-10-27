*** Variables ***
${xpath_hover}  xpath://span/a[@class='x1mu']
${xpath_temp}  xpath://td/ul/li[contains(@class,'x1n6')]
${Attach_img}   xpath: //span[text()='Drag files here or click to add attachment']
${Attach_file}   xpath://td[text()='Add File']
${cont_btn}  xpath://button[@title='Continue']
${sign_input}  xpath://div[text()='Provide signature']//following-sibling::div//input
${sub_button}  xpath:(//span[text()='Submit'])[1]
${no_of_ques}  xpath://div[contains(@id,'plam')]
${xpath_form}  //div[@title='']//input[@type='radio']
#${xpath_form}  //div[@title='']//input[@type!='checkbox']
${JAQ_title}  xpath://tr/td[text()='Job Application Questions']
${xpath_form_textarea}  //div[@title='']//textarea
${pip_plan}    xpath://input[@aria-label="Are you currently placed on a Performance Improvement Plan due to unsatisfactory performance in your current role?"]
${list_value}    xpath://ul/li/div
${internal_mobility_policy}    xpath: //*[normalize-space(contains(text(),"Internal Mobility Policy"))]//ancestor::oj-label-value//oj-option
#//*[text()="If selected for an interview, I acknowledge that I am required as a provision of the  Internal Mobility Policy, to notify my current manager of my intent to interview for this position."]//ancestor::oj-label-value//oj-option
${current_role_12_month}    xpath: //*[text()="Have you been in your current role for 12 months?"]/ancestor::oj-label-value//oj-option
${contract_or_temp_assignment}    xpath: //*[text()="Are you currently on a contract and/or on a temporary assignment?"]/ancestor::oj-label-value//oj-option

