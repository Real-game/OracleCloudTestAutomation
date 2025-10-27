*** Variables ***

${homepage}  xpath: (//div[@align='center'])[3]
${update_accural_plan_enrollments}   xpath: //span[text()='Update Accrual Plan Enrollments']
${update_accural_plan_enrollments_run}   xpath: //span[text()='Update Accrual Plan Enrollments'] //following::img[@title='Run'][1]
${Effective_date}  xpath: //span[text()='Press down arrow to access Calendar']/following-sibling::a
${year_input}  xpath: //input[@role='spinbutton']
${month_drop_down}  xpath: //span[@class='x15j']//select[1]
${next_month}  xpath: //a[@title='Next Month']
${date_value}  xpath: //td[contains(@class,'x150')]
${person_name}  xpath: //label[text()='Person']/following::input
${absence_plan}  xpath: //a[@title='Search: Absence Plan']
${submit}  xpath: //a[@role='button' and @accesskey='m']
${submission_confirmation_number}  xpath: //span[contains(@id,'confirmationPopup')]/label
${confirmation_yes}  xpath: //button[contains(@id,'confirmSubmitDialog::ok')]

${refresh_button}  xpath: //img[@title='Refresh']
${calculate_accurals_and_balances}  xpath: (//tr[@_afrrk='3']//td)[3]
${calculate_accurals_and_balances_run}  xpath: //span[text()='Calculate Accruals and Balances'] //following::img[@title='Run'][1]

${effective_date_inp}  xpath: //label[text()='Effective Date']/following::input[@placeholder='dd-mmm-yyyy']

${plan_type}  xpath: //label[text()="Plan Type"]/following::input[1]
${business_unit_dropdown}  xpath: //a[@title="Search: Business Unit"]

${confirmation_message}  xpath: //div[text()="Confirmation"]/following::label

${time_range_dropdown}  xpath: //label[text()="Time Range"]/following::a[1]
