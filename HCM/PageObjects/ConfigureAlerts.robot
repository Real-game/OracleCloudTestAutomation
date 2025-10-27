*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ConfigureAlerts.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Verify Alerts Checkbox is Checked
    [Arguments]  ${alert_name}
    ${missing_performance_rating_checkbox}=  Catenate   SEPARATOR=  //textarea[text()='${alert_name}']//preceding::input[contains(@id,'cbEnabledFlagB2::content')][1]
    scroll element into view  ${missing_performance_rating_checkbox}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Sleep  3s
    ${status}=  Run Keyword And Return Status  checkbox should be selected  ${missing_performance_rating_checkbox}
    Log To Console  ${status}
    IF  "${status}"!="True"
        Wait And Click Element  ${missing_performance_rating_checkbox}
        Sleep  2s
        Wait And Click Element  ${save_and_close}
        Sleep  5s
    END
    Capture Page Screenshot And Retry If Required

Click Save And Close
    Wait And Click Element  ${save_and_close}
    Sleep  5s
    Capture Page Screenshot And Retry If Required
