*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreateInterview.robot

*** Keywords ***

Create Interview
    [Arguments]  ${start_time_text}   ${end_time_text}   ${meeting_duration_value}   ${web_conference_link_text}     ${interviewer_name}
    Wait Until Element Is Visible    ${create_interview_page_title}      30     Create Interview page title is not displayed
    Capture Page Screenshot
    Sleep  3s
    Click Element   ${interview_dates_calendar_icon}
    Sleep  3s
    ${current_date}=  Get Current Date Dd Mmm Yyyy
    Log  Current Date: ${current_date}
    ${calendar_value}=  Split String    ${current_date}  -
    Wait Until Element Is Visible    ${year_input}      30     year input is not displayed
    Sleep  3s
    ${date}=  check and increment date  ${current_date}
    FOR  ${e}  IN RANGE  0  100
        ${month}=  Get Element Attribute  ${month_drop_down}  title
        ${year}=  Get Element Attribute  ${year_input}  title
        ${status}=  Run Keyword And Return Status  Should Contain  ${month}  ${calendar_value}[1]
        ${status1}=  Run Keyword And Return Status  Should Contain  ${year}  ${calendar_value}[2]
        IF  "${status}"=="True"
            IF  "${status1}"=="True"
#                Select Required Value  ${date_value}    ${calendar_value}[0]
                Wait And Click Element  //td[text()="${date}" and @data-afr-adfday='cm']

                Exit For Loop
            ELSE
                Wait And Click Element  ${next_month}
            END
        ELSE
            Wait And Click Element  ${next_month}
        END
    END
    Sleep  3s
    Click Element   ${calendar_pop_up_close_icon}
    Sleep  3s
    Click Element   ${start_time}
    ${start_time_value}=  Split String    ${start_time_text}  :
    Click Element   ${hour_value}
    Press Keys	${hour_value}  ${start_time_value}[0]
    Sleep  3s
    Click Element   ${minute_value}
    Press Keys	${minute_value}  ${start_time_value}[1]
    Sleep  3s
    Click Element   ${meridiem_value}
    Press Keys	${meridiem_value}  ${start_time_value}[2]
    Sleep  3s
    Click Element   ${start_date_ok_popup}
    Wait Until Element Is Visible    ${end_time}      20     End time calendar icon is not displayed
    Scroll Element Into View   ${end_time}
    Click Element   ${end_time}
    Sleep  3s
    ${end_time_value}=  Split String    ${end_time_text}  :
    Sleep  3s
    Scroll Element Into View   ${end_date_hour_value}
    Click Element   ${end_date_hour_value}
    Press Keys	${end_date_hour_value}  ${end_time_value}[0]
    Sleep  3s
    Click Element   ${end_date_minute_value}
    Press Keys	${end_date_minute_value}  ${end_time_value}[1]
    Sleep  3s
    Click Element   ${end_date_meridiem_value}
    Press Keys	${end_date_meridiem_value}  ${end_time_value}[2]
    Sleep  3s
    Click Element   ${end_date_ok_popup}
    Wait Until Element Is Visible    ${meeting_duration_drop_down}      20     Meeting duration is not displayed
    Scroll Element Into View   ${meeting_duration_drop_down}
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Element   ${meeting_duration_drop_down}
    Sleep  1s
#    Select Required Value  ${meeting_duration_options}    ${meeting_duration_value}
    Wait And Click Element  xpath: //li[text()="${meeting_duration_value}"]
    Sleep  3s
    IF  "${web_conference_link_text}"!=""
        Should Not Be Empty   ${web_conference_link_input}
    END
    Input Text  ${interviewer_text_box}     ${interviewer_name}
    Sleep  3s
    Click Element   ${interviewer_result}
    Should Not Be Empty     ${no_of_candidates}
    Clear Element Text      ${no_of_candidates}
    Input Text      ${no_of_candidates}   8
    Sleep  3s
    Scroll Element Into View   ${save_and_close_button}
    Sleep  3s
    Wait And Click Element    ${save_and_close_button}
    Sleep  5s



Select calendar year
    [Arguments]  ${calendar_year}
    ${title_value}=  Get Element Attribute  ${year_input}   title
    IF  "${title_value}"!="${calendar_year}"
        Click Element   ${year_increment_link}
        ${title_value_updated}=  Get Element Attribute  ${year_input}   title
        IF  "${title_value_updated}"!="${calendar_year}"
            Click Element   ${year_increment_link}
            ${title_value_updated_next}=  Get Element Attribute  ${year_input}   title
            IF  "${title_value_updated_next}"!= "${calendar_year}"
                Fail    Given date is very much future dated
            END
        END
    END







