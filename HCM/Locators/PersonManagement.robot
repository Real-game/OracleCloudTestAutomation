*** Variables ***

${search_name}  xpath: //label[text()='Name']/following::input[1]
${search_number}  xpath: //label[text()='Person Number']/following::input[1]
${search_button}  xpath: //button[text()='Search']
#${result_name}  xpath: //span[text()='Active - Payroll Eligible']/preceding::span[text()='Manager, Bus Operations Planning']/preceding::a[@href='#'][2]
${result_name}  xpath: //span[text()='Active - Payroll Eligible']/preceding::a[@href='#'][2]
${result_name_active_payroll_eligible}  xpath: //span[text()='Active - Payroll Eligible']/preceding::a[@href='#'][2]
${result_row}  xpath: (//tr[@_afrrk='0']//td)[3]
${action_dropdown}  xpath: //img[@alt='Actions']
#${action_dropdown_value}  xpath: //div[contains(@class,'AFDetectExpansion')]//following::td[@class='xnv' or text()='Workforce Modeling']
${absence_option}  xpath: (//td[text()='Absences'])[2]
${absence_records}  xpath: (//td[text()='Absence Records'])[2]
${edit}  xpath: //span[text()="Edit"]
${update}  xpath: //td[text()='Update']
#${effective_date_input}  xpath: (//label[text()="Effective Start Date"]/following::input[1])[2]
${enter_date}  xpath: //input[@class='x2b' and @placeholder='dd-mmm-yyyy']
#${select_date}  xpath: //a[@class='xyx' and @title='Select Date']
${select_date}  xpath: //a[@title='Select Date']
#${month_input}  xpath: //select[@Class='x15k']
${month_input}  xpath: //label[text()='Select Month']/preceding-sibling::select
#${year_input}  xpath: //input[@Class='x105']
${year_input}  xpath: //label[text()='Select Year']/preceding-sibling::input
${next_month}  xpath: //a[@role='button' and @title='Next Month']
${previous_month}  xpath: //a[@role='button' and @title='Previous Month']
${date_value}  xpath: //tr/td[@class='x150' or @class='x14g p_AFSelected' ]
${action_name}  xpath: (//label[text()='Action'])[2]/following::input[1]
#${action_name_dropdown}  xpath: //a[contains(@id,'actionsName1')]
${action_name_dropdown}  xpath: //a[contains(@id,'actionsName1')]/preceding-sibling::input
#${action_name_value}  xpath: //ul[contains(@id,'actionsName1')]//following::li[@class='x1n6' or @class='x1n6 p_AFSelected']
${action_name_value}  xpath: //ul[contains(@id,'actionsName1')]//li
${action_reason}  xpath: (//label[text()='Action Reason'])[2]/following::input[1]
${action_reason_dropdown}  xpath: //a[contains(@id,'actionReason')]
${action_reason_value}  xpath: //ul[contains(@id,'actionReason')]//following::li[@class='x1n6' or @class='x1n6 p_AFSelected']
${ok_button}  xpath: //button[@accesskey='K']
${assignment_status}  xpath: (//input[@class='x2h'])[3]
${status_ok}  xpath: (//button[@accesskey='K'])[2]

${business_unit}  xpath: //label[text()='Business Unit']//following::span[1]
#${position}  xpath: (//input[@class='xpd'])[2]
${position}  xpath: //label[text()='Position']/preceding-sibling::input
${selected_value}  xpath: //ul[@role='listbox']//li[1]
${ok}  xpath: (//button[@accesskey='K'])
#${payroll}  xpath: //div[@class='x1ij']//a[text()='Payroll']
${payroll}  xpath: (//a[text()='Payroll'])[1]
${payroll_add}  xpath: //img[@title='Create']
${payroll_option}  xpath: //span[text()='Payroll']//following::input[1]
${salary_basics_dropdown}  xpath: //input[contains(@id,'icAsgLov')]//following::span[1]
${salary_basics}  xpath: //input[contains(@id,'icAsgLov')]
${select_salary_base}  xpath: //span[@class='x2o2']
${salary_amount}  xpath: //input[contains(@id,'itSA')]
${business_unit_review}  xpath: //label[text()='Business Unit']//following::span[contains(@id,'businessUnitId::content')]
#${position_review}  xpath: //tr[contains(@id,'panelLabelAndMessage10')]//td[@class='xv5 xk7']
${position_review}  xpath: //label[text()='Position']//following::td[1]
#${payroll_review}  xpath: //span[contains(@id,'selectOneChoice1')]//span[@class='xpd']
${payroll_review}  xpath: //table[@summary='Payroll Details']//span[contains(@id,'selectOneChoice1')]//span
#${salary_base_review}  xpath: //label[text()='Salary Basis']//following::span[@class='xpd']
${salary_base_review}  xpath: //label[text()='Salary Basis']//following::span[2]

${next_button}  xpath: //div[@title='Next']
${submit_button}  xpath: //a[@accesskey='m']
${yes_button}  xpath: //button[@accesskey='Y']

${close_button}  xpath: //button[@title='Close person management']//span[1]

${personal_information}  xpath: (//a[contains(@id,'showDetailItem1') and text()='Person Information'])[1]
${home_address_edit}  xpath: //a[contains(@id,'editAddressDropDown::popEl')]
${home_address_update}  xpath: //a[contains(@id,'editAddressDropDown::popEl')]//following::tr[contains(@id,'addIter:0:cmi1')]
${home_address_line1}  xpath: //label[text()='Address Line 1']//following::input[contains(@id,'inputText17')]
${home_address_line2}  xpath: //label[text()='Address Line 2']//following::input[contains(@id,'inputText18')]
${termination_date_label}  xpath: //label[text()='Termination Date']
${termination_date}  xpath: //label[text()='Termination Date']/following::td[@class='xv5 xk7'][1]
${done}  xpath: //button[@accesskey='o' and text()='D']
${correct}  xpath: //td[@class='xnw' and text()='Correct']
${click_ok}  xpath: (//button[@_afrpdo='ok'])[1]

${get_position}  xpath:(//label[text()="Position"]/following::span//span)[1]
${get_job}  xpath:(//label[text()="Job"]/following::span//span)[1]
${get_grade}  xpath:(//label[text()="Grade"]/following::span//span)[1]
${get_department}  xpath:(//label[text()="Department"]/following::span//span)[1]
${get_location}  xpath:(//label[text()="Location"]/following::span//span)[1]
${get_manager_name}  xpath://h2[text()="Managers"]/following::span[2]
${get_bargaining_unit}  xpath://label[text()="Bargaining Unit"]/following::span[1]

${recalculate_seniority}  xpath: //button[text()='Recalculate Seniority']
${length_of_service}  xpath: //label[text()='Length of Service']//parent::div//following-sibling::div

${biographical_info_edit}  xpath: //div[@title='Biographical Info']/following::img[1]
${country_of_birth}  xpath: //input[contains(@name,'countryNameId')]
${country_of_birth_dropdown_value}  xpath: //li[contains(@id,'su0')]
${region_of_birth}  xpath: //label[text()='Region of Birth']//parent::td//following-sibling::td//input
${town_of_birth}  xpath: //label[text()='Town of Birth']//parent::td//following-sibling::td//input
${blood_type}  xpath: //a[contains(@id,'soc2::drop')]
${blood_type_value}  xpath: //ul[contains(@id,'soc2::pop')]//li

${include_terminated_work_relationship}  xpath: //label[text()="Include terminated work relationships"]

${tasks_icon}   xpath://img[@title='Tasks']
${create_work_relationship_link}  xpath: //a[text()='Create Work Relationship']

${select_result_with_active_payroll}   xpath://tbody/tr/td/span[text()="Active - Payroll Eligible"]

${accruals_dropdown}   xpath://a[@title="Accruals"]
${accruals_dropdown_menu}  xpath: //div[contains(@id,"ScrollBox")]/table/tbody/tr[@role="menuitem"]
${input_date}   xpath://label[@title="Date through which you want to calculate accruals"]/following::input
${plan_balances_status}   xpath://h2[text()="Plan Balances"]/following::label[text()="Status"]/following::input[1]
${plan_balances_status_menu}  xpath: //div[@class='AFPopupMenuContent']/table/tbody/tr/td/ul/li
${click_accruals_go_arrow}   xpath:(//h2[text()="Plan Balances"]/following::td//a[@title="Go"])[1]

${accruals_dropdown}  xpath: //h2[text()='Plan Balances']//following::a[@title='Accruals']
${accruals_effective_date}  xpath: //input[contains(@id,'id11') and @placeholder='dd-mmm-yyyy']

${compensation_option}  xpath: (//td[text()='Compensation'])[2]
${personal_and_employment_option}  xpath: (//td[text()='Personal and Employment'])[2]

${document_records_option}  xpath: (//td[text()='Document Records'])[2]
${employment_option}  xpath: (//td[text()='Employment'])[2]
${talent_profile_option}  xpath: (//td[text()='Talent Profile'])[2]
${personal_identifier_ext_action_option}  xpath: (//td[text()='Person Identifiers for External Applications'])[2]
${work_relationship_option}  xpath: (//td[text()='Work Relationship'])[2]
${person_option}  xpath: (//td[text()='Person'])[2]
${edit_option}  xpath: //span[text()='Edit']

${include_terminate_checkbox}  xpath: //label[text()='Include terminated work relationships']//preceding-sibling::input[@type='checkbox']

${status_dropdown}  xpath: //label[text()='Status']//following::a[contains(@id,'AT2:_ATp:soc1')]
${status_go}  xpath: //a[contains(@id,'r3:0:AT2:_ATp:cil1') and @title='Go']

${scroll_plan_balances_table_view}  xpath: //h2[text()="Qualified Entitlements"]
${person_option}    xpath: (//td[text()='Person'])[2]
${vacation_elector_link}  xpath: //a[text()='Vacation Elector']
${vacation_elector_value}   xpath: //span[contains(@id,'VacationElector')][@title='Yes'][text()='Yes']

${absence_plan_name}  xpath: //h2[text()='Plan Balances']//following::a[contains(@id,'ATt2:0:cl2')]
${date_of_birth_value}  xpath: //label[text()='Date of Birth']//parent::td//following-sibling::td
${sin_number_value}  xpath: //h1[text()='National Identifiers']/following::span[contains(text(),'Social Insurance Number')]
${primary_mailing_value}  xpath: //label[text()='Primary Mailing']//parent::td//following-sibling::td//span/br[1]
${home_address_value}  xpath: //label[text()='Home Address']//parent::td//following-sibling::td//span/br[1]

${assignment_details_option}  xpath: (//a[text()='Assignment Details'])[1]
${assignment_status_value}  xpath: //label[text()='Assignment Status']//parent::td//following-sibling::td
${working_hours}  xpath: (//label[text()='Working Hours']//parent::td//following-sibling::td//span)[1]/span
${standard_working_hours}  xpath: //label[text()='Derived Standard Working Hours']//parent::td//following-sibling::td
${people_group}  xpath: (//label[text()='People Group']//parent::td//following-sibling::td//span)[1]/span
${assignment_category}  xpath: //label[text()='Assignment Category']//parent::td//following-sibling::td//span
${primary_flag}  xpath: //label[text()='Primary']//parent::td//following-sibling::td//span
${effective_as_of_date}  xpath: //input[@placeholder='dd-mmm-yyyy']
${extra_information}  xpath: (//a[text()='Extra Information'])[1]
${adjustment_dates}  xpath: //a[text()='Adjustment Dates']
${vacation_adjustment_date}  xpath: (//label[text()='Vacation Entitlement Adjustment Date']//parent::td//following-sibling::td//span)[2]
${person_employment}  xpath: //h4[text()='Employment']//following::a[text()='Person']
${home_address}  xpath: //label[text()='Home Address']//parent::td//following-sibling::td//span
${wanringYes}  xpath: (//div[text()='Warning'])[2]/following::button[text()='Yes']