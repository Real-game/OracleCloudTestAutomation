*** Variables ***

${href_showmore}  link:Show More
${href_skills_and_qualification}  link:Skills and Qualifications
${href_career_evelopment}  link:Career Development
${href_performance}  link:Performance
${href_feedback}  link:Feedback
${href_document_records}  link:Document Records
${href_employment_info}  link:Employment Info
${href_compensation}  link:Compensation

${skill_n_qualification}  xpath: //div[text()='Skills and Qualifications']
${attachment_dropdown}  xpath: //h2[text()='Attachments']//following::img[contains(@id,'Att1Pse')]
${edit_option}  xpath: //span[text()='Edit']
${Attach_img}   xpath: //span[text()='Drag files here or click to add attachment']/parent::a
${Attach_file}   xpath: //td[text()='Add File']
${save_btn}   xpath://div/a/span/span[text()="S"]
${compensation}  xpath: //div[text()='Compensation']
${performance}  xpath: //div[text()='Performance']
${current_salary}  xpath: //label[text()='Salary']//parent::div//following-sibling::div

${search_text_box_my_team}  xpath: //input[@placeholder='Search Person']
${search_button}  xpath: //a[@title = 'Search']

${current_salary_value}  xpath: //label[text()='Salary']/parent::div/following-sibling::div//span/span
${annual_salary_value}   xpath: //label[text()='Annual Salary']/parent::div/following-sibling::div//span/span