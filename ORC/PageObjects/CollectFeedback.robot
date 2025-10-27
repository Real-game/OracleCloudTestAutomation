*** Settings ***
Library  ../Helpers/Helpers.py
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CollectFeedback.robot

*** Keywords ***
Submit Collect Feedback action
    [Arguments]   ${test_data}
    Wait And Click Element  ${continue_button}
        Wait Until Element Is Visible   ${collect_feedback_title}   20   Collect feedback title is not displayed
        Input Text  ${recipient_text_box}   ${test_data}[Recipient Name]
#        Wait Until Element Is Visible   ${first_recipient}   20   First recipient is not displayed
        Wait And Click Element  xpath: //div[text()="${test_data}[Recipient Name]"]
        Click Element  ${continue_button}
        Log  Recipient section is answered
        ${xpath_value}=   Catenate  SEPARATOR=   //*[text()[contains(.,'      ${test_data}[Interview Questionnaire]    ')]]//ancestor::td[contains(@id,'pse2Cf')]/preceding-sibling::td//input[@type='checkbox']/parent::span
        Sleep  6s
#        Click Element  xpath: ${xpath_value}
        Click Element  ${continue_button}
        Log  Select Interview Questionnaire is answered
        Sleep  3s
        ${matching}=  Get WebElements  ${include_doc}
        Log To Console  ${matching}
        FOR  ${e}  IN  @{matching}
            Wait And Click Element  ${e}
        END
        Sleep  3s
        Click Element  ${continue_button}
        Log  Include documents is answered
        Wait Until Element Is Visible   ${expiration_date}   20   Expiration date is not displayed
        Click Element  ${expiration_date}
        Input Text     ${expiration_date}   ${test_data}[Expiration Date]
        Input Text     ${schedule_notes}   ${test_data}[Schedule Notes]
        Scroll Element Into View  ${submit_button}
        Wait And Click Element  ${submit_button}
        Sleep  3s
        Capture Page Screenshot















