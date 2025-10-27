*** Variables ***


${accept_btn}   xpath: //*[text()='Accept']
${send_btn}   xpath: //*[text()='Send']
${payment_details_tab}   xpath: //span[text()='Payment Details']
${total_amount}   xpath: //div[@aria-label='Amount']
${workflow_actions_btn}   xpath: //label[text()='Workflow Actions']//following::a[1]
${workflow_actions_send_btn}   xpath: //button//span[text()='Send']
${search_record_icon}   xpath: //button[contains(@aria-labelledby,'search')]//span[@slot='startIcon']
${record_number_input_field}    xpath: //input[@aria-label='Record Number']
${apply_button}     xpath: (//button//span[text()='Apply'])[1]