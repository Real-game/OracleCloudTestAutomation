*** Variables ***
${title_input}      xpath: (//input[contains(@id,'lookupNameField')])[1]
#//input[contains(@id,'ttESel')]
${title_input_value}    xpath: //ul/li/div//span
${first_name_input}    xpath: //oj-input-text//input[contains(@aria-label,'Legal First Name') and @aria-required="true"]
#//input[contains(@id,'fnEInp')]
${last_name_input}     xpath: //oj-input-text//input[contains(@aria-label,'Legal Last Name') and @aria-required="true"]
#//input[contains(@id,'lnEInp')]
${mobile_code}       xpath: (//input[contains(@id,'country')])[1]
#//input[contains(@id,'i1is')]
${mobile_prefix}     xpath: //span[text()='Area Code']//following::input[1]
#//input[contains(@id,'mpaInp')]
${mobile_suffix}     xpath: //span[text()='Phone Number']//following::input[contains(@id,'input') and @aria-required="true"][1]
#//input[contains(@id,'mpnInp')]
${endorsement_chk_box_label}    xpath: //label[contains(@id,'endChk')]
${email_input}              xpath: //input[contains(@id,'email')]
#//input[contains(@id,'emaInp')]
${continue_button}          xpath://*[text()='Continue']
#//button[@title='Continue']
${submit_button}            xpath: (//span[text()='Submit'])[1]
#//span[text()='Sub']
${country_code_suggestion_result}   xpath: //div[contains(@id,'suggestion')]//tr[1]


