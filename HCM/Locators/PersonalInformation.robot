*** Variables ***

#My Contact Information
${href_my_contact_information}  xpath://span[text()='My Contact Information']

${href_edit_number}  xpath://img[@title="Edit Phone Details"]
${href_type}  xpath://label[text()='Type']/following::a[1]
${href_area_code}  xpath://label[text()='Area Code']/following::input[1]
${href_number}  xpath://label[text()='Number']/following::input[1]
${hsubmit_button}  xpath://div[@title='Submit']

${href_edit_address}  xpath://a[contains(@title,'Edit') and contains(@id,'addrPse:PSEcil6')]
${href_address_change_start_date}  xpath://label[text()='When does this address change start?']/following::input[1]
${href_address1}  xpath://label[text()='Address Line 1']/following::input[1]
${href_address2}  xpath://label[text()='Address Line 2']/following::input[1]
${hsubmit_button}  xpath://div[@title='Submit']

#Family and Emergency Contacts
${href_my_family_friend_emergency}  xpath://span[text()='Add family and friends to contact in case of emergency.']

${href_add_button}  xpath://span[text()="Add"]
${href_add_button_action}  xpath://div[@class='x1lu']/table/tbody/tr/td[@class='xnw']

${href_last_name}  xpath://label[text()='Last Name']/following::input[1]
${href_first_name}  xpath://label[text()='First Name']/following::input[1]
${href_title}  xpath://label[text()='Title']/following::input[1]
${href_relationship}  xpath://label[text()='Relationship']/following::input[1]
${href_relationship_start_date}  xpath://label[text()="What's the start date of this relationship?"]/following::input[1]
${href_emergency_details_submit}  link:Submit

#Employee Infor
${href_employment_info_tab}  xpath://span[text()='Employment Info']
${edit_home_num}  xpath: //a[contains(@title,'Edit') and contains(@id,'phone')]
${home_number_input}  xpath: //input[contains(@id,'pNumInp')]
${href_my_documents}  xpath: //span[text()='My Documents']

${search_person}  xpath: //input[@placeholder='Search for a Person']
${select_first_row}  xpath: //tr[contains(@id,'item0')]
${city_input}  xpath: //label[text()='City']//following::input[contains(@id,'AddStIt:3')]
${postal_code_input}  xpath: //label[text()='Postal Code']//following::input[contains(@id,'AddStIt:5')]

#${edit_address}  xpath: (//img[@title="Edit"])[3]
#${address_change_start_date}  xpath: //label[text()='When does this address change start?']/following::input[1]
#${submit_button}  xpath: //div[@title='Submit']

${my_compensation}   xpath: //span[text()='My Compensation']