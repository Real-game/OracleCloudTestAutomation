*** Variables ***
${candidate_title}      xpath: //div[@class='x1de']/h1
${activity_link}        xpath: //div[@title='Activity']//a
${prospect_expand}      xpath: //div[@title='Prospects']/parent::td/following-sibling::td//a
${requisition_action}   xpath: //img[@title='Actions' and @class='xi6']
${requisition_title}    xpath: //a[contains(@id,'csLnk')]
${convert_prospect_action_dropdown}     xpath: //div[@title='Prospect Candidate Actions']//a[@title='Actions']
${convert_prospect_link}     xpath: //tr[@title='Convert Prospect']
${warning_yes_button}       xpath: //div[contains(@id,'hm2:PSEcil2')]/a
${close_pop_up}             xpath: //a[contains(@id,'actwHm:cil5')]
${back_button}              xpath: //a[@title='Back']
${interactions_link}        xpath: //div[text()[contains(.,'Interactions')]]
${interactions_drop_down_selection}     xpath: //a[contains(@id,'drop')]
${interactions_drop_down_list}      xpath:  //li
${sent_mail_interaction}        xpath://span[@class='x32e'][text()[contains(.,'Sent E-Mail')]]
${expand_interaction}           xpath: //img[@Alt='Expand']
${recruiter_name}               xpath: //div[contains(@id,'rec2Pg')]/div/span
${feedback_link}                xpath: //div[text()[contains(.,'Feedback')]]
${actions_link}                 xpath: //img[contains(@id,'Cil')]
${feedbackaction_link}          xpath:  //img[contains(@src,'/hcmUI/images/func_ellipses_24_ena.png')]
${view_feedback_link}                xpath: //*[text()[contains(.,'View Feedback')]]
${prospects}                    xpath: //span[contains(text(),"Prospects:")]

${personal_info_expand}  xpath: //h2[text()='Personal Info']//parent::div//parent::td//following-sibling::td//div[@title="Expand"]
${personal_info_edit}  xpath: //h2[text()='Personal Info']//parent::div//parent::td//following-sibling::td//a/span[text()='Edit']
${edit_email_personal_info}  xpath: //label[text()='Email']//parent::div/following-sibling::div/input
${personal_info_save}  xpath: //span[text()='Save']
${personal_info_error}  xpath: //div[contains(text(),'Error')]

${Candidate_action}  xpath: //span[text()='Actions']
${candidate_add_to_requisition}  xpath: //td[contains(text(),"Add to Requisition")]





