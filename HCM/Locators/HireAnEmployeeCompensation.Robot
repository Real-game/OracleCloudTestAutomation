*** Variables ***

${salaried_input}   xpath://label[text()='Salary Basis']/parent::td/following-sibling::td//a[contains(@title,'Search: Salary Basis')]
${salary_amount_input}  xpath: //label[text()='Salary Amount']/parent::td/following-sibling::td//input
${next_button_compensation}        xpath: //a[@accesskey='x']
${submit_button_compensation}      xpath: //span[text()='m']
${yes_pop_up_hire_submission}      xpath: //button[@accesskey='Y']
${ok_button_confirmation_popup}    xpath: //span[text()='K']
