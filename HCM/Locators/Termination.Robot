*** Variables ***

${employment_search}  xpath: //input[@placeholder='Search for a Person']
${employment_search_result}  xpath: //table/tr[2]
${reverse}  xpath: //span[text()='Reverse']
${What's_the_action_name_drop_down}  xpath: (//label[text()="What's the action name?"]/following::input[@placeholder="Select a value"])[1]
${select_action_name}  xpath: //tr[contains(@class,"p_AFSelected")]
${submit_button}  xpath: //a[@accesskey='m']
${inactive_checkbox}  xpath: //label[text()="Inactive"]
${comment_box}  xpath://label[text()="Comments"]/following::textarea
${way_to_terminate_dropdown}  xpath: //a[contains(@id,'sis1:aidis::btn')]
${way_to_terminate_value}  xpath: //table[contains(@id,'sis1:aidis::sgstnBdy')]//following-sibling::tr//th
${continue}  xpath: //button[@title='Continue']
${warning_continue}  xpath: //span[text()='Contin']
${direct_report_all_checkbox}  xpath: //td[text()='Reassign Existing Reports']//following::label[contains(@id,'allChk::Label0')]
${direct_report_input}  xpath: //input[contains(@id,'managerIdId::content')]
${direct_report_select}  xpath: //table/tr[2]
