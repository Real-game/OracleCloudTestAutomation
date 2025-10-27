*** Variables ***
${termination_notification_date}  xpath://label[text()='When is the termination notification date?']/following::input[1]
${termination_effect_date}  xpath://label[text()='When does the termination take effect?']/following::input[1]
${termination_way_dropdown}  xpath:(//span[@class='x1u0']//a)[1]
${termination_reason}  xpath:(//span[@class='x1u0']//a)[2]
${termination_why_changing_direct_reports}  xpath:(//span[@class='x1u0']//a)[3]
${select_all_checkbox}  xpath://label[text()='Select All']
${search_proposed_manager}  xpath://input[@placeholder='Search for proposed manager']
${select_proposed_manager_from_result}  xpath://tr[@class='p_AFSelected x1ub']

${button_continue}  xpath://button[@title='Continue']
${button_submit}  xpath://a[@role='button' and @accesskey='m']
