*** Variables ***

${roles_section}    xpath: //h2[text()[contains(.,'Roles')]]
${add_role}         xpath: //span[text()[contains(.,'Add')]]
${role_name_drop_down}    xpath: //a[contains(@id,'RolSrh::btn')]
${role_name_text_box}  xpath: //input[contains(@id,'RolSrh')]
${search_result}  xpath: //tr[contains(@class,'p_AFSelected x1ub')]
${start_date}   xpath: //input[contains(@id,'stDt')]
${end_date}     xpath: //input[contains(@id,'edDt')]
${delegated_text_box}   xpath: //input[contains(@id,'PrxSrh')]
${role_list}        xpath: //table[contains(@id,'roleRgn')]//span[contains(@class,'AFStr')]
${save_button}      xpath: //div[@title='Save']//a
${no_results_found}     xpath: //div[text()[contains(.,'No results found')]]
${role_delegations_section}   xpath: //h2[text()[contains(.,'Role Delegations')]]


