*** Variables ***
${shared_folder_expand_icon}    xpath: //img[contains(@id,'shared')]
${custom_folder_expand_icon}    xpath: //img[contains(@id,'Custom_disclosure')]
${metrolinx_folder_expand_icon}    xpath: //img[contains(@id,'Metrolinx_disclosure')]
${reports_folder_expand_icon}    xpath: //img[contains(@id,'shared/Custom/Metrolinx/Reports_disclosure')]
${payroll_report_folder_expand_icon}    xpath: //img[contains(@id,'shared/Custom/Metrolinx/Reports/Payroll Reports_disclosure')]
${absence_report_folder_expand_icon}    xpath: //img[contains(@id,'shared/Custom/Metrolinx/Reports/Absence Reports_disclosure')]
${pay_rep_017_expand_icon}    xpath: //span[contains(@id,'017_MX')]
${absence_rep_125_folder}    xpath: //span[contains(@id,'ABS_REP-125')]
${mx_accrual_bank_report_open_link}    xpath://span[text()='MX_Accrual Banks Validation for BEE Report']/parent::td/parent::tr/following-sibling::tr//a[text()[contains(.,'Open')]]
${mx_delta_absence_report_open_link}    xpath://span[text()='ABS_REP-125 MX_Delta Absence Report']/parent::td/parent::tr/following-sibling::tr//a[text()[contains(.,'Open')]]
${apply_form}                   xpath: //iframe[contains(@id,'general')]
${bank_validation_frame}        xpath: //iframe[contains(@id,'xdo:docframe0')]
${general_object_editor_frame}        xpath: //iframe[contains(@id,'generalObjectEditor')]
${withdraw_frame}        xpath: //iframe[contains(@title,'Withdrawal')]
${report_confirmation_message}        xpath: //span[@id='message']
${apply_button}                 xpath: //button[@title='Apply']


