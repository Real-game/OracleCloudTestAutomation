*** Variables ***

${Edit_button}  xpath://a[@title="Edit"]
${Edit_action}  xpath://div[@class='x1jp']/table/tbody/tr/td[@class='xnz']
${get_effective_date_selected}  xpath://input[@placeholder='dd-mmm-yyyy']
${action_reason}  xpath:(//label[text()='Action Reason'])[3]/following::input
${ok_button}  xpath://button[@accesskey='K']//span[1]
${type}  xpath://label[text()='Type']/following::input[1]
${FTE}  xpath://label[text()='FTE']/following::input[1]
${head_count}  xpath:(//label[text()='Head Count'])[2]/following::input[1]
${regular_temporary}  xpath://label[text()='Regular or Temporary']/following::input[1]
${fulltime_parttime}  xpath://label[text()='Full Time or Part Time']/following::input[1]

${submit_button}  link:Submit
${review_button}  xpath://div[@title="Review"]
${warning_button_Yes}  xpath://button[span[text()="Y"]]
${warning_button_no}  xpath://button[span[text()="N"]]
${warning_message}  xpath://table[@class='xf5' and contains(.,'Warning')]
${error_message}  xpath://div[@class='x1os']//span[1]
${error_message_ok_button}  xpath://td[@class="p_AFResizable x1ri"]//button[text()='OK']
${confirm_button}  xpath://button[@accesskey='K']//span[1]
${warning_button_Yes}  xpath://button[span[text()="Y"]]

#${warning_message}  xpath://table[@class='xf5' and contains(.,'Warning')]
${page_header}  xpath: (//div[@class='x1de']//h1)[2]