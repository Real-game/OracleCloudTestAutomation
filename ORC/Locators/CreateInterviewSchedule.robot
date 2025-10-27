*** Variables ***
${temp_hov}  xpath://div[label[text()="Template"]]/following-sibling::div/span/a
${list}  xpath://td/ul/li
${cis_continue_btn}  xpath://div/button[@title="Continue"]
${weblink_input}  xpath://div[label[text()="Web Conference Link"]]/following-sibling::div/input
${candidateinfo_details}  xpath://div[contains(@id,'_cic')]
${reminders_title}  xpath://td[text()="Reminders"]
${inter_saveclose_btn}  xpath://a/span[text()="Save and Close"]
${noo_input}  xpath://td[span[span[input[@value="Number of openings"]]]]/following-sibling::td/span/input
${add_button}   xpath: //span[text()[contains(.,'Add')]]
${country_code}  xpath: (//label[text()="Phone"]/following::input[@type="text"])[1]
${phone_number_1}  xpath: (//label[text()="Phone"]/following::input[@type="text"])[2]
${phone_number_2}  xpath: (//label[text()="Phone"]/following::input[@type="text"])[3]
${web_conference_link}  xpath: (//label[text()="Web Conference Link"]/following::input[@type="text"])[1]
${access_code}  xpath: //label[text()="Access Code"]/following::input[@type="text"]