${hr_report_folder_expand_icon}    xpath: //img[contains(@id,'shared/Custom/Metrolinx/Reports/HR Reports_disclosure')]
${hr_rep_007_mx_expand_icon}    xpath://span[contains(@id,'HR-REP-007 - MX')]
${mx_position_occupancy_and_vacancy_open_link}    xpath://span[text()='MX_Position_Occupancy_and_Vacancy']/parent::td/parent::tr/following-sibling::tr//a[text()[contains(.,'Open')]]
${division_dropdown}    xpath:(//span[@class='mchoiceboxDropdownArrow'])[1]
${payq_rep_049_payroll_expand_icon}    xpath://span[contains(@id,'PAY-REP-049_Payroll')]
${payq_rep_024_payroll_expand_icon}    xpath://span[contains(@id,'PAY-REP-024_Payroll')]
${retro_flow_name_dropdown}    xpath: (//span[@class="mchoiceboxDropdownArrow"])[1]

${search_link}    xpath: (//span[text()="Search ..."])[1]
${search_box}    xpath: //input[@title='Name']
${search_button}    xpath: //button[contains(@id,"search")]
${ok_button}    xpath: //button[text()="OK"]
${ok_button2}    xpath: //input[@value="OK"]

${interfaces_folder_expand_icon}    xpath: //img[contains(@id,'Interfaces_disclosure')]
${hr_interfaces_folder_expand_icon}    xpath: //img[contains(@id,'HR Interfaces_disclosure')]
${benefits_interfaces_folder_expand_icon}    xpath: //img[contains(@id,'Benefits Interfaces_disclosure')]
${lrn_int_01_folder}    xpath: //span[contains(@id,'LRN-INT-01')]
${lrn_int_02_folder}    xpath: //span[contains(@id,'LRN-INT-02')]
${p_last_run_date_input}    xpath: //input[@id="_paramsP_LAST_RUN_DATE"]
${ben_int_01_Manulife_folder}    xpath: //span[contains(@id,'BEN-INT-01_Manulife All Benefits Interface')]

${hr_rep_108_hdl_loader_report_expand_icon}    xpath://span[contains(@id,'HR-REP-108 HDL Loader')]
${effective_end_date_input}    xpath: //input[@aria-label='Effective End Date']

${shared_folder}  xpath: //span[@title='Shared Folders']
${custom_folder_expand}  xpath: //span[text()='Custom']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
${metrolinx_folder_expand}  xpath: //span[text()='Metrolinx']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
${reports_expand}  xpath: //span[text()='Reports']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
${hr_reports_expand}  xpath: //span[text()='HR Reports']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
${payroll_reports_expand}  xpath: //span[text()='Payroll Reports']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
${open_link}  xpath: //a[text()='Open']
${edit_link}  xpath: //a[text()='Edit']
${more_link}  xpath: //a[text()='Edit']//parent::td//following-sibling::td/a[text()='More']

${hr_rep_134_mx_departure_expand_icon}    xpath: //span[contains(@id,'HR-REP-134_MX Departures')]
${termination_start_date_input}    xpath: //input[@aria-label='Termination From Date']
${termination_end_date_input}    xpath: //input[@aria-label='Termination To Date']

${absence_reports_expand}  xpath: //span[text()='Absence Reports']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']

${report_from_date}  xpath: //input[@id='_paramsFrom_Date']
${report_to_date}  xpath: //input[@id='_paramsTo_Date']
${report_apply}  xpath: //button[@title='Apply']
${reports_frame}  xpath: //iframe[contains(@id,'generalObjectEditor')]

${excel_menu_frame}  xpath: //iframe[@id='_xdoFMenu1_ifr']
${view_report}  xpath: //a[@title='View Report']
${excel_report}  xpath: //div[@id='_xdoFMenu1']//following-sibling::div[contains(text(),'Excel')]

${create_button}  xpath: //span[text()='Create']
${compensation_Salary_details_real_time}  xpath: //div[contains(@class,'floatingWindow')]//a[text()='Compensation - Salary Details Real Time']
${analysis_subject_area_list}  xpath: //div[contains(@class,'floatingWindow')]
${untitled_report}  xpath: //span[@id='idHeaderTitleCell'][text()='Untitled']

${grade_ladder_folder}  xpath: //span[@title='Grade Ladder']/preceding-sibling::img
${grade_ladder_column}  xpath: //span[@title='Grade Ladder - Grade Ladder']//span[text()='Grade Ladder']
${grade_ladder_column_selected_Columns}  xpath: //table[@class='SelectColumns']//table//td/span[text()='Grade Ladder']
${results_tab}  xpath: //div[text()='Results']
${grade_ladder_column_value_list}  xpath: //a[text()='Grade Ladder']/ancestor::div[1]//following-sibling::div//tbody/tr//a
${results_tab_compound_layout_element}  xpath: //div[text()='Compound Layout']

${save_output_checkbox}  xpath://input[@aria-labelledby="outputSaveOutput"]
${run_now_radio_button}  xpath://label[text()="Run Now"]/following::input[1]

${schedule_report_job_submit_button}  xpath://button[@name="submitButton"]

${report_job_name}  xpath://label[text()="Report Job Name"]/following::input[1]

${terminated_employee_report_start_date}  xpath://span[text()="Between "]/following::input[1]
${terminated_employee_report_end_date}  xpath://span[text()="Between "]/following::input[2]

${person_number_input}  xpath: //input[contains(@id,'PERSON_NUM')]
${text_format}  xpath: //pre[contains(@style,'word')][text()]
${iframe_window}  xpath: //iframe[@title='Manulife All Benefits Layout']

${analytics_home}  xpath: //span[text()="Home"]
${analytics_status_refresh_button}  xpath://a[@title="Refresh"]

${report_pay_period_052}  xpath: (//span[text()='Pay Period']//ancestor::td//following-sibling::td//input)[1]
${report_pay_period_search_052}  xpath: //div[contains(@id,'paramsP_END_DATE_div_b')]//span[contains(text(),'Search')]
${report_pay_period_input_052}  xpath: //input[contains(@id,'paramsP_END_DATE_div_input_searchDialog_input')]
${report_pay_period_input_search_052}  xpath: //button[contains(text(),'Search')]

${report_pay_period}  xpath: //*[@id="xdo:xdo:_paramsP_PERIOD_NAME_div_input"]
${report_pay_period_search}  xpath: //*[@id="xdo:xdo:_paramsP_PERIOD_NAME_div_s"]/span/span[1]
${report_pay_period_Iframe}  xpath: //div[contains(@ifrid,'xdo:xdo:_paramsP_END_DATE_div_input_searchDialog_xdoFDIframe')]//following-sibling::iframe
${report_pay_period_input}  xpath: //input[contains(@id,'PERIOD_NAME_div_input_searchDialog_input')]
${report_pay_period_input_search}  xpath: //button[contains(@id,'To_div_input_searchDialog_button')]
#${report_pay_period_input_search_result}  xpath: //div[contains(@id,'paramsP_END_DATE_div_input_searchDialog_searchResults')]/div[contains(text(),'12 2023 Biweekly')]
${report_pay_period_input_search_result_ok}  xpath: //button[text()='OK']

${report_layout}  xpath: //select[@aria-labelledby="outputLayout"]
${report_layout_excel}  xpath: //select[@aria-labelledby="outputLayout"]/option[text()='Variance by Value - Excel']
${notification_tab}  xpath: //div[@id="tab_notification"]/div[1]/div[8]/a
${notificacation_mail}  xpath: //input[@aria-labelledby="labelNotifyByEmail"]
${email_notification}  xpath: //input[@id="notify_to"]

${payroll_reports_expand}  xpath: //span[text()='Payroll Reports']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
${save_Output_tab}  xpath:  //div[@id="tab_notification"]/div[1]/div[4]/a
${layout_dropdown}  xpath:  //select[@aria-labelledby='outputFormat']
${excel_format}  xpath:  //select[@aria-labelledby="outputFormat"]/option[text()='Excel']
${report_format_excel}  xpath:  //select[@aria-labelledby="outputFormat"]/option[contains(text(),'Excel')]
${report_format}  xpath:  //select[@aria-labelledby='outputFormat']
#//select[@aria-labelledby="outputFormat"]/option[2]


#${pay_period_from}  xpath: (//span[text()='Pay Period From']//ancestor::td//following-sibling::td//input)[1]
${pay_period_from}  xpath:  //td//div[@id="xdo:_paramsPay_Period_From_div"]
${Searche_period}  xpath:  //a[@id="xdo:xdo:_paramsPay_Period_To_div_s"]//span[contains(text(),'Search')]
${pay_period_to}  xpath:  (//span[text()='Pay Period To']//ancestor::td//following-sibling::td//input)[1]
${report_pay_period_search_from}  xpath:  //*[@id="xdo:xdo:_paramsPay_Period_From_div_s"]/span/span[1]
${report_pay_period_input_from_tab}   xpath:  //input[contains(@id,'Pay_Period_From_div_input_searchDialog_input')]
${report_pay_period_input_search_button}  xpath:  //button[contains(@id,"Period_From_div_input_searchDialog_button")]
${report_pay_period_search_to}  xpath:  //a[@id="xdo:xdo:_paramsPay_Period_To_div_s"]//span[contains(text(),'Search')]
${report_pay_period_input_to}  xpath:  //input[contains(@id,'Pay_Period_To_div_input_searchDialog_input')]
${report_pay_period_input_from}  xpath:  //input[contains(@id,'Period_From_div_input_searchDialog_input')]

${report_pay_period_to_input_search_result_ok}  xpath:  //button[text()='OK']//following::button[3]

${arrear_report_pay_period}  xpath:  //input[contains(@id,'PERIOD_NAME_div_input')]
${arrear_report_pay_period_search}  xpath:  //a[contains(@id,'P_PERIOD_NAME_div_s')]//span[contains(text(),'Search')]
${arrear_report_pay_period_input}  xpath:  //input[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_input')]
${arrear_report_pay_period_input_search}  xpath:  //button[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_button')]

${balance_report_pay_period}  xpath:  //input[contains(@id,'PERIOD_NAME_div_input')]
${balance_report_pay_period_search}  xpath:  //a[contains(@id,'P_PERIOD_NAME_div_s')]//span[contains(text(),'Search')]
${balance_report_pay_period_input}  xpath:  //input[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_input')]
${balance_report_pay_period_input_search}  xpath:  //button[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_button')]

${hr_dr_report_pay_period}  xpath:  //input[contains(@id,'PERIOD_NAME_div_input')]
${hr_dr_report_pay_period_search}  xpath:  //a[contains(@id,'P_PERIOD_NAME_div_s')]//span[contains(text(),'Search')]
${hr_dr_report_pay_period_input}  xpath:  //input[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_input')]
${hr_dr_report_pay_period_input_search}  xpath:  //button[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_button')]
${hr_dr_report_remove_all}  xpath:  //img[contains(@id,'PERIOD_NAME_div_input_searchDialog_removeAllImg')]
${hr_dr_report_move}  xpath:  //img[contains(@id,'P_PERIOD_NAME_div_input_searchDialog_moveImg')]

${hr_report_pay_period_search}  xpath:  //a[contains(@id,'PERIOD_NAME_div_s')]//span[contains(text(),'Search')]
${hr_report_pay_period_input}  xpath:  //input[contains(@id,'PAY_PERIOD_NAME_div_input_searchDialog_input')]
${hr_report_pay_period_input_search}  xpath:  //button[contains(@id,'PERIOD_NAME_div_input_searchDialog_button')]


${report_pay_period_register}  xpath:  //input[contains(@id,'PERIOD_ID_div_input')]
${report_pay_period_search_register}  xpath:  //a[contains(@id,'P_TIME_PERIOD_ID_div_s')]//span[contains(text(),'Search')]
${report_pay_period_input_register}  xpath:  //input[contains(@id,'ID_div_input_searchDialog_input')]
${report_pay_period_input_register_search}  xpath:  //button[contains(@id,'div_input_searchDialog_button')]
