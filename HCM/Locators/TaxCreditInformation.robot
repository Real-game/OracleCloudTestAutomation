*** Variables ***

${edit_regional}  xpath: //img[@title = "Edit Provincial Tax: ON"]
${edit_federal}  xpath: //img[@title="Edit Federal Tax "]
${total_claim_amount_text_box}  xpath: (//label[text()="Total Claim Amount"]/following::input)[1]
${additional_tax_text_box}  xpath: (//label[text()="Additional Tax"]/following::input)[1]
${i_agree_checkbox}  xpath: //input[@type="checkbox"]/following::label
${save_and_close}  xpath: //a[@accessKey="S"]