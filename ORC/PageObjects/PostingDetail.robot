*** Settings ***
Library  ../Helpers/Helpers.py
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/PostingDetail.robot


*** Keywords ***
Verify Career Site Sections
    Wait Until Element Is Visible  ${internal_career_site_section}  20
    Log  Internal Career Site section is displayed
    Wait Until Element Is Visible  ${external_career_site_section}  20
    Log  External Career Site section is displayed

Edit Internal Career Site Posting Information
    [Arguments]   ${calendar_date}
    Wait Until Element Is Visible  ${internal_career_site_edit_button}  20
    Click Element  ${internal_career_site_edit_button}
    Sleep  2s
    Wait Until Element Is Visible  ${internal_career_site_posting_drop_down}  20
    Click Element  ${internal_career_site_posting_drop_down}
    Sleep  2s
    Wait Until Element Is Visible  ${internal_career_site_post_now_drop_down}  20
    Click Element   ${internal_career_site_post_now_drop_down}
    Sleep  4s
    Wait And Click Element   ${expiry_date_calendar_icon}
    Sleep  2s
    Select Calendar date    ${calendar_date}
    Wait Until Element Is Visible  ${save_button}  20
    Click Element   ${save_button}
    Capture page screenshot

Select Calendar date
    [Arguments]  ${calendar_date}
    ${calendar_value}=  Split String    ${calendar_date}    -
    Log To Console      ${calendar_value}
    Log To Console      1st value is ${calendar_value}[1]
    Log To Console      2nd value is ${calendar_value}[2]
    Log To Console      3rd value is ${calendar_value}[0]
    Click Element   ${year_option_selection}
    Sleep  2s
    ${length}=  Get Length  ${calendar_value}[2]
    IF  "${length}"=="4"
        Select Required Value  ${year_value}    ${calendar_value}[2]
        Sleep  3s
    ELSE
        ${matching_elements}=  Get WebElements   ${year_value}
        FOR  ${element}  IN  @{matching_elements}
            ${text}=    Get Text  ${element}
            ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${calendar_value}[2]
            IF  '${status}'=='True'
                Wait And Click Element  ${element}
                Exit For Loop
            END
        END
        Sleep  2s
    END
    Select Required Value  ${year_value}    ${calendar_value}[1]
    Sleep  2s
    Select Required Value  ${date_value}    ${calendar_value}[0]
    Sleep  2s
    Wait Until Element Is Visible  ${set_time}  20
    Click Element   ${set_time}
    Sleep  2s
    #Wait Until Element Is Visible  ${set_hour}  20
    #Click Element   ${set_hour}
    #Wait Until Element Is Visible  ${set_minutes}  20
    #Click Element   ${set_minutes}
    #Wait Until Element Is Visible  ${set_AM_PM}  20
    #Click Element   ${set_AM_PM}
    Wait Until Element Is Visible  ${ok_button}  20
    Click Element   ${ok_button}


Select Calendar date Post Later
    [Arguments]  ${calendar_date}
    ${calendar_value}=  Split String    ${calendar_date}    -
    Log To Console      ${calendar_value}
    Log To Console      1st value is ${calendar_value}[1]
    Log To Console      2nd value is ${calendar_value}[2]
    Log To Console      3rd value is ${calendar_value}[0]
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    #Wait Until Element Is Visible  ${year_option_selection}  20
    #Scroll Element Into View  ${year_option_selection}
    #Click Element   ${year_option_selection}
    #Select Required Value  ${year_value}    ${calendar_value}[2]
    Sleep  3s
    Select Required Value  ${year_value}    ${calendar_value}[1]
    Sleep  2s
    Select Required Value  ${date_value}    ${calendar_value}[0]
    Sleep  2s
    Wait Until Element Is Visible  ${set_time}  20
    Scroll Element Into View  ${set_time}
    Click Element   ${set_time}
    #Wait Until Element Is Visible  ${set_hour}  20
    #Click Element   ${set_hour}
    #Wait Until Element Is Visible  ${set_minutes}  20
    #Click Element   ${set_minutes}
    #Wait Until Element Is Visible  ${set_AM_PM}  20
    #Click Element   ${set_AM_PM}
    Wait Until Element Is Visible  ${ok_button_post_later}  20
    Scroll Element Into View  ${ok_button_post_later}
    Click Element   ${ok_button_post_later}



Edit External Career Site Posting Information
    [Arguments]   ${start_date}   ${expiry_date}
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Wait Until Element Is Visible  ${external_career_site_edit_button}  20
    Click Element  ${external_career_site_edit_button}
    Wait Until Element Is Visible  ${internal_career_site_posting_drop_down}  20
    Scroll Element Into View  ${internal_career_site_posting_drop_down}
    Click Element  ${internal_career_site_posting_drop_down}
    Scroll Element Into View  ${internal_career_site_post_later_drop_down}
    Wait Until Element Is Visible  ${internal_career_site_post_later_drop_down}  20
    Click Element   ${internal_career_site_post_later_drop_down}
    Wait Until Element Is Visible  ${start_date_calendar_icon}  20
    Scroll Element Into View  ${start_date_calendar_icon}
    Wait And Click Element   ${start_date_calendar_icon}
    Select Calendar date Post Later    ${start_date}
    Scroll Element Into View  ${expiry_date_calendar_icon}
#    Wait And Click Element   ${expiry_date_calendar_icon}
#    Select Calendar date Post Later    ${expiry_date}
    Wait Until Element Is Visible  ${save_button}  20
    Click Element   ${save_button}


Edit External Career Site Posting Information Section
    [Arguments]   ${calendar_date}
    Wait Until Element Is Visible  ${external_career_site_edit_button}  20
    Click Element  ${external_career_site_edit_button}
    Sleep  2s
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Sleep  2s
    Wait Until Element Is Visible  ${internal_career_site_posting_drop_down}  20
    Click Element  ${internal_career_site_posting_drop_down}
    Sleep  2s
    Wait Until Element Is Visible  ${internal_career_site_post_now_drop_down}  20
    Click Element   ${internal_career_site_post_now_drop_down}
    Sleep  4s
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Sleep  2s
    Scroll Element Into View  ${expiry_date_calendar_icon}
    Wait And Click Element   ${expiry_date_calendar_icon}
    Sleep  2s
    Select Calendar date    ${calendar_date}
    Wait Until Element Is Visible  ${save_button}  20
    Scroll Element Into View  ${expiry_date_calendar_icon}
    Sleep  2s
    Click Element   ${save_button}
    Capture page screenshot



