*** Variables ***
${search_input_person_name}  xpath://input[@placeholder='Search for a Person']
${select_recent_search_result}  xpath://table/tr[2]

${tax_credit_information_link}  link:Tax Credit Information

${expand_associations}  xpath: (//img[@title='Expand'])[2]
${edit_associations}  xpath: (//img[@title='Edit'])[1]
${change_start_date}  xpath: //label[text()='When does this change start?']/following::input[1]
${add_associations_details}  xpath: //span[text()='Add']
${assignment_dropdown}  xpath: (//label[text()='Assignment']/following::a)[1]
${ok_button}  xpath: //a[@accesskey='K' and @role='button']
${save_and_close}  xpath: //a[@accesskey='S' and @role='button']
${federal_expand}  xpath: //h2[text()='Federal']//parent::div//parent::td//following-sibling::td//img[@title='Expand']
${federal_total_claim_amount_value}  xpath: (//label[text()='Total Claim Amount']//parent::div//following-sibling::div//span)[1]
${regional_expand}  xpath: //h2[text()='Regional']//parent::div//parent::td//following-sibling::td//img[@title='Expand']
${regional_total_claim_amount_value}  xpath: (//h2[text()='Regional']//following::label[text()='Total Claim Amount']//parent::div//following-sibling::div//span)[1]
${association_expand}  xpath: //h2[text()='Associations']//parent::div//parent::td//following-sibling::td//img[@title='Expand']
${association_tax_report_unit_value}  xpath: (//h2[text()='Associations']//following::label[text()='Tax Reporting Unit']//parent::div//following-sibling::div//span)[1]
${association_assignment_value}  xpath: (//h2[text()='Associations']//following::label[text()='Assignment']//parent::div//following-sibling::div//span)[1]
${association_province_of_employment_value}  xpath: (//h2[text()='Associations']//following::label[text()='Province of Employment']//parent::div//following-sibling::div//span)[1]
${absence_card}  xpath: //a[text()='Absences']