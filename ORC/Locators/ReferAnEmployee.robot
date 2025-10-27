*** Variables ***
${employee_input}      xpath: //input[contains(@id,"employee-name|input")]
#//input[contains(@id,'epiSrh')]
${search_result}    xpath: //tr/td//span[contains(@class,'highlighter')]
#//tr[contains(@class,'Selected')]
${textarea_input}     xpath: //textarea[contains(@aria-label,'Add a private message for the candidate')]
${endorsement_chk_box}    xpath: //div[contains(@class,'RatingGauge')][4]
#${continue_button}          xpath: //button[@title='Continue']
${submit_button}            xpath: (//span[text()='Submit'])[1]


