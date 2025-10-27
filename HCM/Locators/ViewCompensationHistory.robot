*** Variables ***

${overall_salary}   xpath: //a[text()='Overall Salary ']
${compensation_details}  xpath: //h1[text()='Salary History']//following::img[@title='Compensation Details'][1]
${salary_details_header}  xpath: //h1[text()='Salary Details']
${salary_end_date}  xpath: (//label[text()='End Date']//parent::td//following-sibling::td//span//span)[1]
${salary_basis_value}  xpath: //label[text()='Salary Basis']//parent::td//following-sibling::td//span/span
${salary_effective_end_date}  xpath: //label[text()='Effective End Date']//parent::td//following-sibling::td
${salary_end_date_value}  xpath: //label[text()='End Date']//parent::td//following-sibling::td//span
${overall_salary_value}   xpath: (//a[contains(text(),'Overall Salary')]/parent::span/parent::div/parent::td/following-sibling::td)[1]/span

