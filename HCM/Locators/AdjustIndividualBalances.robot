*** Variables ***
#InputBox
${element_name_input}  xpath: //div[text()="Search and Select: Element Name"]/following::input[1]
${rate_input}  xpath:(//label[text()='Calculation Component']/following::input)[3]
${rate_input_update}  xpath://label[text()="Rate"]//parent::div//following-sibling::div/input

#DropDown
${element_name_dropdown}  xpath: //label[text()="Element Name"]/following::a[1]
${calculation_component}  xpath://label[text()="Calculation Component"]/following::a[1]
${assignment_number_input}  xpath: //label[text()="Assignment Number"]/following::a[1]

#Button
${element_name_search_button}  xpath: //button[text()="Search"]
${element_name_search_ok_button}  xpath:(//button[text()="OK"])[1]
${click_submit_button}  xpath://a[@accesskey="m"]
${click_ok_button}  xpath://button[@accesskey="K"]


${adjustment_values}   xpath://div[@title="Add"]
${Click_adjust_element}   xpath://label[text()="Adjustment Element"]/following::a[1]
${click_province}   xpath://label[text()="Province"]/following::a[1]
${click_Reporting_type}  xpath://label[text()="Reporting Type"]/following::a[1]
${input_value}   xpath://input[@aria-label="Adjustment Element"]
${click_Assignment}  xpath://label[text()="Assignment"]/following::a[1]
${select_Assigment_value}  xpath://li[contains(@id,"etIdSrh::item0")]
${save_Adjustment}  xpath://div[@title="Save"]

