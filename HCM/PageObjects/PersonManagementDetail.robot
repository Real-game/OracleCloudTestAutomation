*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/PersonManagementDetail.robot

*** Keywords ***

Terminate the employee
    [Arguments]  ${termination_reason_input}   ${notification_date_value}  ${termination_date_value}  ${processing}  ${processing_date}
    Wait Until Page Contains  Employment  20s  Employment page is not displayed
    Wait And Click Element  ${tasks_icon}
    Sleep  2s
    Wait And Click Element  ${work_relationship_link}
    Wait Until Page Contains  Work Relationship:  20s  work relationship page is not displayed
    Wait And Click Element  ${actions_drop_down}
    Sleep  2s
    Wait And Click Element  ${terminate_link}
    Wait Until Page Contains  Terminate Work Relationship  20s  Terminate Work Relationship page is not displayed
    Wait And Click Element  ${termination_action_drop_down}
    Sleep  5s
    Wait And Click Element  ${termination_option}
    Sleep  5s
    Wait And Click Element  ${reason_drop_down}
    Sleep  5s
    ${termination_reason_xpath}=  Catenate  SEPARATOR=  (//li[text()='  ${termination_reason_input}  '])[2]
    Wait And Click Element  xpath: ${termination_reason_xpath}
    Wait And Input Text From Input   ${notification_date_drop_down}  ${notification_date_value}
    Sleep  4s
    Wait And Input Text From Input   ${termination_date_drop_down}  ${termination_date_value}
    Sleep  5s
    Wait And Click Element  ${review_button}
    Wait Until Page Contains  Review Terminate Work Relationship  20s  Review Work Termination page is not displayed
    Sleep  4s
    Wait And Click Element  ${submit_button}
    Wait Until Page Contains  Warning  20s  Warning pop up is not displayed
    IF  "${processing}"=="Deferred"
        Wait And Click Element  ${deferred_radio_button}
        Apply MX Accruals Bank Validation Report  ${process_change_on}  ${processing_date}
    END
    Sleep  4s
    Wait And Click Element  ${yes_button_pop_up}
    Wait Until Page Contains  Confirmation  120s  Confirmation pop up is not displayed
    Wait And Click Element  ${ok_pop_up}
    Wait Until Page Contains  Work Relationship:  20s  Work relationship page is displayed
    Wait And Click Element  ${done_button}
