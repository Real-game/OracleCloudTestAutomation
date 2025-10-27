*** Variables ***
${switch_admin_icon}   xpath: //span[@title='Switch to Admin']//oj-option[@value='admin']
${mx_company_link}     xpath: (//a[@data-title='MX Company'])[1]
${company_sponsored_shell_link}   xpath: (//a[@title='Company Sponsored Shells'])[1]
${mx_properties_link}   xpath: (//a[@title='MX Properties'])[1]
${find_link}            xpath: (//span[@id='ToolBarFindTool_td'])[1]
${property_name_input}   xpath: //input[@name='uPropertyName'][@type='text']
${property_search_button}   xpath: //input[@id='findview_search']
${copy_link}    xpath: //span[@id='IconCopyTool_td']
${check_box_list}   xpath: //input[@type='checkbox'][@value!='usergroup']
${mx_property_template}  xpath: //nobr[text()='MX Property Template']
${ok_button}    xpath: //input[@value='OK']

#landing page
${home_icon}    xpath: //a[@aria-label='Home']