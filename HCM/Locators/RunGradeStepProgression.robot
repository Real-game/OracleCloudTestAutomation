*** Variables ***
${grade_ladder_dropdown}    xpath: //a[@title="Search: Grade Ladder"]
${grade_ladder_group_dropdown}    xpath: //label[text()='Grade Ladder Group']//parent::td//following-sibling::td//a[contains(@id,'soc5::drop')]
${grade_ladder_group_radio_button}    xpath: //label[text()="Grade ladder group"]
${submit_button}    xpath: //a[@accesskey="m" and @role="button"]
${ok_popup_button}    xpath: //button[contains(@id,'confirmSubmitDialog::ok')]
${submission_confirmation_number}  xpath: //span[contains(@id,'confirmationPopup')]/label
${effective_date}     xpath: //label[text()='Effective Date']/parent::td/following-sibling::td/input
${actions_and_action_reasons_section}     xpath: //h1[text()='Actions and Action Reasons']