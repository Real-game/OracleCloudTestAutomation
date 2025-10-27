*** Variables ***

${proxy_manager_dropdwon}  xpath: //a[contains(@id,'apPlnDtl:soc2::drop')]
${proxy_manager_value}  xpath: //ul[contains(@id,'apPlnDtl:soc2::pop')]//li

${pay_for_performance_link}  xpath: //a[text()='Pay for Performance']
${filters}  xpath: //img[@title='Filters']
${filter_dropdown}  xpath: //label[text()='Grade']//parent::td//following-sibling::td//a[contains(@id,'fltItr1:3:SMC3::drop')]
${filter_run}  xpath: (//label[text()='Grade']//following::td//a[@title='Go'])[1]
${lumpsum_sort_descending}  xpath: //span[text()='Lumpsum Amount (If Required)']//parent::div//preceding-sibling::div//a[@title='Sort Descending']
#${lumpsum_value}  xpath: //span[contains(@id,'wDtl:18:iCustomSegment38::content')]
${processing_status_sort_descending}  xpath: //span[text()='Processing Status']//parent::div//preceding-sibling::div//a[@title='Sort Descending']

${eligibility_status_dropdown}  xpath: //label[text()='Eligibility Status']//parent::td//following-sibling::td//a
${eligibility_status_run}  xpath: (//label[text()='Eligibility Status']//following::td//a[@title='Go'])[1]

${name_search_field}  xpath: //input[@placeholder='Name Search']
${name_search_button}  xpath: //a[@title='Go']

${save_button}  xpath: //span[text()='Save']
${ok_button_popup}  xpath: //span[text()='K']/parent::button[text()='O']
${confirmation_ok_button_popup}  xpath: (//div[text()='Confirmation']//following::button[text()='OK'])[1]

${employee_details}  xpath: (//div[contains(@id,'wDtl::db')]//td[4])[1]
${filter_expansion}  xpath: //div[contains(@id,'_ATp:aftrTB::eoi')]
${clear_filter}  xpath: //span[text()='Clear Filters']





