*** Variables ***

${show_filter_link}  xpath://span[text()='Show Filters']/parent::a
${legislative_drop_down}  xpath: //td[@title='Legislative Data Group']/parent::tr/parent::tbody/parent::table/parent::h3/following-sibling::div[1]//input
${flow_pattern_drop_down}  xpath: (//td[@title='Flow Pattern']/parent::tr//ancestor::h3/following-sibling::div//a)[1]
${flow_name_search_icon}   xpath: //a[@title='Search']
${view_more_items_link}    xpath: //a[text()='Load More Items']

${legislative_data_input}  xpath: //td[@title='Legislative Data Group']//following::input[contains(@id,'hf01Sisj_id_1')]
${select_value}  xpath: //table/tr[2]
${flow_pattern_input}  xpath: //td[@title='Flow Pattern']//following::input[contains(@id,'hf01Sisj_id_2')]

${actions_button}  xpath: //button[text()='Actions']
${rollback_all}  xpath: //td[text()='Roll Back All']
${payroll_checklist_confirmation_ok}  xpath: //a[@accesskey = "K"]