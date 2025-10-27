*** Variables ***
${subscriber_dropdown}  xpath://td[label[text()="Subscriber"]]/following-sibling::td/span/a
${sub_temp}  xpath://ul/li
${questionlibrary_dropdown}  xpath://div[span[text()="Question Library"]]/span/a
${library_temp}  xpath://div[span[text()=""]]
${keyword_search}  xpath://span[label[text()=" Keywords"]]/input
${search_btn}  xpath://button[text()="S"]
${edit_btn}  xpath://span[text()="Edit"]
${edit_question_header}   xpath://h1[contains(text()," Edit Question")]