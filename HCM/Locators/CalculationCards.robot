*** Variables ***
${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${select_recent_search_result}  xpath://table/tr[2]

${tax_credit_information_link}  link:Tax Credit Information

${expand_associations}  xpath: (//img[@title='Expand'])[2]
${edit_associations}  xpath: (//img[@title='Edit'])[1]
${change_start_date}  xpath: //label[text()='When does this change start?']/following::input[1]
${add_associations_details}  xpath: //span[text()='Add']
${assignment_dropdown}  xpath: (//label[text()='Assignment']/following::a)[1]
${ok_button}  xpath: //a[@accesskey='K' and @role='button']
${save_and_close}  xpath: //a[@accesskey='S' and @role='button']