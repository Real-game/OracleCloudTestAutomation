*** Variables ***

${performance_template_search_button}  xpath: //button[text()='Search']
${performance_doc_input}    xpath://input[contains(@id,'value00')]
${document_periods_link}    xpath: //a[text()='Document Periods']
${lock_manager_share_task}   xpath: //input[@type='checkbox'][contains(@id,'sbc26')]/parent::span
${save_and_close_button}     xpath: //button[contains(@id,'Save')]

${search_button}     xpath: //button[text()="Search"]
${add_document_period}     xpath://h2[text()="Document Periods"]/following::img[@title="Add"][1]

${add_questionnaires_icon}     xpath://h2[text()="Questionnaires for the Period: "]/following::img[@title="Add"][1]

${questionnaires_role}     xpath://h2[text()="Questionnaires for the Period: "]/following::input[1]

${questionnaires_dropdown}     xpath:(//a[@title="Search: Questionnaire"])[1]

${document_period_table_row_count}   xpath://h2[text()="Document Periods"]/following::table[@summary="Document Periods"]

${questionnaires_table_row_count}   xpath://table[@summary="Questionnaires for the Period"]
