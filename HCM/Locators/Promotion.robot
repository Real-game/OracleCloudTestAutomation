*** Variables ***

${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${select_recent_search_result}  xpath: //tr[contains(@id,'item0')]
#//table/tr[2]

${click_salary}  xpath: //span[text()='Salary']//ancestor::a
${click_compensation}  xpath: //span[text()='Compensation']//ancestor::a

${selection_continue_button}  xpath: //a[@role='button' and @accesskey='u']
${continue}  xpath: //button[@title="Continue"]

${promotion_start_date}  xpath: //input[@placeholder='dd-mmm-yyyy' and contains(@id,'ipDt')]
${promotion_way}  xpath: //input[contains(@id,'sis1:aidis')]
${promotion_way_dropdown}  xpath: //label[contains(text(),'the way to promote?')]/parent::div/following-sibling::div//input[2]
${promotion_reason_dropdown}  xpath: //input[contains(@id,'aridis')]

${select_position}  xpath:(//input[@placeholder='Select a value'])[2]
${yes_button}  xpath://a[@role='button' and @accesskey='Y']
${adjustment_percentage}  xpath: //label[text()='Adjustment Percentage']//following::input[contains(@id,'ajpInp')]
${submit_button}  xpath://a[@role='button' and @accesskey='m']
${href_my_client}   id:groupNode_workforce_management