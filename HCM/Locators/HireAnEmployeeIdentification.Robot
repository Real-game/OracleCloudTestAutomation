*** Variables ***
${basic_Header}  xpath://div[@title='Basic Details']//h1
${hire_date_calendar_icon}   xpath://a[contains(@id,'inputDate')]
${hire_date_month_dropdown}   xpath: //select[contains(@id,'mSel::content')]
${hire_date_year_input}       xpath: //input[contains(@id,'inputDate1::pop')]
${hire_action_drop_down}      xpath: //label[text()='Hire Action']/parent::td/following-sibling::td//a
${hire_reason_drop_down}      xpath: //label[text()='Hire Reason']/parent::td/following-sibling::td//a
${legal_employer_drop_down}   xpath: //label[text()='Legal Employer']/parent::td/following-sibling::td//a
${personal_details_Header}    xpath://div[@title='Basic Details']//h1
${last_name_input}            xpath://label[text()='Last Name']/parent::td/following-sibling::td//input
${first_name_input}           xpath://label[text()='First Name']/parent::td/following-sibling::td//input
${middle_name_input}          xpath://label[text()='Middle Name']/parent::td/following-sibling::td//input
${title_drop_down}            xpath://label[text()='Title']/parent::td/following-sibling::td//a
${gender_drop_down}           xpath://label[text()='Gender']/parent::td/following-sibling::td//a
${date_of_birth_calendar_icon}  xpath: //label[text()='Date of Birth']/parent::td/following-sibling::td//a
${title_drop_down_option}           xpath://ul[contains(@id,'selectOneChoice4')]//li
${legal_employer_metrolinx_option}   xpath: //span[text()='Metrolinx']
${date_of_birth_year_input}       xpath: //input[contains(@id,'id3::pop')]
${create_national_identifier_icon}   xpath: //img[contains(@id,'create::icon')]
${country_drop_down}        xpath: //input[contains(@id,'clov')]
${country_option}           xpath: //li[contains(@id,'clov')]
${national_id_type}         xpath: //input[contains(@id,'soc2')]
${national_id_type_options}    xpath: //ul[contains(@id,'soc2')]//li
${national_id_input}        xpath: //label[text()[contains(.,'National ID')]]//preceding-sibling::input[contains(@id,'it1')]
${next_button}              xpath: //a[@accesskey='x']
${date_of_birth_month_dropdown}   xpath: //span[contains(@id,'id3')]/select
${hire_reason_options}      xpath: //ul[contains(@id,'selectOneChoice2')]//li
${hire_action_options}      xpath: //ul[contains(@id,'selectOneChoice1')]//li
${gender_drop_down_option}  xpath: //ul[contains(@id,'soc3')]//li
${hire_date_input}              xpath: //label[text()='Hire Date']/parent::td/following-sibling::td//a[@title='Select Date']//preceding-sibling::input
${date_of_birth_input}          xpath: //label[text()='Date of Birth']/parent::td/following-sibling::td//a[@title='Select Date']//preceding-sibling::input