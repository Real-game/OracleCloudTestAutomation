*** Variables ***

${schedule_monitor_process}   xpath: //a[text()='Schedule and Monitor Absence Processes']
${absence_records_link}       xpath: //a[text()='Absence Records']
${absence_type_drop_down}     xpath: //label[text()='Absence Type']/parent::td/following-sibling::td//input[@role='combobox']
${start_date_input}           xpath: //label[text()='Start Date']/parent::td/following-sibling::td//input
${end_date_input}             xpath: //label[text()='End Date']/parent::td/following-sibling::td//input
${reason_drop_down}           xpath: //label[text()='Reason']/parent::td/following-sibling::td//input[@role='combobox']
${submit_button}              xpath: //span[text()='m']
${end_date_time_input}           xpath: //label[text()='End Time']/parent::td/following-sibling::td//input
${ok_button}                  xpath: //button[@title='OK']



