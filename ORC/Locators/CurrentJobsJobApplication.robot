*** Variables ***
${withdraw_application}    xpath://td[text()[contains(.,'Withdraw Application')]]
${withdraw_warning_message}  xpath: //div[text()[contains(.,'Do you want to continue?')]][text()[contains(.,'withdraw your job application')]]
${warning_ok_button}    xpath: //span[text()[contains(.,'OK')]]/parent::a
${done_button}          xpath: //a[@title='Done']
