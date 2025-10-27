*** Variables ***

${salary_amount}   xpath: //label[text()='Salary']/parent::div/following-sibling::div//span/span
${annual_salary_amount}   xpath: //label[text()='Annual Salary']/parent::div/following-sibling::div//span/span
${show_prior_salary}    link: Show Prior Salary
${prior_salary_list}    xpath: //a[@title='Hide Prior Salary']/following-sibling::div//a


