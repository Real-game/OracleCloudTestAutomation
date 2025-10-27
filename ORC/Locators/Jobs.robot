*** Variables ***
${input_search_jobs}  xpath://span/input[@placeholder='Search...']
${img_search}  xpath://a/img[@title='Search']
${searched_job}  xpath://div/a/span
${actions_drop_down}    xpath: //img[@title='Actions']/parent::a
${refer_a_candidate_option}  xpath: //td[text()[contains(.,'Refer a Candidate')]]
${title_input}      xpath: //input[contains(@id,'ttESel')]
${first_name_input}     xpath: //input[contains(@id,'fnEInp')]
${last_name_input}     xpath: //input[contains(@id,'lnEInp')]
${mobile_number_code}       xpath: //input[contains(@id,'i1is')]
${mobile_number_prefix}     xpath: //input[contains(@id,'mpaInp')]
${mobile_number_suffix}     xpath: //input[contains(@id,'mpnInp')]
${endorsement_check_box}    xpath: //input[contains(@id,'endChk')]
${email_input}              xpath: //input[contains(@id,'emaInp')]
${continue_button}          xpath: //button[@title='Continue']
${submit_button}            xpath: //div[contains(@class,'Submit')]
${refer_an_employee_option}  xpath: //td[text()[contains(.,'Refer an Employee')]]
${referral_tile}            xpath: //span[text()='Referrals']
${jobs_done_button}         xpath: //a[@title='Done']


