*** Variables ***
${Employer_description_edit_button}     xpath://div[@title='Employer Description']//span[text()[contains(.,'Edit')]]
${employer_check_box}                   xpath://label[text()='Same as Internal']
${save_button}                          xpath://a[@accesskey='S']
${internal_dropdown}  xpath://div[label[text()="Internal"]]/following-sibling::div//a
${select}  xpath://table/tr[2]
${Recruiting_description_edit_button}  xpath://div[@title='Recruiting Organization Description']//span[text()[contains(.,'Edit')]]
${add_button_media}                     xpath: //span[text()[contains(.,'Add')]]
${title_input}                          xpath: //input[contains(@id,'ttlInp')]
${url_input}                            xpath: //input[@placeholder="URL"]
${type_dropdown}                        xpath: //a[contains(@id,'eTyp')]
${type_option}                          xpath: //ul[contains(@id,'eTyp')]//li
${visibility_option}                  xpath: //ul[contains(@id,'eVis')]//li
${offer_option}                       xpath: //ul[contains(@id,'offSel')]//li
${offer_dropdown}                     xpath: //a[contains(@id,'offSel')]
${visibility_dropdown}                xpath: //a[contains(@id,'eVis')]