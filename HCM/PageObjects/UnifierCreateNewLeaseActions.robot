*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierCreateNewLeaseActions.robot

*** Keywords ***

Switch to lease actions window
    Sleep  5s
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]

Validate lease or contract progress updates block
    [Arguments]  ${lease_action_progress_value}  ${date_completed_value}  ${completion_action_details_comment_value}
    Wait Until Element Is Visible  ${lease_action_progress_drop_down}  20s  Lease Action progress drop down is not displayed
    Click Element  ${lease_action_progress_drop_down}
    ${xpath}=   Catenate  SEPARATOR=  //li/div[text()='${lease_action_progress_value}']
    Click Element  xpath: ${xpath}
    Sleep  3s
    Input Text  ${date_completed_input}  ${date_completed_value}
    Input Text  ${completion_action_details_input}  ${completion_action_details_comment_value}
    Capture Page Screenshot
    Click Element  ${send_button}

Validate Workflow Action Details dialog
    Wait Until Element Is Visible  ${workflow_actions_drop_down}  30s  Workflow Actions drop down is not displayed
    Sleep  5s
    Click Element  ${workflow_actions_drop_down}
    Wait Until Element Is Visible  ${send_for_review_option}  30s  Send for review option is not displayed
    Click Element  ${send_for_review_option}
    Click Element  ${send_button_in_dialog}


Extract the lease action number from the confirmation message
    Wait Until Element Is Visible  ${confirmation_message_text}  60s  Confirmation message is not displayed
    Capture Page Screenshot
    ${confirmation_text}=   Get Element Attribute  ${confirmation_message_text}  innerHTML
    Click Element  ${ok_button_confirmation_pop_up}
    [return]  ${confirmation_text}