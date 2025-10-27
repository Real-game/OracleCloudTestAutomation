*** Variables ***
${title_dropdown}  xpath://form-element-label[label[span[text()="Title"]]]/following-sibling::div//span/a
${list_temp}  xpath://ul/li/div
${first_name}  xpath://input[@name="firstName"]
${last_name}  xpath://input[@name="lastName"]
${email}  xpath://input[@name="retypeEmail"]
${cc_dropdown}  xpath://div[@aria-label="Phone Number Country code"]
${phoneno_input}  xpath://input[contains(@aria-label,"Phone Number")]
${country_dropdown}  xpath://oj-select-one[@name="country"]//span/a
${country_search}  xpath://input[@title="Search field"]
${Address_input}  xpath://input[@name="addressLine1"]
${province_input}    xpath://div[@aria-label="Province"]
${province_search}    xpath:(//input[@title="Search field"])[1]
${postal_code_input}    xpath: //div[@aria-label='Postal Code']
${city_input}  xpath://*[@name="city"]
${ques1}  xpath://div/form-element-label[label[span[text()="Were you previously employed by Metrolinx?"]]]/following-sibling::div/oj-select-one
${ques2}  xpath://div/form-element-label[label[span[text()="Are you a Family Member of a current Metrolinx Employee?"]]]/following-sibling::div/oj-select-one
${upload}  xpath://div[@class="attachment-upload-button__upload-button"]/div/label[text()="Upload Resume"]
${e-sign_input}  xpath://input[@name="fullName"]
${submit}  xpath://span[text()="Submit"]
${cross}  xpath://button[@title="Back to Job Details"]
${ques_temp}  xpath://div[contains(@aria-label,"?")]
${sexual_orientation_temp}  xpath://span[contains(text(),"Sexual Orientation")]/following::span[contains(text(),"?")]
${race_ethnicity_temp}  xpath: //span[contains(text(),"Race and Ethnicity")]/following::span[contains(text(),"?")]
${multiple_ques_temp}  xpath: //span[contains(text(),""]/..
${radio_ques1}  xpath://span[contains(text(),"Indigenous")]/ancestor::form-element-label/following-sibling::div//span[text()="?"]
${radio_gender}  xpath: //span[contains(text(),"The options identified")]/ancestor::form-element-label/following-sibling::div//span[text()="?"]
${person with disability}  xpath:(//span[contains(text(),"Persons with Disabilities")]/following::span[contains(text(),"?")])[1]
${sourcetype_dropdown}  xpath://div[@aria-label="Please select one of the Source type:"]//span/a

${workincanada_dropdown}  xpath://div[@aria-label="Are you legally entitled to work in Canada?"]//span/a

${workinoffice_dropdown}  xpath://div[contains(@aria-label,"What is the maximum number of days you are willing to go into the office?")]//span/a

${covidques_dropdown}  xpath://div[@aria-label="Have you been fully vaccinated* against COVID-19? *per Metrolinx Policy, “Vaccinated” means “An individual who has received their second dose of a two-dose COVID-19 vaccine series or their first dose of a one-dose COVID-19 vaccine series that is listed for emergency use by the World Health Organization or approved by Health Canada. This definition may be amended from time to time in accordance with the direction of public health authorities.” All employees must be vaccinated under Metrolinx’s Mandatory COVID-19 Vaccination Policy. We are requesting this information from you at the beginning of the recruitment process as being fully vaccinated against COVID-19 is a condition of continuing through the recruitment process and will eventually be a condition of commencing employment."]//span/a

${criminaloffence_dropdown}  xpath://div[@aria-label="Do you have a conviction for a criminal offence for which a pardon has not been granted?"]//span/a

${familymember_dropdown}  xpath://div[@aria-label="Are you a Family Member of a current Metrolinx Employee? A Family Member is defined according to our Nepotism policy as any of the following: an individual’s Parent, Parent-in-law, Step-parent, Child, Child-in-law, Stepchild, Spouse, Sibling, Sibling-in-law, Half-sibling, Grandparent, Grandchild, Aunt, Uncle, Niece, Nephew or First Cousin."]//span/a

${previously_employee}   xpath://div[@aria-label="Were you previously employed by Metrolinx?"]//span/a

${visa_yes}  xpath://form-element-label[label[span[contains(text(),"visa?")]]]/following-sibling::div//span[text()="Yes"]/..
${visa_no}  xpath://form-element-label[label[span[contains(text(),"visa?")]]]/following-sibling::div//span[text()="No"]/..
${previouslyemployed_dropdown}  xpath: //div[@aria-label="Were you previously employed by Metrolinx?"]//span/a

#//span[contains(text(),"Race and Ethnicity")]/ancestor::form-element-label/following-sibling::div//span[contains(text(),"South Asian")]