*** Variables ***

${name_input}  xpath: //label[text()='Name']//following::input[contains(@id,'value00::content')]
${range_or_match_dropdown}  xpath: //label[text()='Range or Match']//following::a[contains(@id,'value10::drop')]
${range_or_match_value}  xpath: //label[text()='Range or Match']//following::ul[contains(@id,'value10::pop')]//li
${search_option}  xpath: //button[text()='Search']
${edit_option_button}  xpath: //a//span[text()='Edit']
${next_option_button}  xpath: //a//span[text()='Next']
${pencil_dropdown}  xpath: //img[@title='Edit']//parent::td//following-sibling::td/div
${submit_button_link}  xpath: //span[text()='Submit']
${ok_button}  xpath: //button[@accesskey='K']
