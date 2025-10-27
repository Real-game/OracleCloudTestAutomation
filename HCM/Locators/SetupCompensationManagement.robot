*** Variables ***
${workforce_structure}    xpath:(//table[@class="x1a"]/tbody/tr/td[2])[16]
${workforce_structure_show_task}    xpath://select[@class='x2h']
${workforce_structure_manage_positions}    xpath://a[contains(.,"Manage Positions")]
${search_input_box}    xpath://label[text()='Search Tasks']/following::input[1]
${search_icon}    xpath://img[@title='Search']