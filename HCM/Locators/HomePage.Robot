*** Variables ***
${catalog_link}    xpath://span[text()[contains(.,'Catalog')]]
${shared_folder_expand_icon}    xpath: //img[contains(@id,'shared')]
${custom_folder_expand_icon}    xpath: //img[contains(@id,'Custom_disclosure')]
${metrolinx_folder_expand_icon}    xpath: //img[contains(@id,'Metrolinx_disclosure')]
${reports_folder_expand_icon}    xpath: //img[contains(@id,'shared/Custom/Metrolinx/Reports_disclosure')]
${payroll_report_folder_expand_icon}    xpath: //img[contains(@id,'shared/Custom/Metrolinx/Reports/Payroll Reports_disclosure')]
${pay_rep_017_expand_icon}    xpath: //span[contains(@id,'017_MX')]
${mx_accrual_bank_report_open_link}    xpath://span[text()='MX_Accrual Banks Validation for BEE Report']/parent::td/parent::tr/following-sibling::tr//a[text()[contains(.,'Open')]]
${apply_button}                 xpath: //button[@title='Apply']
${apply_form}                   xpath: //iframe[contains(@id,'general')]

${icon_home}    xpath://a[@title="Home"]
${href_MyTeam}  id:groupNode_manager_resources
${href_My_Team_Icon}  xpath://div[@title='My Team']
${href_Hiring}  link:Hiring
${href_personal_information}  link:Personal Information
${href_my_client}   id:groupNode_workforce_management
${href_absences}   link:Absences
${href_person_management}  link:Person Management

${href_showmore}  link:Show More
${href_managepositions}  link:Manage Positions
${header}  xpath: //h1[text()="Manage Positions"]
${show_more}  xpath: //a[text()="Show More" and contains(@id,"workforce")]
${termination}  xpath: //h4[text()='Employment']//following::a[text()='Termination']

${profile_downarrow}    xpath://a[@title="Settings and Actions Menu"]
${href_setup_maintenance}    xpath://a[text()="Setup and Maintenance"]
${navigator}  xpath: //a[contains(@class,'TabletNavigatorIcon')]
${nvg_me}  xpath: //div[@title='Me']
${nvg_benefits}  xpath: //span[text()='Benefits']
${nvg_personal_info}  xpath: //span[text()='Personal Information']
${href_new_person}  link:New Person

${href_add_assignment}  link:Add Assignment
${href_change_assignment}  link:Change Assignment

${nvg_my_team}  xpath: //div[@title='My Team']
${nvg_my_team_option}  xpath: //a[@title='My Team']
${nvg_my_client_group}  xpath: //div[@title='My Client Groups']
${nvg_benefits_administration}  xpath: //a[text()='Benefits Administration']

${hire_an_employee_link}    link:Hire an Employee
${href_contact_info}  Xpath: //h4[text()='Employment']//following::a[contains(@target,'contact_information')]

${href_employment_info}  link:Employment Info
${href_termination}  link:Termination
${href_create_work_relationship}  link:Create Work Relationship

${nevigator_icon}  Xpath: //a[@title='Navigator']
${nevigator_tools}  Xpath: //div[@title='Tools']
${nevigator_tools_report_analytics}  Xpath: //a[@title='Reports and Analytics']

${seniority_dates}  xpath: //h4[text()='Employment']//following::a[text()='Seniority Dates']

${href_calculation_cards}  link:Calculation Cards

${href_contact_info}  link:Contact Info
${nvg_payroll}  xpath: //a[@title='Payroll']

${href_compensation}  link:Compensation
${performance_option}    link:Performance

${href_career_and_performance}  link:Career and Performance
${href_payroll}  xpath: //div[@title='Payroll']//a[text()='Payroll']
${href_enrollment}  xpath: //a[text()='Enrollment']
${href_pay}  xpath: //div[@title = "Pay"]

${href_me}  link:Me

${change_salary}  link: Change Salary

${href_me_pay}  link:Pay
${nvg_pay}  xpath: //span[text()='Pay']

${href_benefits_administration}  link:Benefits Administration
${enrollment_under_benefits_administration}  xpath: //a[text()="Enrollment"]

${tools}  xpath: //a[@id='groupNode_tools']

${href_tools}  link: Tools
${href_others}  link: Others

${add_a_contingent_employee_link}  xpath: //a[text()='Add a Contingent Employee']
${compensation_section}  xpath: //h4[text()='Compensation']
${talent_section}  xpath: //h4[text()='Talent']
${show_less}  xpath: //a[text()='Show Less']

${href_report_and_analytics}  xpath: //a[text()='Reports and Analytics']

${navigator_performance}  xpath: //span[text()='Performance']
${href_journeys}    link: Journeys

${href_current_jobs}  link:Current Jobs
${navigator_career_performance}  xpath: //span[text()='Career and Performance']
${mx_mand_vacc_rep}  xpath: //a[text()="MX Mandatory Vaccination Report"]

${nvg_career_and_performance}  xpath: //span[text()='Career and Performance']

${nvg_compensation}  xpath: //span[text()='Compensation']
${header_compensation}  xpath: //h1[text()='Compensation']

${employment_info_quick_actions}  xpath: //div[@id='show_more_groupNode_my_information']//a[text()='Employment Info']

${employee_reporting_to_manager}  xpath: (//span/div[@title='Employees']//td[@valign='top']/div/div/a)[1]
${payroll_header}  xpath: //div[@title='Payroll']//div[1]
${payroll_calcualtion}  xpath: //span[text()='Payroll Calculation']

${quick_action_person_link}  xpath: //a[text()='Person']
${quick_action_document_records}  xpath: //a[text()='Document Records']
${search_text_box}  xpath: //input[@placeholder='Search for a Person']