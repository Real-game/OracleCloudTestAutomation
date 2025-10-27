*** Variables ***

${cre_master_log_link}   xpath: //li[@aria-label='CRE Master Log']
${board_orders_link}     xpath: //span[text()='Board Orders']
${property_tax_invoice_link}     xpath: //span[text()='Property Tax Invoices']

${new_tab_button}   xpath: //button[contains(@aria-labelledby,'openTabsBtn')]
${search_workspace_field}   xpath: //input[@aria-label='Search']
${cre_portfolio_mgmt}   xpath: //span[text()[contains(.,'CRE Portfolio')]]
${cre_portfolio_mgmt2}   xpath: (//span[text()[contains(.,'CRE Portfolio')]])[2]
${cre_portfolio_mgmt_first_index}   xpath: (//span[text()[contains(.,'CRE Portfolio')]])[1]
${property_contracts_tab}   xpath: //a[@title="CRE Portfolio Mgmt."]//parent::div//following-sibling::ul//span[text()='Property Contracts']
${property_contracts_header}   xpath: //h1[text()='Property Contracts']


${owned_properties_link}   xpath: (//span[text()='Owned Properties'])[1]
${owned_properties_header}   xpath: //h1[text()='Owned Properties']
${tasks_header}   xpath: //h1[text()='Tasks']
${contracts_receivables_header}   xpath: //h1[text()='Contract Receivables']

${lease_actions_link}   xpath: (//span[text()='Lease Actions'])[1]

${m_x_company_tab}   xpath: //a//span[text()='MX Company']
${m_x_company_section}   xpath: //div/span[text()='MX Company']
${reports_section}   xpath: //li[@aria-label='Reports' and contains(@class,'collapse')]
${user_defined_link}   xpath: //span[text()='User-Defined']
${user_defined_header}   xpath: //h1[text()='User-Defined Reports']
${gl_codes_section}   xpath: //li//span[text()='GL Codes']
${gl_codes_submenu_link}   xpath: //li/a/span[text()='GL Codes']
${cost_centers_submenu_link}   xpath: //li/a/span[text()='Cost Centers']
${account_submenu_link}   xpath: //li/a/span[text()='Account']
${location_submenu_link}   xpath: //li/a/span[text()='Location']
${location_submenu_link}   xpath: //li/a/span[text()='Location']
${company_logs_section}   xpath: //li//span[text()='Company Logs']
${vendors_submenu_link}   xpath: //li/a/span[text()='Vendors']

${mx_company_link_home_page}      xpath: (//oj-popup//a[text()='MX Company'])[1]
${company_logs_link}    xpath: (//span[text()='Company Logs'])[2]
${customers_link}       xpath: (//span[text()='Customers'])[1]
${customers_sites_link}     xpath: (//span[text()='Customer+Site'])[1]

${cre_cost_management_link}     xpath: (//li//span[text()='CRE Cost Mgmt.'])
${cre_cost_management_link2}  xpath: (//li//span[text()='CRE Cost Mgmt.'])[2]
${contract_payable_sub_menu_link}    xpath: (//a[@title='Contract Payables'])[2]

${mx_cre_bu_link}           xpath: (//a[@aria-label='MX CRE BU'])[1]
${mx_cre_bu_property_shell_header}   xpath: //span[text()='MX CRE BU - Home']
${owned_properties_bu_link}     xpath: //span[text()='Owned Properties BU']/parent::a
${property_contracts_bu_link}     xpath: //span[text()='Property Contracts BU']

${cre_portfolio_mgmt_list}   xpath: (//span[text()='CRE Portfolio Mgmt.'])
${cre_portfolio_mgmt_expanded}   xpath: //li[contains(@class,'expanded')][@aria-label='CRE Portfolio Mgmt.']

${contract_receivable_sub_menu_link}    xpath: //a[@title="CRE Cost Mgmt."]//parent::div//following-sibling::ul//span[text()='Contract Receivables']

${my_dashboard_link}    xpath: (//span[contains(@class,'draganddrop')])
${details_link}         xpath: //a[text()='Details']
${assessment_roll_#}    xpath: //textarea[contains(@id,'assess_roll')]

${save_details_button}   xpath: //span[contains(@id,'detailsSaveButton')]
${dashboard_iframe}      xpath: //iframe[contains(@src,'/user/home/')]
${cre_portfolio_mgmt_collapsed}  xpath: //li[@aria-label='CRE Portfolio Mgmt.']//a[@aria-expanded="false"]

${CRE_tab}	xpath: //a[contains(@title,'CRE Master Log') and @aria-expanded='false']
${Property_tab}  xpath:	//a[contains(@title,'Property Contracts')]

${Receivables_tab}  xpath: //a[contains(@title,'Contract Receivables')]
