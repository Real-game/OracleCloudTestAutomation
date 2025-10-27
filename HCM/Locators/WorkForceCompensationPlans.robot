*** Variables ***
${pay_for_performance}    link: Pay for Performance

${go_to_task_under_worksheet}    xpath: (//span[text()="Worksheets"]/following::span[text()="Configure Alerts"]/following::a[@title="Go to Task"])[1]

${checkbox_path}    xpath://textarea[text()="Salary Range Missing"]/preceding::input[1]
${configure_alerts_Go_to_task}    xpath: #//span[text()='Configure Alerts']/ancestor::td/following-sibling::td//a[@title='Go to Task']

${probation_checkbox}    xpath: //textarea[text()='Probation']/preceding::input[1]
