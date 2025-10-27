*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/WorkForceCompensationPlans.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click on Pay for Performance
    Wait Until Page Contains  Pay for Performance  20s  Pay for performance link is not displayed
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${pay_for_performance}
    Wait Until Page Contains  Define Workforce Compensation  20s  Pay for performance page is not displayed
    Capture Page Screenshot And Retry If Required

Click Given Plan Link
    [Arguments]  ${plan}
    Sleep  3s
    Wait And Click Element  link: ${plan}
    Wait And Verify Page Contains Text  ${plan}  20s  ${plan} not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Go To Task From given Worksheet Task List
    [Arguments]  ${task}
    Wait Until Page Contains  Define Workforce Compensation  20s  Define Workspace compensation page is not displayed
    Wait And Click Element  xpath: //span[text()="${task}"]/following::a[@title="Go to Task"][1]
    Wait And Verify Page Contains Text  ${task}  20s  '${task}' not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Checkbox Checked
    [Arguments]  ${alert_name}
    mouse over  xpath://textarea[text()="${alert_name}"]/preceding::input[1]
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Sleep  3s
    ${status}=  Run Keyword And Return Status  checkbox should be selected  xpath://textarea[text()="${alert_name}"]/preceding::input[1]
    Log To Console  ${status}
    IF  "${status}"!="True"
        Wait And Click Element  xpath://textarea[text()="${alert_name}"]/preceding::input[1]
        #Fail  Alert not enabled
    END

