*** Variables ***

${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${continue_button}  xpath: //a[@role='button' and @accesskey='u']
${transfer_start_date}  xpath: //input[@placeholder='dd-mmm-yyyy' and contains(@id,'ipDt')]
${transfer_reason}  xpath: //a[contains(@id,'aridis')]
${continue}  xpath://button[@title="Continue"]

${select_position}  xpath://input[@placeholder='Select a value' and contains(@id,'pidSrh')]
${select_recent_search_result}  xpath://table/tr[2]
${yes_button}  xpath://a[@role='button' and @accesskey='Y']

${submit_button}  xpath://a[@role='button' and @accesskey='m']
${href_my_client}   id:groupNode_workforce_management