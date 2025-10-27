*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/PersonalPaymentMethod.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Select Employee in Personal Payment Method
    [Arguments]  ${input}
    Wait And Set Text  ${search_for_a_Person}  ${input}
    Wait And Verify Page Contains Element  ${select_person}  5s  Employee details is not displayed
    Wait And Click Element  ${select_person}
    Capture Page Screenshot And Retry If Required

Select Action from Dropdown
    [Arguments]  ${action}  ${child_action}
    Wait And Click Element  ${action_dropdown}
    Select Required Value  ${action_value}  ${action}
    IF  '${child_action}'!=''
        Select Required Value  ${action_value}  ${child_action}
    END
    Wait And Verify Page Contains Text  Personal Payment Methods  20s  Personal payment method page is not displayed
    Capture Page Screenshot And Retry If Required

Verify Employee has Bank Account
    Wait And Verify Page Contains Element  ${bank_accounts}  10s  Employee don't have any bank account
    Sleep  2s

Select Cancel button
    Wait And Click Element  ${cancel}
    Sleep  2s
    Capture Page Screenshot And Retry If Required