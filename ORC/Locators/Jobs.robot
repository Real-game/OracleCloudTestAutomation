*** Variables ***
${input_search_jobs}  xpath://input[contains(@placeholder,'Search')]
${img_search}  xpath://button[contains(@aria-label,'Search')]
${searched_job}  xpath://div/a/span
${actions_drop_down}    xpath: (//button[contains(@aria-label,'More Actions')])[1]
#//span[text()='Actions']
${refer_a_candidate_option}  xpath: //span[contains(text(),'Refer Candidate')]
#//td[text()[contains(.,'Refer a Candidate')]]
#${title_input}      xpath: //input[contains(@id,'ttESel')]
#${first_name_input}     xpath: //input[contains(@id,'fnEInp')]
#${last_name_input}     xpath: //input[contains(@id,'lnEInp')]
#${mobile_number_code}       xpath: //input[contains(@id,'i1is')]
#${mobile_number_prefix}     xpath: //input[contains(@id,'mpaInp')]
#${mobile_number_suffix}     xpath: //input[contains(@id,'mpnInp')]
#${endorsement_check_box}    xpath: //input[contains(@id,'endChk')]
#${email_input}              xpath: //input[contains(@id,'emaInp')]
#${continue_button}          xpath: //button[@title='Continue']
#${submit_button}            xpath: //div[contains(@class,'Submit')]
${refer_an_employee_option}  xpath: //span[contains(text(),'Refer Employee')]
#//td[text()[contains(.,'Refer an Employee')]]
${referral_tile}            xpath: //span[contains(text(),'Referred Candidates')]
${jobs_done_button}         xpath: //button[@aria-label="Go back"]


