*** Variables ***

${legal_first_name}      xpath: //input[contains(@id,'fnEInp')]
${legal_last_name}       xpath: //input[contains(@id,'lnEInp')]
${email_address}         xpath: //input[contains(@id,'it3Inp')]
${country_code}          xpath: //input[contains(@id,'is1Srh')]
${select value}          xpath: //table/tr[1]
${area_code}          xpath: //input[contains(@id,'it8Inp')]
${phone_number}          xpath: //input[contains(@id,'it7Inp')]
${save_and_close_button}    xpath: //div[contains(@class,'SaveAndClose')]
${yes_button}               xpath: //span[text()[contains(.,'Yes')]]
${confirmation_title}       xpath: //div[text()[contains(.,'Confirmation')]]
${confirmation_message}     xpath: //div[text()[contains(.,'The initial candidate info was saved. Do you want to complete the profile now?')]]
${ok_button}                xpath: //a[@accesskey='K']
${error_pop_up}             xpath: //div[contains(text(),'Error')]
${error_message}            xpath: //div[contains(text(),'A candidate with the same email already exists. Supply a new email or perform a search to find the candidate associated with this email.')]



