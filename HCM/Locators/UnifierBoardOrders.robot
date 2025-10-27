*** Variables ***

${create_board_order_button}    xpath: //span[text()='Create']//preceding::oj-button[@id='new-btn-other']
${board_order_frame}      xpath: //iframe[@class='qaframe'][@title='Home Content']
${select_business_process_origin_drop_down}   xpath: (//span[text()='Select Business Process Origin']/parent::b/parent::label/parent::div/parent::oj-label/following-sibling::oj-select-single//a)[1]
${create_new_board_order_record_button}       xpath: (//span[contains(@id,'createNewRec')])[1]
