*** Variables ***
${state_input}  xpath://div[label[text()='State']]//following-sibling::div//a
${table}  xpath://td/ul/li
${save_btn}  xpath://a/span/span[text()='S']
${phase_input}  xpath://div[label[text()="Phase"]]/following-sibling::div/span/input
${reason_input}  xpath: //div[label[text()="Reason"]]/following-sibling::div/span/input