*** Variables ***
${pe_search}  xpath://input[contains(@placeholder,"Enter person")]
${pe_search_img}  xpath://a[img[@title="Search"]]
${pe_names_temp}  xpath://td[1]/div/div/span[@class='x2ra']
${pe_actions_temp}  xpath://a[img[@title='Actions']]
${pe_temp}  xpath://tr[contains(@id,"hf02Sbv")]//td[@class='xnw']
${continue}  xpath://a[@accesskey="u"]
${submit_btn}  xpath: //a[@accesskey="m"]
${edit_pending_employee}  xpath: //td[text()="Edit Pending Employee"]
${continue_btn}  xpath: //button[@title="Continue"]
${ok_btn}  xpath: //a[@accesskey="K"]
${convert_option}  xpath: //td[text()='Convert']
${address_1_input}  xpath: //label[text()='Address Line 1']//parent::div//following-sibling::div/input
${address_2_input}  xpath: //label[text()='Address Line 2']//parent::div//following-sibling::div/input
${postal_code_input_information}  xpath: //label[text()='Postal Code']//parent::div//following-sibling::div//input[@placeholder='Select a value']
${city_input_information}  xpath: //label[text()='City']//parent::div//following-sibling::div//input[@placeholder='Select a value']
${Province_input_information}  xpath: //label[text()='Province']//parent::div//following-sibling::div//input[@placeholder='Select a value']
${select_option_first}  xpath: //table/tr[2]
