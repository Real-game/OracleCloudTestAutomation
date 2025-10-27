*** Variables ***

${create_owned_property_button}   xpath: //span[contains(@id,'new-btn-other')]/span[text()='Create']
${create_owned_property_bu_button}  xpath: //span[contains(@id,'new-btn-bp')]/span[text()='Create']
${frame_id}     class: qaframe
${select_business_origin_drop_down}   xpath: (//span[text()='Select Business Process Origin']/ancestor::oj-label/following-sibling::oj-select-single/div/span)[1]
#(//span[text()='Select Business Process Origin']/ancestor::oj-label/following-sibling::oj-select-single/div//a)[1]
${select_business_origin_input}    xpath: ((//oj-form[@id='dialogform1']//oj-select-single)[1]//input)[1]
${create_button}     xpath: (//span[text()='Create'])[1]
${location_picker_icon}    xpath: //button[contains(@aria-labelledby,'locationPicker')]
${owned_properties_header}   xpath: //h1[text()='Owned Properties']

${owned_property_record}   xpath: (//a[@data-trigger='open-record'])[1]

${copied_owned_property_number_input}   xpath: //div[@aria-label='Copied To Owned Property']
${expand_copy_block_icon}     xpath: //span[text()='Copy']/parent::h3/preceding-sibling::a



