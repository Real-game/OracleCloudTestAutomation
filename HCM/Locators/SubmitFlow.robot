*** Variables ***

${legislative_data_dropdown_input}  xpath: //label[text()='Legislative Data Group']//following::input[contains(@id,'ldgSrh')]
${legislative_data_dropdown_select}  xpath: //table/tr
${flow_pattern_textinput}  xpath: //input[contains(@id,'hf03Inp')]
${flow_name_search_icon}   xpath: //a[@title='Search']

${payroll_flow_input}  xpath: //label[text()='Payroll Flow']//following::input[contains(@id,'id1_Inp')]

${payroll_process_input}  xpath: //label[text()='Payroll Process']//following::input[contains(@id,'FsdSis:VarSrh')]
${payroll_process_combo_select}  xpath: //label[text()='Payroll Process']//following::tr[contains(@class,'x1sd')]

${submit_option}  xpath: //a[@accesskey='m']