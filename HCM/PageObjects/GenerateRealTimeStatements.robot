*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/GenerateRealTimeStatements.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Select Manager as
    [Arguments]  ${manager}
    Wait And Set Text  ${manager_hierarchy}  ${manager}
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Select Template from dropdown
    [Arguments]  ${templates}
    Wait And Click Element  ${template_dropdown}
    IF  "${templates}"!=""
        Wait And Click Element  xpath: //li[text()= "${templates}"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Click Generate Real Time Statements Button
    Wait And Click Element  ${generate_real_time_statements_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click OK button for Confirmation
    Wait And Click Element  ${confirmation_ok}
    Sleep  3s
    Capture Page Screenshot And Retry If Required