*** Variables ***
${add}  xpath://td[div[@title="Interview Schedules"]]/following-sibling::td/div
${action_list}  xpath://img[@title="Actions"]
#${interview_drop}  xpath://tr[contains(@id,'isPce')]/td[@class='xnw']
${first_round_interview_link}   xpath: //a[text()[contains(.,'Interview_Schedule')]]

${publish_schedule}   xpath:  //td[text()[contains(.,'Publish Schedule')]]