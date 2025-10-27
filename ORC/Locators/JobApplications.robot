*** Variables ***
${sort_dropdown}    xpath://table[contains(@id,'srtSel')]/tbody/tr/td/span/a
${sort_list}   xpath://tbody/tr/td/ul/li
${candidate_list}  xpath://a[contains(@id,'gtleLnk')]
${remove_filter}  xpath://td/a[@title='Remove Filter: Active']
${application_status}     xpath:   //span[@class='x9w']
${requisition_check}  xpath:   //div[contains(@id,'pgl6')]//span
${send_message_to_team_link}    xpath: //td[text()[contains(.,'Send Message to Team')]]
#${use_drop_down}           xpath: //li[contains(@class,'x1n6')]
${continue_button}          xpath: //button[@title='Continue']
${recipient_text_box}           xpath: //input[contains(@id,'Srh::content')]
#${first_recipient}          xpath: //tr[contains(@class,'x1ub')][1]
${email_subject}          xpath: //input[contains(@id,'subjIp')]
${email_body}          xpath: //div[contains(@id,'bodyRte::_cic')]
${use_selection}        xpath: //a[contains(@id,'useSel')]
${email_body_frame}     xpath: //iframe[contains(@id,'bodyR')]
${preview_email_subject}    xpath: //span[contains(@id,'subjeIp::content')]
${preview_email_body}    xpath: //div[contains(@id,'bodyRte::content')]
${send_button}    xpath: //span[text()[contains(.,'Send')]]
${collect_feedback_link}    xpath: //td[text()[contains(.,'Collect Feedback')]]
${add_respondent_input}         xpath: //input[contains(@id,'Srh::content')]
${load_items}  xpath://a[text()="Load More Items"]
${back}  xpath://*[name()="svg" and @aria-label="Back"]
${candidate_search_box}  xpath: //input[@placeholder='Candidate Name or Number']
${search_icon}  xpath: //img[@title='Search']







