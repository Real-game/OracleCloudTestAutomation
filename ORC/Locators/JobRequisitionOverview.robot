*** Variables ***
${detail_link}                          xpath: //div[contains(@id,'deta')]/div
${basic_info}                           xpath: //div[@title='Basic Info']/h2
${active_application}   xpath: //a[@title='Active Applications']
${actions_dropdown}                     xpath: //a[@title='Actions']
${action_on_job_requisition}              xpath: //tr[contains(@id,'dactMi')]/td
${warning_pop_up}                       xpath: //div[text()= 'Warning']
${warning_message}                      xpath: //div[contains(@id,'actwHm')]//div
#//div[contains(@id,'actwHm')]//span[contains(@class,'x2vu xnf x3b9')]
${warning_message_yes_button}           xpath: //span[text()="Yes"]
${warning_message_no_button}            xpath: //span[text()="No"]
${resume_job_requisition}               xpath: //tr[@title='Resume Job Requisition']
${back_button}                          xpath: //a[@title='Back']
${reopen_job_requisition}               xpath: //tr[@title='Reopen Job Requisition']
${close_pop_up}                         xpath: //a[contains(@id,'actwHm:cil5')]
${interview_btn}                        xpath://div[text()="Interviews"]
${posting_link}                         xpath: //div[text()="Posting"]
${Job_Formatting_drop_down}             xpath: //div[text()[contains(.,'Job Formatting')]]
${interviews_link}                      xpath: //a[contains(@id,'intrS')]
${overview_link}                        xpath: //*[contains(@aria-label,'Overview')]/parent::a
${linked_requisition_add_button}        xpath: //div[contains(@id,'jrPce')]//span[text()[contains(.,'Add')]]
${link_existing_requisition_link}       xpath: //td[text()[contains(.,'Link Existing Requisition')]]
${linked_requisition_header}            xpath: //h1[text()[contains(.,'Link Existing Requisition')]]
${link_existing_requisition_input}      xpath: //input[contains(@id,'reqIs::content')]
${link_save_and_close_button}           xpath: //span[text()='ave and Close']
${staffing_agent_drop_down}             xpath: //a[contains(@id,'agnis')]
${advanced_search_link}                 xpath: //a[text()[contains(.,'Advanced Search')]]
${agents_title}                         xpath: //h2[text()[contains(.,'Agents')]]
${warning_message_suspend}              xpath: //div[contains(text(),"You're about to suspend the job requisition")]
${warning_message_cancel}               xpath: //div[contains(text(),"You're about to cancel the job requisition")]