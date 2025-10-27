*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ProcessWorkforceCompensationChangeStatements.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click On Run Process Workforce Compensation Change Statements
    Wait And Click Element  ${run_process_workforce_compensation_change_statement}
    Wait And Verify Page Contains Text  Process Workforce Compensation Change Statements  30s  Process Workforce Compensation Change Statements page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Plan
    [Arguments]  ${plan}
    Wait And Click Element  ${plan_drodown}
    Sleep  3s
    Wait And Click Element    xpath: //li[text()="${plan}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Cycle
    [Arguments]  ${cycle}
    Wait And Click Element  ${cycle_drodown}
    Sleep  3s
    Wait And Click Element    xpath://li[text()="${cycle}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Mode
    [Arguments]  ${mode}
    Wait And Click Element  ${mode_drodown}
    Sleep  3s
    Wait And Click Element    xpath: //li[text()="${mode}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Template
    [Arguments]  ${template}
    Wait And Click Element  ${template_drodown}
    Sleep  3s
    Wait And Click Element    xpath: //label[text()="${template}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Visibility
    [Arguments]  ${visibility}
    Wait And Click Element  ${visibility_drodown}
    Sleep  3s
    Wait And Click Element    xpath: //li[text()="${visibility}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click On Run Icon Of Given Process
    [Arguments]  ${process}
    Wait And Click Element  xpath: //span[text()="${process}"]/following::img[1]
    Wait And Verify Page Contains Text  ${process}  30s  ${process} page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Refresh Date
    [Arguments]  ${value}
    Wait And Click Element  ${refresh_date_drodown}
    Sleep  3s
    Wait And Click Element    xpath: //li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Radio Button On Plan Details
    [Arguments]  ${radio_button}
    Wait And Click Element  xpath: //label[text()="${radio_button}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Action Value
    [Arguments]  ${action}
    Wait And Click Element  ${action_drodown}
    Sleep  3s
    Wait And Click Element    xpath: (//li[text()="${action}"])[2]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Action Reason Value
    [Arguments]  ${action_reason}
    Wait And Click Element  ${action_reason_drodown}
    Sleep  3s
    Wait And Click Element    xpath: //li[text()="${action_reason}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Next Button
    Wait And Click Element  ${next_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Element Posting Date
    [Arguments]  ${element_posting_date}
    Wait And Click Element  ${element_posting_date_drodown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${element_posting_date}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Mark Assignment As Processed
    [Arguments]  ${value}
    Wait And Click Element  ${mark_assignment_as_processed_drodown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Pop Up And Click Ok Button
    element should be visible  ${information_pop_ok_button}  Information pop up not found
    Sleep  3s
    Wait And Click Element  ${information_pop_ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Monitor Process Button
    Wait And Click Element  ${monitor_process_button}
    Wait And Verify Page Contains Text  Manage Scheduled Processes  20s  Manage Scheduled Processes page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Refresh Option
    [Arguments]  ${option}
    Wait And Click Element  xpath: //label[text()="${option}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Back Out Level
    [Arguments]  ${value}
    Wait And Click Element  ${back_out_level}
    Sleep  3s
    Wait And Click Element    xpath: //li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required