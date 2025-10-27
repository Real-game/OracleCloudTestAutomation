*** Variables ***

${candidate_first_name}      xpath: //input[contains(@id,'fnEInp')]
${candidate_last_name}       xpath: //input[contains(@id,'lnEInp')]
${email_input}          xpath: //input[contains(@id,'it3Inp')]
${save_and_close_button}    xpath: //div[contains(@class,'Save')]
${ok_warning_button}        xpath: //a[@accesskey='K']
${yes_button}               xpath: //span[text()[contains(.,'Yes')]]/parent::a
${done_link}                xpath: //a[@title='Done']
${country_code}          xpath: //input[contains(@id,'is1Srh')]
${select value}          xpath: //table/tr[1]
${area_code}          xpath: //input[contains(@id,'it8Inp')]
${phone_number}          xpath: //input[contains(@id,'it7Inp')]
