*** Variables ***

${board_order_status_drop_down}    xpath: (//label[text()="Status"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${applicable_board_entity_input}      xpath: (//label[text()="Applicable Board Entity"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${board_order_number_input}   xpath: (//label[text()="Board Order #"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${date_of_agreement_input}       xpath: (//label[text()="Date of Agreement"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${board_order_file_number_input}    xpath: (//label[text()="Board Order File # (if appl.)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${comments_on_payment_structure_input}      xpath: (//label[text()="Comments on Payment Structure (if appl.)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${parties_to_agreement_1_input}     xpath: (//label[text()="Parties to Agreement 1"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${parties_to_agreement_2_input}     xpath: (//label[text()="Parties to Agreement 2"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${parties_to_agreement_3_input}     xpath: (//label[text()="Parties to Agreement 3"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${parties_to_agreement_4_input}     xpath: (//label[text()="Parties to Agreement 4"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${location_description_input}       xpath: (//label[text()="Location Description (if appl.)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${mileage_point_from_input}         xpath: (//label[text()="Mileage Point From"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${mileage_point_to_input}         xpath: (//label[text()="Mileage Point To"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${subdivision_drop_down}          xpath: (//label[text()="Subdivision"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${property_contract_lookup_icon}   xpath: (//span[contains(@class,'checkbox-set')])[1]
${property_contract_search_icon}   xpath: (//span[contains(@class,'search')])[1]



${property_contract_select_button}    xpath: (//span[text()='Select'])[1]
${requirements_of_board_order_input}    xpath: (//label[text()="Requirements of Board Order"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${submit_board_order}               xpath: //*[text()='Submit']
${record_number_search_input}     xpath: //label[text()='Record No.']/parent::div/parent::oj-label/parent::div/parent::div//following-sibling::div//oj-input-text//input[@aria-label='Record No.']
${search_board_order_apply}    xpath: (//span[text()='Apply'])[2]
${select_button}                 xpath: (//span[text()='Select'])[1]


