*** Variables ***
${title_dropdown}  xpath://ul[@aria-label='Title']/li//span
#(//span[text()='Title']/following::oj-select-single//span)[2]
#//form-element-label[label[span[text()="Title"]]]/following-sibling::div//span/a
${list_temp}  xpath://ul/li/div
${list_temp_value}  xpath://ul/li/div//span//span
${list_value_find}    xpath: //*[contains(@id,"cx-select__modal")]//span
${first_name}  xpath://input[@name="firstName"]
${last_name}  xpath://input[@name="lastName"]
${email}  xpath://input[@name="retypeEmail"]
${cc_dropdown}  xpath://input[@id='country-codes-dropdownphoneNumber']
#//oj-select-single[@aria-label="Phone Number Country code"]
${cc_dropdown_input}    xpath: //*[@id="single-select-8|input"]
#(//oj-select-single[@aria-label="Phone Number Country code"]//input[@role="combobox"])[1]
${phoneno_input}  xpath://input[contains(@aria-label,"Phone Number")]
${country_dropdown}  xpath://input[@name="country"]
${country_search}  xpath://span[text()='Country']//following::input[contains(@id,"oj-searchselect-filter-single-select")][1]
${Address_input}  xpath://input[@name="addressLine1"]
${province_input}    xpath://span[text()="Province"]//following::input[1]
${province_search}    xpath:(//input[@aria-label="Province"])[1]
${postal_code_input}    xpath: //span[text()="Postal Code"]//following::input[1]
${postal_code_input_value}    xpath: //span[text()='Postal Code']//following::input[1]
${city_input}  xpath: //*[@name="city"]
${city_inp}    xpath: (//input[@aria-label="City"])[1]
${city_input1}  xpath://span[text()='City']//following::input[1]
${ques1}  xpath://div/form-element-label[label[span[text()="Were you previously employed by Metrolinx?"]]]/following-sibling::div//oj-select-single
${ques2}  xpath://div/form-element-label[label[span[contains(text(),"Are you a Family Member of a current Metrolinx Employee?")]]]//following-sibling::div//oj-select-single
${upload}  xpath://*[text()="Upload Resume"]
${e-sign_input}  xpath://input[@name="fullName"]
${submit}  xpath://button[@type='button' and contains(@class,'apply')]
${cross}  xpath://button[@title="Back to Job Details"]
${ques_temp}  xpath://oj-select-single[contains(@aria-label,"?")]
${sexual_orientation_temp}  xpath://span[contains(text(),"Sexual Orientation")]/following::span[contains(text(),"?")]
#${race_ethnicity_temp}  xpath: //span[contains(text(),"Race and Ethnicity")]/following::span[contains(text(),"?")]
${multiple_ques_temp}  xpath: //span[contains(text(),""]/..
${radio_ques1}  xpath://span[contains(text(),"Indigenous")]/ancestor::form-element-label/following-sibling::div//span[text()="?"]
${radio_gender}  xpath: //span[contains(text(),"The options identified")]/ancestor::form-element-label/following-sibling::div//span[text()="?"]
${person with disability}  xpath:(//span[contains(text(),"Persons with Disabilities")]/following::span[contains(text(),"?")])[1]
${sourcetype_dropdown}  xpath:(//span[text()='Please select one of the Source type:']/following::button)[1]
#(//*[@aria-label="Please select one of the Source type:"]//span/a)[1]

${workincanada_dropdown}  xpath:(//span[text()='Are you legally entitled to work in Canada?']/following::button)[1]
#(//oj-select-single[@aria-label="Are you legally entitled to work in Canada?"]//span/a)[1]

${covidques_dropdown}  xpath://div[@aria-label="Have you been fully vaccinated* against COVID-19? *per Metrolinx Policy, “Vaccinated” means “An individual who has received their second dose of a two-dose COVID-19 vaccine series or their first dose of a one-dose COVID-19 vaccine series that is listed for emergency use by the World Health Organization or approved by Health Canada. This definition may be amended from time to time in accordance with the direction of public health authorities.” All employees must be vaccinated under Metrolinx’s Mandatory COVID-19 Vaccination Policy. We are requesting this information from you at the beginning of the recruitment process as being fully vaccinated against COVID-19 is a condition of continuing through the recruitment process and will eventually be a condition of commencing employment."]//span/a

${criminaloffence_dropdown}  xpath:(//span[contains(text(),'Do you have a conviction for a criminal offence for which a pardon has not been granted?')]/following::button)[1]
#(//*[@aria-label="Do you have a conviction for a criminal offence for which a pardon has not been granted?"]//span/a)[1]

${familymember_dropdown}  xpath:(//span[contains(text(),'Are you a Family Member of a current Metrolinx Employee?')]/following::button)[1]
#(//*[@aria-label="Are you a Family Member of a current Metrolinx Employee? A Family Member is defined according to our Nepotism policy as any of the following: an individual’s Parent, Parent-in-law, Step-parent, Child, Child-in-law, Stepchild, Spouse, Sibling, Sibling-in-law, Half-sibling, Grandparent, Grandchild, Aunt, Uncle, Niece, Nephew or First Cousin."]//span/a)[1]

${previously_employee}   xpath:(//span[text()='Were you previously employed by Metrolinx?']/following::button)[1]
#(//*[@aria-label="Were you previously employed by Metrolinx?"]//span/a)[1]

${visa_yes}  xpath://form-element-label[label[span[contains(text(),"visa?")]]]/following-sibling::div//span[text()="Yes"]/..
${visa_no}  xpath://form-element-label[label[span[contains(text(),"visa?")]]]/following-sibling::div//span[text()="No"]/..
${previouslyemployed_dropdown}  xpath:(//span[contains(text(),'Were you previously employed by Metrolinx?')]/following::button)[1]
#(//*[@aria-label="Were you previously employed by Metrolinx?"]//span/a)[1]
${hybrid_work_dropdown}  (//*[contains(@aria-label,'what is the maximum number of days you are willing to go into the office')]//span/a)[1]
#//span[contains(text(),"Race and Ethnicity")]/ancestor::form-element-label/following-sibling::div//span[contains(text(),"South Asian")]
${external_error}  xpath: //*[contains(@class,'error')]
${provide_employee_number}  xpath: //span[text()="Please provide your five digit employee number."]//parent::label//parent::form-element-label/following-sibling::div/textarea[1]

${gender_identity_dropdown}    xpath:(//span[contains(text(),'Gender Identity')]/following::button)[1]
#//*[contains(text(),'Do you identify as:')]//following::div[1]
#(//oj-select-single[contains(@aria-label,"Do you identify as:")]//span/a)[1]

${sexual_orientation_dropdown}    xpath:(//span[contains(text(),'Sexual Orientation')]/following::button)[1]
#(//oj-select-single[contains(@aria-label,"Sexual Orientation")]//span/a)[1]

${person_with_disability_dropdown}    xpath:(//span[contains(text(),'Persons with Disabilities')]/following::button)[1]
#(//oj-select-single[contains(@aria-label,"Persons with Disabilities")]//span/a)[1]

${indigenous_person_dropdown}    xpath:(//span[contains(text(),'Indigenous Person')]/following::button)[1]
#(//oj-select-single[contains(@aria-label,"Indigenous Person")]//span/a)[1]

${race_ethnicity_dropdown}    xpath:(//span[contains(text(),'What racial')]/following::button)[1]
#(//oj-select-single[contains(@aria-label,"What racial")]//span/a)[1]