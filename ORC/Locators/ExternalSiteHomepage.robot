*** Variables ***
${ext_search_input}  xpath://input[contains(@id,'keyword')]
${search_btn}  xpath://button[@title='Search for Jobs']
${validator}  xpath://div/p[text()='No results were found.']
#//div/h3[@class='no-results-header']
#${pin_btn}  xpath://li[@class='joblist-grid-item']/div/following-sibling::div/button[contains(@title,'Add')]
${myjobs_btn}  xpath://button[@title="My Job Selections"]
#${text_ext}  xpath://li[@class='joblist-grid-item']/div/following-sibling::div/button/span[1]

${requisition_ext}  xpath:  //a[@class='joblist-tile']


${myjobs_list}  xpath://ul/li//a/div[1]
${applynow_btn}  xpath://span[text()="Apply Now"]
${alljobs_btn}  xpath://span[text()="All Jobs"]
${filter_btn}  xpath://button[div[span[span[text()="Filter"]]]]
${workLocations_expand}  xpath:(//button[contains(@aria-label,"Locations filter")])[1]
${workLocation_temp}  xpath://search-facet-dropdown-item/li/button
${employee_btn}  xpath://a[@title="I am an employee"]
${manage_profile_btn}  xpath://*[@title="Manage profile"]
${email_input}  xpath://input[@name="primary-email"]
${send_mail}  xpath: //button[@title="Next"]
#//span[text()="Send Email"]/ancestor::button
${otp_inputs}  xpath://div[@class="pin-code-input__segment"]/input
${keep_me_signed_btn}  xpath://label/span[following-sibling::span[text()="Keep me signed in"]]
${verify_btn}  xpath://button[span[text()="Verify"]]
${checker}  xpath://div[contains(@class,"candidate-self-service__personal-information")]/p
${user_dropdown}  xpath://*[@class="user-menu"]
${profile_btn}  xpath://button[text()="Profile"]
${esh_offer_accept}  xpath://a[text()="Accept"]
${esh_offer_decline}  xpath://a[text()="Decline"]
${esh_esign}    xpath://input[@name="fullName"]
${esh_accept_btn}  xpath: //span[contains(@data-bind,"offer.accept")]//parent::button
#//span[text()="Accept"]
${esh_decline_reason_dropdown}  xpath://div[@aria-label="Reason"]//a
${esh_temp}  xpath://ul/li/div
${esh_decline_btn}  xpath://button[text()="Decline"]
${esh_join}  xpath://a[text()="Join our Talent Pool!"]
${esh_join_email}  xpath://input[@name="primary-email" and contains(@id,"1")]
${esh_join_check}  xpath://div[input[@type="checkbox"]]/div/span[1]
${esh_join_sub}  xpath://button[text()="Subscribe"]
${es_pref_loc}  xpath://div[label[text()="Preferred Location"]]//input[@type="text"]
${es_pref_cat}  xpath://div[label[text()="Preferred Category"]]//input[@type="text"]
${es_conf_sub}  xpath://button[inline-spinner[span[span[text()="Subscribe"]]]]
${es_check_temp}  xpath://span[contains(@class,"apply-flow-input-checkbox__button")]

${personal_info_header}  xpath: //h3[text()='Sensitive Personal Information']
${month_dropdown}  xpath: //input[contains(@id,"month")]
#//span[text()='Month']/following::a[1]
${month_input_select}  xpath: //ul/li/div//span//span
${day_dropdown}  xpath: //input[contains(@id,"day")]
#//span[text()='Day']/following::a[1]
${year_input_value}  xpath: //input[contains(@id,"year")]
#//span[text()='Year']/following::input[1]
${select_Add_national_identifier}  xpath: //span[text()="Add National Identifier"]//parent::button
${national_id_dropdown}  xpath: //oj-select-single[@aria-label="National ID Type"]
${Social_insurance_value_select}  xpath:  //*[text()="Social Insurance Number"]
${sin_input}  xpath: //input[@name="nationalId"]
${done_button_select}  xpath://button[contains(@class,'button save-btn')]
${gender_dropdown}  xpath: //oj-select-single[@aria-label="Gender"]
${gender_value_dropdown}    xpath: (//span[text()="Gender"]//following::input//following::div)[1]
#(//*[@aria-label="Gender"]//a)[1]
${gender_value_select}  xpath: //*[@aria-label="Gender"]//span
${marital_status_dropdown}    xpath: (//span[text()="Marital Status"]//following::input//following::div)[1]
#(//*[@aria-label="Marital Status"]//a)[1]
${marital_status_value_select}  xpath: //*[@aria-label="Marital Status"]//span
${full_name_input}  xpath: //input[@name="fullName"]
${click_submit_button}  xpath: //button[span[text()="Submit"]]
${Submit_success_message}  xpath: //*[contains(text(),"Thank you for providing more info on your job application")]
${dob_disabled}  xpath: //span[@aria-label="You can't edit your date of birth because it's already stored in your profile. If you need to change it, contact the recruiting team."]
${identifier_country_dropdown}  xpath://oj-select-single[@aria-label="Country"]
#(//*[@aria-label="Country"]//child::a)[1]
#${country_search_input}  xpath:  //div[@id='oj-listbox-drop']/div[1]/div[1]/div[1]/div[1]/input[1]
${Canada_country}  xpath: //span[text()="Canada"]
${country_option}    xpath: //input[@name="country"]
${open_menu}    xpath: //button[@title='Open menu']
${terms_and_condition_header}    xpath: //h1[text()='Terms and Conditions']
${terms_and_condition_agree}    xpath: //button[@id="applyFlowLegalDisclaimer"]

${remove_month_field}    xpath: //button[@aria-label="Remove value for the Month field."]
${remove_day_field}    xpath: //button[@aria-label="Remove value for the Day field."]
${remove_year_field}    xpath: //button[@aria-label="Remove value for the Year field."]