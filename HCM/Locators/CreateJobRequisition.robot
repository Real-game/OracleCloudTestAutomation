*** Variables ***
${use_dropdown}    xpath://label[text()="Use"]/following::input[1]

${business_unit_dropdown}    xpath:(//label[text()="Business Unit"]/following::input)[1]

${Position_input_box}    xpath:(//label[text()="Position"]/following::input)[1]
${select_recent_search_result}  xpath://table/tr[2]

${continue_button}    xpath://button[@title="Continue"]

${business_justification_dropdown}    xpath:(//label[text()="Business Justification"]/following::input)[1]

${recruiting_type_dropdown}    xpath:(//label[text()="Recruiting Type"]/following::input)[1]

${orgnization_dropdown}    xpath:(//label[text()="Organization"]/following::input)[1]

${primary_location_dropdown}    xpath:(//label[text()="Primary Location"]/following::input)[1]

${save_and_close_button}    xpath://a[@accesskey="S"]

${requisition_confirmation_message}  xpath: //div/div/p