*** Variables ***

${manager_hierarchy}  xpath: //label[text()="Manager Hierarchy"]/following::input[contains(@id,'personEventIdId')]
${template_dropdown}  xpath: //label[text() = "Template"]/following::a[contains(@id,'drop')]
${generate_real_time_statements_button}  xpath: //button[text() = 'Generate Real Time Statements']
${confirmation_ok}  xpath: //button[@title = "OK"]
