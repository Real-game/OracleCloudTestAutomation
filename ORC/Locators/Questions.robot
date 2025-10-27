*** Variables ***
${subscriber_dropdown}  xpath://td[label[text()="Subscriber"]]/following-sibling::td/span/a
${sub_temp}  xpath://ul/li
${questionlibrary_dropdown}  xpath://div[span[text()="Question Library"]]/span/a
${library_temp}  xpath://div[span[text()=""]]
${keyword_search}  xpath://span[label[text()=" Keywords"]]/input
${search_btn}  xpath://button[text()="S"]
${edit_btn}  xpath:(//span[text()="Edit"])[2]
${edit_question_header}   xpath://h1[contains(text()," Edit Question")]
${edit_question_warning_header}    xpath: //div[contains(text(),'Edit Question')]
${create_new_version_question}    xpath: //label[text()='Create a new version of the question']
${update_question_OK}    xpath: //div[contains(text(),'Edit Question')]/following::button[@accesskey='K']