*** Variables ***

${requisition_id_input}     xpath: //input[contains(@id,'hf03Inp')]
${search_icon}              xpath: //a[@title='Search']
${requisition_link}         xpath: //a[contains(@class,'xnc')]
${remove_filter}            xpath: //a[contains(@title,'Remove Filter')]
${invitations_done_button}              xpath: //a[@title='Done']
${warning_yes_button}       xpath: //button[contains(@id,'MAyes')]
${submit_candidate_button}   xpath: //span[text()[contains(.,'Submit Candidate')]]/parent::a
${submit_candidate_link}    xpath: //tr[@title='Submit Candidate']