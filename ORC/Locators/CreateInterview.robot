*** Variables ***

${create_interview_page_title}      xpath: //div[@title='Create Interview']
${interview_dates_calendar_icon}    xpath: //img[contains(@id,'cil1::icon')]
${year_input}                       xpath: //input[contains(@id,'cd1::ys')]
${month_drop_down}                  xpath: //select[contains(@id,'cd1::mSel')]
${calendar_pop_up_close_icon}       xpath: //img[contains(@id,'clpop')]
${start_time}                       xpath: //div[contains(@id,'staCrDt')]//a[@title='Select Time']
${end_time}                         xpath: //div[contains(@id,'endCrDt')]//a[@title='Select Time']
${hour_value}                       xpath: //tr[contains(@id,'staCr')]//div[contains(@id,'hour')]//div[contains(@class,'0')]
#${date_value}                       xpath: //td[contains(@class,'x150')]
${minute_value}                     xpath: //tr[contains(@id,'staCr')]//div[contains(@id,'minute')]//div[contains(@class,'0')]
${meridiem_value}                   xpath: //tr[contains(@id,'staCr')]//div[contains(@id,'meridiem')]//div[contains(@class,'0')]
${start_date_ok_popup}              xpath: //div[contains(@id,'staCrDt')]//button[@_afrpdo='ok']
${month_options}                    xpath: //select[contains(@id,'mSel')]
${end_date_ok_popup}                xpath: //div[contains(@id,'endCrDt')]//button[@_afrpdo='ok']
${meeting_duration_drop_down}       xpath: //a[contains(@id,'durSel')]
#${meeting_duration_options}         xpath: //div[contains(@id,'dur')]//li[contains(@class,'x1n6')]
${interviewer_text_box}             xpath: //input[@aria-label="Interviewers"]
${interviewer_result}               xpath: //tr[contains(@id,'item0')]
${no_of_candidates}                 xpath: //input[contains(@id,'tscIp')]
${save_and_close_button}            xpath: //span[text()='ave and Close']
${web_conference_link_input}        xpath: //input[contains(@name,'wclIp')]
#${warning_message_header}           xpath: //span[contains(@class,'warning')]
${end_date_hour_value}              xpath: //tr[contains(@id,'endCr')]//div[contains(@id,'hour')]//div[contains(@class,'0')]
${end_date_minute_value}            xpath: //tr[contains(@id,'endCr')]//div[contains(@id,'minute')]//div[contains(@class,'0')]
${end_date_meridiem_value}          xpath: //tr[contains(@id,'endCr')]//div[contains(@id,'meridiem')]//div[contains(@class,'0')]
${next_month}                       xpath: //a[@aria-label='Next Month']
${previous_month}  xpath://a[@aria-label='Previous Month']




