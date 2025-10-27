*** Variables ***

${last_name_input}      xpath: //input[contains(@name,'BILNInp')]
${first_name_input}      xpath: //input[contains(@name,'BIFNInp')]
${relationship_drop_down}     xpath: //a[contains(@id,'CBI2Sel')]
${relationship_options}       xpath: //ul[contains(@id,'CBI2Sel')]//li[contains(@class,'x1n6')]
${relationship_start_date}    xpath: //input[contains(@id,'BIChDDt')]
${emergency_contact_label}    xpath: //label[contains(@id,'BIECChk')]
${phone_type_drop_down}       xpath: //input[contains(@id,'pTypSel')]
${phone_type_options}         xpath: //ul[contains(@id,'pTypSel')]//li[contains(@class,'x1n6')]
${area_code_input}            xpath: //input[contains(@id,'pAcdInp')]
${phone_number_input}         xpath: //input[contains(@id,'pNumInp')]
${submit_button}              xpath: //div[contains(@class,'Submit')]/a



