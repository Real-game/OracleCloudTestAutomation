*** Variables ***
${schedule_interview_page_header}       xpath: //div[@title='Schedule Interview']
${scheduled_date}                       xpath: //span[contains(@id,'dtIp')]
${scheduled_time}                       xpath: //span[contains(@id,'tmIp')]
${interviewer_name}                     xpath: //div[contains(@id,'NmPg')]/div
${web_conference_link}                  xpath: //div[contains(@id,'webConfLk')]/div
${actions_drop_down}                    xpath: //a[@title='Actions']
${cancel_interview_link}                xpath: //td[text()[contains(.,'Cancel Interview')]]
${date_field}                           xpath: //a[contains(@id,'dtSel')]
${date_result}                          xpath: //ul[contains(@id,'dtSel')]//li[contains(@class,'x1n6')]
${save_button_interview_calendar_page}    xpath: //div[contains(@class,'Save')]/a
${yes_button}                           xpath: //span[text()[contains(.,'Yes')]]/parent::a
