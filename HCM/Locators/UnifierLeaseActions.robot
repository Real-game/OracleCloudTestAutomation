*** Variables ***

${create_lease_action_button}    xpath:  //span[text()='Create']//preceding::oj-button[@id='new-btn-bp']
${lease_actions_frame}      xpath: (//iframe[contains(@src,'/studio/')])[1]

${search_lease_action_icon}     xpath: //button//span[contains(@class,'search')][@slot='startIcon']
${search_lease_action_apply}    xpath: (//span[text()='Apply'])[1]
${record_number_input}          xpath: //label[text()='Record No.']/parent::div/ancestor::search-string-field//input[@aria-label='Record No.']

