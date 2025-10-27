*** Variables ***

${schedule_new_process_btn}                     xpath: //a[@role="button"]/following::span[text()="Schedule New Process"]
${search_drop_down}                             xpath: //a[@title="Search: Name"]
${search_choice}                                xpath: //a[contains(@id,"popupsearch")]
${search_name}                                  xpath: //input[@aria-label=" Name"]
${search_btn}                                   xpath: //button[text()="Search"]
${job_search_ok_btn}                            xpath: (//button[text()="OK"][@_afrpdo="ok"])[1]
${schedule_ok_btn}                              xpath: (//button[text()="OK"])[1]
${submit_btn}                                   xpath: //a[@accesskey="m"]
${advanced_btn}                                 xpath: //span[text()="Advanced"]
${advanced_options_schedule}                    xpath: (//a[text()="Schedule"])[1]
${using_schedule_radio_btn}                     xpath: //label[text()="Using a schedule"]
${select_frequency_dropdown}                    xpath: (//select[contains(@id,"selectOneChoice1")])[1]
${minutes_box}                                  xpath: //input[contains(@name,"minutes")]
${hours_box}                                    xpath: //input[contains(@name,"hours")]
${days_box}                                     xpath: //input[contains(@name,"days")]
${week_box}                                     xpath: //input[contains(@name,"inputNumberSpinbox")]
${start_date_calendar}                          xpath: //a[@title="Select Date and Time"][contains(@id,"startdate")]
${end_date_calendar}                            xpath: //a[@title="Select Date and Time"][contains(@id,"enddate")]
${calendar_minutes}                             xpath: //input[contains(@id,":ms:")]
${calendar_hours}                               xpath: //input[contains(@id,":hs:")]
${calendar_seconds}                             xpath: //input[contains(@id,":ss:")]


${calendar_year}                                xpath: //input[contains(@id,":ys:")]

${calendar_month_dropdown}                      xpath: //select[contains(@id,":mSel:")]
${calendar_month_list}                          xpath: //option[text()="August"]


${start_date_calendar_ok_btn}                   xpath: //button[text()="OK"][contains(@id,"startdate::pop::dlg::ok")]
${end_date_calendar_ok_btn}                     xpath: //button[text()="OK"][contains(@id,"enddate::pop::dlg::ok")]

${confirmation_header}                          xpath: //div[text()="Confirmation"]
${process_id_mesg}                              xpath: //label[contains(text(),"Process")]
${confirm_submit_ok}                            xpath: //button[text()="OK"][contains(@id,"confirmSubmitDialog::ok")]
${expand_search}                                xpath: //a[@title="Expand Search"]
${process_id_text_search}                       xpath: //input[@aria-label=" Process ID"]
#${search_btn}                                   xpath: //button[text()="Search"]
${status_refresh_button}                        xpath: //img[@title="Refresh"]
