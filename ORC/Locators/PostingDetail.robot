*** Variables ***
${posting_schedule_drop_down}   xpath: //a[contains(@id,'post') and contains(@id,'Sel::drop')]
#${posting_schedule_options}     class: //li
${expiration_date}              xpath: //input[contains(@placeholder,'dd')]
${save_button}                  xpath: //div[@title='Save']
${internal_career_site_section}    xpath: //div/div[@title='Internal Career Site']
${external_career_site_section}    xpath: //div/div[@title='External Career Sites']
${internal_career_site_edit_button}    xpath: //div[@title='Internal Career Site']//span[text()[contains(.,'Edit')]]
${external_career_site_edit_button}    xpath: //div[@title='External Career Sites']//span[text()[contains(.,'Edit')]]
${internal_career_site_posting_drop_down}    xpath: //div[label[text()='Posting Schedule']]//following-sibling::div//a
#${internal_career_posting_drop_down}    xpath: //input[@class='x2h'][contains(@id,'eISc')]
${expiry_date_calendar_icon}    xpath: //a[contains(@id,'EDDt')][@title='Select Date and Time']
${year_option_selection}    xpath: //div[@data-afr-year]
${month_option_selection}    xpath: //div[@data-afr-month]
${date_option_selection}    xpath: //td[@data-afr-adfday='cm']
${internal_career_site_post_later_drop_down}    xpath: //*[text()[contains(.,'Post Later')]]
${year_value}   xpath: //table[contains(@id,'cd::cng')]//td/div
${date_value}   xpath: //table[contains(@id,'cd::cg')]//td[@data-afr-adfday='cm']
${set_time}     xpath: //button[@title='Switch to time selection']
#${set_hour}     xpath: //div[@aria-label='Select Hours']//div[contains(@class,'x1v6 AFWheelItemPos3')]
#${set_minutes}      xpath: //div[@aria-label='Select Minutes']//div[contains(@class,'x1v6 AFWheelItemPos3')]
#${set_AM_PM}        xpath: //div[@aria-label='Meridiem']//div[contains(@class,'x1v6 AFWheelItemPos1')]
${ok_button}        xpath: //button[@_afrpdo='ok'][contains(@id,'pop')]
${start_date_calendar_icon}        xpath: //a[contains(@id,'SDDt')][@title='Select Date and Time']
${internal_career_site_post_now_drop_down}   xpath: //*[text()[contains(.,'Post Now')]]
${ok_button_post_later}        xpath: //button[@_afrpdo='ok'][contains(@id,'eESDDt::pop')]








