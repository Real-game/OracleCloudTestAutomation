*** Variables ***

${interview_feedback_header}    xpath: //h1[text()[contains(.,'Interview Feedback')]]
${candidate_name_text}          xpath: //span[contains(@id,'cnInp::content')]
${requisition_title_text}       xpath: //span[contains(@id,'reqNIp::content')]
${general_information_header}   xpath: //h2[text()[contains(.,'General Information')]]
${interviewer_responses_header}  xpath: //h2[text()[contains(.,'Interviewer Responses')]]
${please_provide_interview_feedback_text}   xpath: //div[text()[contains(.,'Please provide candidate')]]
${interview_feedback_subheader}     xpath: //span[text()[contains(.,'Interview Feedback')]]
${would_you_recommend_we_hire_the_person_question}     xpath: //div[contains(@title,'Would you recommend we hire this person')]//input[contains(@id,'soc1::content')]
${would_you_recommend_for_another_role_question}     xpath: //div[contains(@title,'Would you recommend this person for another role')]//input[contains(@id,'soc1::content')]
${submit_button}            xpath: //div[contains(@class,'Submit')]
${yes_button}               xpath: //span[text()[contains(.,'Yes')]]/parent::a
