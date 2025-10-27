*** Variables ***
${response_desc_temp}  xpath://table/tbody/tr/td[span[span[input[@value=""]]]]/following-sibling::td/span/span/input
${label}  xpath://label[text()="Maximum Possible Score"]
${save_btn}  xpath: //span[text()="ave and Close"]
${ok_btn}  xpath://button[text()="O"]
${score_input}    xpath: //input[contains(@id,'0:it3::content')]