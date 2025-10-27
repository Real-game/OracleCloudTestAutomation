*** Variables ***

${href_job_name}  xpath:(//div[@class='xv5']//span[@class='xpd'])[1]
${href_business_title}  xpath:(//div[@class='xv5 xk7']//span[@class='xkg x2ra'])[1]
${href_department_name}  xpath:(//div[@class='xv5']//span[@class='xpd'])[2]
${href_grade}  xpath:(//div[@class='xv5']//span[@class='xpd'])[3]
${href_laction}  xpath:(//div[@class='xv5']//span[@class='xpd'])[4]
${href_position}  xpath:(//div[@class='xv5']//span[@class='xpd'])[5]
${href_bargaining_unit}  xpath:(//div[@class='xv5']//span[@class='xpd'])[6]
${href_manager_name}  xpath://div[@class='x3hh x1a']//span[@class='xkg xnd']
#${href_probation_end_date}  xpath://div[@class='xv5']//span[@class='x2b']
#${href_probation_period}  xpath:(//div[@class='xv5 xk7']//span[@class='xkg'])[3]
#${href_person_number}  xpath:(//div[@class='xk4 xk6 p_AFReadOnly']//div[@class='xv5 xk7'])[2]
#${href_projected_end_date}  xpath:(//div[@class='xk4 xk6 p_AFReadOnly']//div[@class='xv5 xk7'])[1]

${expand_employment_history}  xpath:(//img[@title='Expand'])[2]
${first_row_employment_history}  xpath:(//h2[text()='Employment History']//following::a[contains(@id,'onePse:hro1Lnk')])[1]

${assigment_section_header}  xpath: //h2[text()='Assignment']
${managers_section_header}  xpath: //h2[text()='Managers']
${additional_assigment_section_header}  xpath: //h2[text()='Additional Assignment Info']
${direct_reports_section_header}  xpath: //h2[text()='Direct Reports']
${employment_history_section_header}  xpath: //h2[text()='Employment History']

${back_button}  xpath: //a[@title='Done']