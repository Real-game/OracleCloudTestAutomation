*** Settings ***
Library  ../Helpers/Helpers.py
Library  AutoItLibrary
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/InternalOnboardingProcess.robot

*** Keywords ***

Complete Personal information task
#    Wait Until Page Contains  Personal Information  20s  Personal Information task is not displayed
    Click Element   ${congratulations_page_chevron_icon}
    Sleep  3s


Click on Done button of a internal onboarding checklist task
    Capture Page Screenshot
    Wait And Click Element  ${internal_onboarding_done_button}

Complete Benefits Explanation task
    Wait Until Page Contains  Benefits Explanation  20s  Benefits Explanation task is not displayed
    Click Element   ${benefits_explanation_chevron_icon}
    Sleep  5s
    Scroll Element Into View   ${file_picker_icon}
    Wait And Click Element  ${file_picker_icon}

Welcome video task
#    Wait Until Page Contains  Benefits Explanation  20s  Benefits Explanation task is not displayed
    Click Element   ${welcome_video_chevron_icon}
    Sleep  5s
#    Scroll Element Into View   ${file_picker_icon}
#    Wait And Click Element  ${file_picker_icon}

Banking Information task
#    Wait Until Page Contains  Benefits Explanation  20s  Benefits Explanation task is not displayed
    Click Element   ${banking_chevron_icon}
    Sleep  5s
#    Scroll Element Into View   ${file_picker_icon}
#    Wait And Click Element  ${file_picker_icon}

Upload file
    [Arguments]  ${file}
    IF  "${file}"!=""
        Scroll Element Into View   ${file_picker_icon}
        Wait And Click Element  ${file_picker_icon}
        Attach File  ${file}
        execute javascript  window.scrollTo(0,document.body.scrollHeight)
        Capture Page Screenshot
    END
    Sleep  20s

Complete Questions Support task
    Wait Until Page Contains  Questions/Support  20s  Questions/Support task is not displayed
    Click Element   ${questions_support_chevron_icon}
    Sleep  5s
    Capture Page Screenshot
