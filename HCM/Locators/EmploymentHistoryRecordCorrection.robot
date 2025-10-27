*** Variables ***
${expand_assignments}  xpath:(//img[@title='Expand'])[1]
${edit_symbol}  xpath://h2[text()='Assignment']//following::a/img[@title='Edit'][1]
${dropdown_hourly_paid_or_salaried}  xpath://label[text()='Hourly Paid or Salaried']//following::a[1]
${save_button}  xpath://a[@role='button' and @accesskey='S']
${submit_button}  xpath://a[@role='button' and @accesskey='m']
${delete_button}  xpath: //button[text()='Delete']
${warning_ok}  xpath: //a[@accesskey='K']
