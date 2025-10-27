*** Variables ***

${payroll_flow}  xpath: (//label[text()="Payroll Flow"]/following::input[@type="text"])[1]
${payroll_dropdown}  xpath: (//label[text()="Payroll"]/following::a)[1]
${payroll_period_dropdown}  xpath: (//label[text()="Payroll Period"]/following::a)[1]
${run_type_dropdown}  xpath: (//label[text()="Run Type"]/following::a)[1]
${report_category_dropdown}  xpath: (//label[text() = "Report Category"]/following::a)[1]
${scope_dropdown}  xpath: (//label[text() = "Scope"]/following::a)[1]

${effective_date_text_box}  xpath: //div[@title="Effective Date"]//input[@placeholder="dd-mmm-yyyy"]
${start_date_text_box}  xpath: //div[@title="Start Date"]//input[@placeholder="dd-mmm-yyyy"]
${end_date_text_box}  xpath: //div[@title="End Date"]//input[@placeholder="dd-mmm-yyyy"]
${process_date_text_box}  xpath: //div[@title="Process Date"]//input[@placeholder="dd-mmm-yyyy"]

${submit_button}  xpath: //a[@accessKey="m"]
${expand_output_and_log_files}  xpath: (//h2[text()="Output and Log Files"]/following::img[@title="Expand"])[1]

${first_process_id}  xpath: (//tr[@_afrrk="0"]//td//span)[1]

${process_start_date}  xpath: //div[@title="Process Start Date"]//input[@placeholder="dd-mmm-yyyy"]
${process_end_date}  xpath: //div[@title="Process End Date"]//input[@placeholder="dd-mmm-yyyy"]