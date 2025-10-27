*** Settings ***
Library  BuiltIn
Library  Selenium2Library
Resource  ../Locators/ScheduleJobs.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click on Schedule New Process Button
    Wait And Click Element  ${schedule_new_process_btn}
    Sleep  3s
    Capture Page Screenshot

Search Scheduled Job
    [Arguments]  ${schedule_job}
    Wait And Click Element  ${search_drop_down}
    Sleep  2s
    Wait And Click Element  ${search_choice}
    Sleep  5s
    Wait And Set Text  ${search_name}  ${schedule_job}
    Sleep  2s
    Wait And Click Element  ${search_btn}
    Sleep  8s
    Wait and Click Element  xpath: //span[contains(text(),"${schedule_job}")]
    Sleep  5s
    Wait And Click Element  ${job_search_ok_btn}
    capture page screenshot
    Sleep  2s
    Wait And Click Element  ${schedule_ok_btn}
    Sleep  2s
    Wait until page contains  Process Details  20s  Process Details Pop-up is not displayed

Go to Advanced Schedules
    Wait And Click Element  ${advanced_btn}
    Sleep  2s
    Wait And Click Element  ${advanced_options_schedule}
    capture page screenshot

Schedule Job as per timeline  # 0.Once  1.Hourly  2.Minute  3.Daily  4.Weekly  5.Monthly  6.Yearly
    [Arguments]  ${data}
    IF  "${data}[Frequency]" != "Once"
        Wait And Click Element  ${using_schedule_radio_btn}
        Sleep  5s
        Wait And Click Element  ${select_frequency_dropdown}
        Sleep  2s
        Wait And Click Element  xpath: //option[contains(text(),"${data}[Frequency]")]
        IF  "${data}[Frequency]" == "Minute"
            Wait And Set Text  ${minutes_box}  ${data}[Difference]
            Wait And Set Text  ${hours_box}  0
        ELSE IF  "${data}[Frequency]" == "Hourly"
            Wait And Set Text  ${minutes_box}  0
            Wait And Set Text  ${hours_box}  ${data}[Difference]
        ELSE IF  "${data}[Frequency]" == "Daily"
            Wait And Set Text  ${days_box}  ${data}[Difference]
        END
        Sleep  3s
        Enter Start Date minutes ahead of time  2
        Enter End Date years ahead of time  1
    END


Enter Start Date minutes ahead of time
    [Arguments]  ${minutes_ahead}
    Wait And Click Element  ${start_date_calendar}
#    get element attribute
    ${min} =  get element attribute  ${calendar_minutes}  value
    ${hr} =  get element attribute  ${calendar_hours}  value
    ${min} =  convert to integer  ${min}
    ${range} =  Evaluate  ${min}+${minutes_ahead}
    IF  ${range} < 60
        Wait And Set Text  ${calendar_minutes}  ${range}
        Sleep  3s
    ELSE IF  ${range} > 60
        Wait And Set Text  ${calendar_minutes}  1
        Wait And Set Text  ${calendar_hours}  (${hr} + 1)
    END
    Wait And Click Element  ${start_date_calendar_ok_btn}
    Sleep  3s


Enter End Date years ahead of time
    [Arguments]  ${years_ahead}
    Wait And Click Element  ${end_date_calendar}
    ${yr} =  get element attribute  ${calendar_year}  value
    ${yr} =  convert to integer  ${yr}
    Wait And Set Text  ${calendar_year}   Evaluate  ${yr}+${years_ahead}
    Wait And Click Element   ${end_date_calendar_ok_btn}

Click on Submit
    Wait And Click Element  ${submit_btn}
    Sleep  2s
    capture page screenshot

Search Process Id
    wait until page contains  Confirmation  10s
    capture page screenshot
    ${id_msg} =  Wait And Get Text  ${process_id_mesg}
    ${id_msg} =  Get Scheduled Process Id  ${id_msg}
    Log  ${id_msg}
    Wait And Click Element  ${confirm_submit_ok}
    Sleep  2s
    Wait And Click Element  ${expand_search}
    Sleep  2s
    Wait And Set Text  ${process_id_text_search}  ${id_msg}
    Wait And Click Element   ${search_btn}
    Sleep  2s
    Wait And Click Element  ${status_refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  30
        ${Status} =  Wait And Get Text  (//span[text()= "${id_msg}"]/following::span)[1]
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}=="Succeeded"
        Sleep  15s
        Wait And Click Element  ${status_refresh_button}
        Sleep  5s
    END
    Log to console  Process Completed Successfully
    capture page screenshot
