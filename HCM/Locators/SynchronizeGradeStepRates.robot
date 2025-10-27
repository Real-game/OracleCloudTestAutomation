*** Variables ***

${synchronize_grade_steps_header}  xpath:  //div[@title= 'Synchronize Grade Step Rates']
${bttn_process_options}  xpath: //button[@title= 'Set options that affect the data to be processed']
${bttn_advanced}  xpath: //div[@title= 'Define additional information regarding schedule, output and notification']
${bttn_submit}  xpath: //a[@accessKey='m']
${bttn_cancel}  xpath: //a[@accessKey='c']
${ok_popup_button}    xpath: //button[contains(@id,'confirmSubmitDialog::ok')]

${grade_ladder_group_dropdown}    xpath: //a[contains(@id,'soc4::drop')]
${grade_ladder}  xpath: //input[@value='0'][@class='x19o']
${grade_ladder_group}  xpath: //label[text()="Grade ladder group"]
${effective_date}  xpath: //input[contains(@id,'0:id1::content') and @placeholder='dd-mmm-yyyy']

${active_checkbox}  xpath: //input[contains(@id,'smc1:_0') and @type='checkbox']
${click_active}  xpath: //label[text()='Active' and contains(@for,'smc1:_0')]
${suspended_checkbox}  xpath: //input[contains(@id,'smc1:_1') and @type='checkbox']
${click_suspend}  xpath: //label[text()='Suspended' and contains(@for,'smc1:_1')]
