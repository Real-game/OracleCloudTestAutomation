*** Variables ***

${tasks_icon}   xpath://img[@title='Tasks']
${work_relationship_link}  xpath: //a[text()='Work Relationship']
${terminate_link}        xpath: //td[text()='Terminate']
${actions_drop_down}     xpath: //a[@title='Actions']
${termination_action_drop_down}      xpath: //label[text()='Action']/parent::td/following-sibling::td//input
${reason_drop_down}     xpath: //label[text()='Reason']/parent::td/following-sibling::td//input
${notification_date_drop_down}     xpath: //label[text()='Notification Date']/parent::td/following-sibling::td//input
${termination_date_drop_down}     xpath: //label[text()='Termination Date']/parent::td/following-sibling::td//input
${termination_option}    xpath: //li[text()='Termination']
${review_button}         xpath: //button[text()='Review']
${submit_button}         xpath: //span[text()='m']
${deferred_radio_button}    xpath: //label[text()='Deferred']
${process_change_on}    xpath: //label[text()="Process Changes On"]/following::input
${yes_button_pop_up}        xpath: //button[@accesskey='Y']
${ok_pop_up}                xpath: //button[@accesskey='K']
${done_button}              xpath: //button[@title='Close person management']