*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  ../Keywords/CommonKeywords.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/SynchronizeGradeStepRates.robot


*** Keywords ***
Check Grade Ladder Group from Batch Type
    Wait And Click Element  ${grade_ladder_group}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Under Grade Ladder Group dropdown Select
    [Arguments]  ${grade_ladder_group_dropdown_value}
    Wait And Click Element  ${grade_ladder_group_dropdown}
    Sleep  3s
    IF  "${grade_ladder_group_dropdown_value}"!=""
        Wait And Click Element  xpath: //li[text()="${grade_ladder_group_dropdown_value}"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Effective date to remain as current date
    ${fdate}=  Get Current Date Dd Mmm Yyyy
    Wait And Set Text  ${effective_date}  ${fdate}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Button
    Wait And Click Element  ${bttn_submit}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Ok To Confirm
    Wait And Click Element  ${ok_popup_button}
    Sleep  3s

Verify active checkbox is enabled
    ${checker}=  RUN KEYWORD And Return Status  checkbox should be selected  ${active_checkbox}
    IF  '${checker}' == 'False'
        Wait And Click Element  ${click_active}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Suspended checkbox is disabled
    ${checker}=  RUN KEYWORD And Return Status  checkbox should not be selected  ${suspended_checkbox}
    IF  '${checker}' == 'False'
        Wait And Click Element  ${click_suspend}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Effective Date in Synchronize Grade Step Rates
    [Arguments]  ${effective_date_value}
    Wait And Set Text  ${effective_date}  ${effective_date_value}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

