*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AbsenceAdministration.robot

*** Keywords ***

Click on schedule and monitor absence process
    Wait And Click Element   ${schedule_monitor_process}
    Sleep  5s
    wait until page contains  Submit Jobs  20s  Submit jobs section is not displayed
    Capture Page Screenshot And Retry If Required
    Log To Console  Navigated to Schedule and Monitor Absence Process page.

Click on Absence Records link
    Wait Until Page Contains  Absence Administration  20s  Absence Administration page is not displayed
    Capture Page Screenshot
    Click Element  ${absence_records_link}
    Wait Until Page Contains  Absence Records  20s  Absence Records page is not displayed
    Capture Page Screenshot

Add a Absence Record
    [Arguments]  ${absence_type_value}  ${absence_start_date_value}  ${absence_end_date_value}  ${absence_reason_value}
    Sleep  5s
    Click Element  ${absence_type_drop_down}
    ${xpath}=  Catenate  SEPARATOR=  //li[text()='  ${absence_type_value}  ']
    Click Element  xpath: ${xpath}
    Sleep  10s
    Wait Until Page Contains  Start Date  20s  Start date field and its section are not displayed
    Click Element  ${start_date_input}
    Sleep  7s
    Input Text  ${start_date_input}  ${absence_start_date_value}
    Sleep  7s
    Click Element  ${end_date_input}
    Sleep  7s
    Input Text  ${end_date_input}  ${absence_end_date_value}
    Sleep  7s
    Click Element  ${end_date_time_input}
    Sleep  3s
    Click Element  ${reason_drop_down}
    ${reason_xpath}=  Catenate  SEPARATOR=  //li[text()='   ${absence_reason_value}  ']
    Click Element  xpath: ${reason_xpath}
    Sleep  5s
    Click Element  ${submit_button}
    Wait Until Page Contains  Confirmation  45s  Confirmation pop up is not displayed
    Capture Page Screenshot
    Click Element  ${ok_button}
    Wait Until Page Contains  Manage Absences and Entitlements  20s  Manage Absences and Entitlements page is not displayed
    Wait Until Page Contains   ${absence_type_value}  20s  Added Absence type is not displayed
    Wait Until Page Contains   ${absence_start_date_value}  20s  Added Absence start date is not displayed
    Wait Until Page Contains   ${absence_end_date_value}  20s  Added Absence end date is not displayed



