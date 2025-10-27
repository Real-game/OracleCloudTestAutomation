*** Variables ***
${unifier_username}                             xpath: //input[@id='okta-signin-username']
#//input[@id='idcs-signin-basic-signin-form-username']
${unifier_password}                             xpath: //input[@id='okta-signin-password']
#//input[@id='idcs-signin-basic-signin-form-password|input']
${unifier_sign_in}                              xpath: //input[@value='Sign In']
#//span[text()='Sign In']
${got_it_alert}                                 xpath: //button[@title='Accept']
${primavera_unifier_icon}                       xpath: //img[@alt='Primavera Unifier']
${home_icon}    xpath: //a[@aria-label='Home']

${user_profile}  xpath: //button[contains(@aria-labelledby,"header-toolbar-user")]
${proxy_dropdown}  xpath: //span[text()='Proxy For']//parent::span//parent::a//preceding-sibling::a
${proxy_raheel_access}  xpath: //span[text()='Raheel Hirani']