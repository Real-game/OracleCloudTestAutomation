*** Variables ***
${actions_btn}  xpath://button[span[text()='Actions']]
${actions_table}  xpath://tr[contains(@id,'actMi')]/td
${activity_btn}  xpath://div[@title='Activity']
${JA_dropdown}  xpath://span/a[contains(@id,'csPce')]
${table}  xpath://td/ul/li
${next_btn}  xpath://td/button[text()='Next']
${move_btn}  xpath://div/a/span[contains(text(),'Move')]
${popup}  xpath://div[@title='Warning']
${popup_option}  xpath://div/a[@href='#']/span
${close_popup}  xpath://td/a/img
${attachments_btn}  xpath://div[text()="Attachments"]
${view_downarrow}  xpath://td[label[text()="View"]]/following-sibling::td/span/a
${select_list}  xpath://li[text()="List"]
${download_btn}  xpath://img[@title="Download"]
${addfile_link}   xpath://a[@title="Add File"]
${select_preview}  xpath://li[text()="Preview"]
${pd_dropdown}  xpath://td[div[@title="Personal Info"]]/following-sibling::td//div/a
${pd_firstname}  xpath://div[label[text()="Legal First Name"]]/following-sibling::div/span
${pd_lastname}  xpath://div[label[text()="Legal Last Name"]]/following-sibling::div/span
${questions_btn}  xpath://div[text()="Questions"]
${question_sec_1}  xpath://div[@class="x3h5"]/div[contains(@title,"18")]//span/span
${question_sec_2}  xpath://div[@class="x3h5"]/div[contains(@title,"to work in Canada?")]//span/span
${extrainfo_btn}  xpath://div[text()="Extra Info"]
${details_btn}  xpath://div[text()="Details"]
${warning_yes}  xpath://a[span[text()="Yes"]]
${preview_offer_title}   xpath: //h1[text()[contains(.,'Preview Offer')]]
${Attach_img}   xpath: //span[text()='Drag files here or click to add attachment']
${go_back}  xpath://*[name()="svg" and @aria-label="Done"]
${sm_continue}  xpath://button[@title="Continue"]
${sm_use_dropdown}  xpath://div[label[text()="Use"]]/following-sibling::div//a
${sm_mail_area}  xpath://body[@contenteditable="true"]
${sm_send}  xpath://a[span[text()="Send"]]
${interaction_btn}  xpath://div[text()="Interactions"]
${cp_action}  xpath://a[@title='Actions']
${cp_}  xpath://i[@class="xqw"]

