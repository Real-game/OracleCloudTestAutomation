*** Variables ***
${latest_report_status}    xpath: (//span[text()='Run Grade Step Progression']/following::span[2])[1]
${status_refresh_button}    xpath: //img[@title="Refresh"]
${latest_report_status_sgsr}    xpath: (//span[text()='Synchronize Grade Step Rates']//following::span[2])[1]
#(//span[text()='Synchronize Grade Step Rates']/following::a[1])[1]

${tasks_refresh_button}  xpath: //button[text()="Refresh"]