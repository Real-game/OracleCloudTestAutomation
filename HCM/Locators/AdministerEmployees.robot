*** Variables ***

${search_number}  xpath: //label[text()='Person Number']/following::input[1]
${search_button}  xpath: //button[text()='Search']

${pay_for_performance}  xpath: //span[text()='Plan']//following::a[text()='Pay for Performance']
${eligibility}  xpath: (//a[text()='Eligibility'])[1]
${eligibility_status_dropdown}  xpath: //a[contains(@id,'AP1:EligFlag')]
${eligibility_status}  xpath: //ul[contains(@id,'EligFlag')]//li[contains(@class,'x1l2')]

${save_and_close}    xpath: //span[text()="ave and Close"]
${yes_button}  xpath: //button[@accesskey='Y']