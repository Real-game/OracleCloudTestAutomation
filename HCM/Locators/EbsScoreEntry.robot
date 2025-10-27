*** Variables ***
#Login Page
${ebs_txt_userid}    id:usernameField
${ebs_txt_pass}      id:passwordField
${ebs_btn_submit}    xpath: //button[text()='Log In']

#${ebs_txt_userid}    id:username
#${ebs_txt_pass}    id:password
#${ebs_btn_submit}    xpath: //input[@type="submit"]

#HomePage
${ebs_homepage_title}    xpath: //span[@title='E-Business Suite']
#${ebs_navigator}    xpath: //a[@id="SNAV"]
${ebs_evaluator_option}    xpath: //div[contains(text(),"MX SC Collaboration Client (Evaluator)")]
${ebs_sourcing_option}    xpath: //div[text()="Sourcing"]
${ebs_sourcing_homepage_option}    xpath: //div[text()="Sourcing Home Page"]

#RFQ Negotiations Page
${ebs_scores_dropdown}    xpath: //select[@id='ActionListTop']//option[@selected]
${ebs_score_drop}    xpath: //select[@id='ActionListTop']
${ebs_score_value}    xpath: //select[@id='ActionListTop']//option[text()='Enter Scores']
${ebs_scores_go_button}    xpath: //select[@id="ActionListTop"]//following::button[@id='GoBtnTop']

#Enter Scores Page
${ebs_internal_note}    xpath: //textarea[@id="InternalNote"]
${ebs_next_button}    xpath: (//a[contains(text(),'Next')])[2]
${ebs_save_as_draft}    xpath: (//button[contains(@id,"SaveAsDraft")])[2]
${ebs_submit_score}    xpath: (//button[contains(@id,"SubmitScore")])[1]

#Score input
#//input[contains(@id,'Score:0') and @type='text']
#note
#//input[contains(@id,'Note:0') and @type='text']
#
#(//td[text()[contains(normalize-space(), "The platform shall allow Metrolinx to import flat files (csv, xlsx, etc.) on an automated and scheduled basis as well as on a manual and ad-hoc basis. The refresh frequency of scheduled import is daily.")]]//preceding::td//following-sibling::td//td//input[contains(@id,'Score') and @type='text'])[1]
#(//td[text()[contains(normalize-space(), "The platform shall allow Metrolinx to import flat files (csv, xlsx, etc.) on an automated and scheduled basis as well as on a manual and ad-hoc basis. The refresh frequency of scheduled import is daily.")]]//preceding::td//following-sibling::td//td//input[contains(@id,'Note') and @type='text'])[1]

#(//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])[1]
#(//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])//following::td/input[contains(@id,'Score') and @type='text'][1]
#((//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])//following::td/input[contains(@id,'Note') and @type='text'])[1]

#requirement Entry page
${ebs_requirement_name_inp}    xpath: //input[@id="RequirementName"]
${ebs_iframe_requirement_desc}    xpath: //iframe[@id="RequirementVal_IFRAME"]
${ebs_iframe_requirement_desc_input}    xpath: //iframe[@title="Requirement"]
${ebs_req_type_dropDown}    xpath: //select[@title="Requirement Type Poplist"]
${ebs_req_type_value}    xpath: //select[@title="Requirement Type Poplist"]/option

${ebs_value_type_dropDown}    xpath: //select[@title="Value Type"]
${ebs_value_type_value}    xpath: //select[@title="Value Type"]/option

${ebs_scoring_method_dropDown}    xpath: //select[@title="Scoring Method"]
${ebs_scoring_method_value}    xpath: //select[@title="Scoring Method"]/option
${ebs_presentation_eval_record_date_set}    xpath: //span[text()='Technical Presentation Evaluation']/following::select[@title='Select record set'][1]
${internal_note_textarea}    xpath: //textarea[@id="InternalComm"]
${internal_comments_save}    xpath: //button[text()="Save"]
#        wait and click element    xpath://a[text()='Change to Plain Text Mode']
#        Execute JavaScript    document.querySelector('//td[@title="Requirement"]').innerHTML = "${value}";
#        Wait And Set Text    xpath://td[@title="Requirement"]    ${value}
#        wait and set text    //textarea[@id="RequirementVal"]    ${value}
#        //body//parent::html[@dir='ltr']//preceding::iframe[@id="RequirementVal_IFRAME"]    ${value}
#        Execute JavaScript    var iframe = document.querySelector("td[title='Requirement'] iframe"); if (iframe) { iframe.contentDocument.body.innerText = "${value}"; } else { throw new Error("Iframe not loaded"); }

