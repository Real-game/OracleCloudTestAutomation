*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/TerminateWorkRelationship.robot

*** Keywords ***
Fill Details On When and Why Page
    [Arguments]  ${notification_date}  ${effect_date}  ${way}  ${change_reason}  ${termination_reason_value}
    Wait And Set Text  ${termination_notification_date}  ${notification_date}
    Sleep  3s
    Wait And Set Text  ${termination_effect_date}  ${effect_date}
    Sleep  3s
    IF  "${way}"!=""
        Wait And Click Element  ${termination_way_dropdown}
        Sleep  3s
        Wait And Click Element  //div[text()='${way}']
    END
    IF  "${termination_reason_value}"!=""
        Wait And Click Element  ${termination_reason}
        Sleep  3s
        Wait And Click Element  //div[text()='Personal Reasons']
    END
    IF  "${change_reason}"!=""
        Wait And Click Element  ${termination_why_changing_direct_reports}
        Sleep  3s
        Wait And Click Element  //div[text()='${change_reason}']
    END
    Sleep  3s
    capture page screenshot

Check Select All
    Wait And Click Element  ${select_all_checkbox}
    Sleep  3s
    capture page screenshot

Search And Select Proposed Manager
    [Arguments]  ${search_value}
    Wait And Send Keys  ${search_proposed_manager}  ${search_value}
    Sleep  3s
    Wait And Click Element  ${select_proposed_manager_from_result}
    Sleep  3s
    capture page screenshot

Click Continue Button
    Wait And Click Element  ${button_continue}
    Sleep  3s
    capture page screenshot

Click Submit Button
    Wait And Click Element  ${button_submit}
    Sleep  3s
    capture page screenshot