*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/RunGradeStepProgression.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Select Grade Ladder Menu
    [Arguments]  ${menu}
    Wait And Click Element  ${grade_ladder_dropdown}
    Sleep  3s
    IF  "${menu}"!=""
        Wait And Click Element  xpath: //span[text()="${menu}"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Check Grade Ladder Group Radio Button
    Wait And Click Element  ${grade_ladder_group_radio_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Grade Ladder Group Menu
    [Arguments]  ${group_menu}
    Wait And Click Element  ${grade_ladder_group_dropdown}
    Sleep  3s
    IF  "${group_menu}"!=""
        Wait And Click Element  xpath: //li[text()="${group_menu}"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Click Submit Button
    Wait And Click Element  ${submit_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Ok To Confirm
    Wait And Click Element  ${ok_popup_button}
    Sleep  3s

Get And Return Process Id
    Sleep  3s
    ${text}=  Wait And Get Text  ${submission_confirmation_number}
    Log  Confirmation Message: ${text}
    ${id}=  getProcessId  ${text}
    Log  Process ID is ${id}
    [Return]  ${id}

Select Warning Button
    [Arguments]  ${value}
    wait until element is visible  xpath: //button[text()="${value}"]  30s
    Sleep  3s
    Wait And Click Element  xpath: //button[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

