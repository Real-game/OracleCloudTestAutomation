*** Variables ***

${lease_action_progress_drop_down}    xpath: (//label[text()="Lease Action Progress"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${date_completed_input}     xpath: (//label[text()="Date Completed"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${completion_action_details_input}      xpath: (//label[text()="Completion Action Details"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${send_button}      xpath: //*[text()='Send']
${workflow_actions_drop_down}     xpath: (//label[text()="Workflow Actions"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${send_for_review_option}       xpath: //li/div[text()='Send for Review']
${send_button_in_dialog}        xpath: //span[text()='Send']
${confirmation_message_text}    xpath: (//span[text()='Notification']/parent::div/parent::div/following-sibling::div//span)[1]
${ok_button_confirmation_pop_up}            xpath: //span[text()='OK']



