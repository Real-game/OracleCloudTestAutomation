*** Variables ***
${run_process_workforce_compensation_change_statement}    xpath: //span[text()="Process Workforce Compensation Change Statements"]/following::img[1]

${plan_drodown}    xpath: //label[text()="Plan"]/following::a[1]

${cycle_drodown}    xpath: //label[text()="Cycle"]/following::a[1]

${mode_drodown}    xpath: //label[text()="Mode"]/following::a[1]

${template_drodown}    xpath: //label[text()="Template"]/following::a[1]

${visibility_drodown}    xpath: //label[text()="Visibility"]/following::a[1]

${refresh_date_drodown}    xpath: //label[text()="Refresh Date"]/following::input[1]

${create_new_run_radio_button}    xpath: //label[text()="Create a new run"]

${action_drodown}    xpath: (//label[text()="Action"]/following::input)[1]

${action_reason_drodown}    xpath: (//label[text()="Action Reason"]/following::input)[1]

${next_button}    xpath: //button[@accesskey="x"]

${element_posting_date_drodown}    xpath: //input[@value="Specified date"]

${mark_assignment_as_processed_drodown}    xpath: //label[text()='Mark Assignments as Processed']/following::input[1]

${information_pop_ok_button}    xpath: //div[text()="Information"]/following::button[1]

${monitor_process_button}    xpath: //span[text()="Monitor Processes"]

${back_out_level}    xpath://label[text()="Back Out Level"]/following::input[1]