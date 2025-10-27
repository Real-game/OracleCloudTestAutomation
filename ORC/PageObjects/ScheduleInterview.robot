*** Settings ***
Library  Selenium2Library
Resource  ScheduleInterview.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click on Cancel Interview Schedule
#     Wait Until Element Is Visible    ${schedule_interview_page_header}     20   Schedule Interview page header is still not displayed
     ${handles}=  Get Window Handles
     Switch Window  ${handles}[1]
     Click Element  ${actions_drop_down}
     Wait Until Element Is Visible    ${cancel_interview_link}     20   Cancel Interview link is still not displayed
     Capture Page Screenshot
     Click Element  ${cancel_interview_link}
     Sleep  4s
     Wait Until Element Is Visible    ${yes_button}     20   Yes button is still not displayed
     Click Element  ${yes_button}
     Sleep  5s
     Close Window
     Switch Window  ${handles}[0]

Verify interview Details is Visible
     Sleep  6s
     ${handles}=  Get Window Handles
     Switch Window  ${handles}[1]
     Wait Until Page Contains   Interview Details  20  Interview details page is not displayed
     Close Window
     Switch Window  ${handles}[0]


Verify user is in schedule interview header page
    Sleep  6s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Sleep  4s
    Wait Until Element Is Visible    ${schedule_interview_page_header}     20   Schedule Interview page header is still not displayed
    Sleep  3s
    Click Element  ${date_field}
    Sleep  3s
    #Click Element  ${date_result}
    #Sleep  7s
    Click Element   ${save_button_interview_calendar_page}
    Sleep  3s
    Close Window
    Switch Window  ${handles}[0]
    Sleep  10s




