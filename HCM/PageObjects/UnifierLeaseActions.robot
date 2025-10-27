*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierLeaseActions.robot

*** Keywords ***

Click on Create lease actions button
    Sleep  20s
    ${check}=  Run keyword and Return Status  Wait Until Element Is Visible  ${lease_actions_frame}  20s  Lease actions frame is not displayed
    IF  '${check}'=='True'
        Select frame  ${lease_actions_frame}
        Sleep  20s
    END
    Wait Until Element Is Visible  ${create_lease_action_button}  30s  Create lease actions button is not displayed
    Capture Page Screenshot
    Click Element  ${create_lease_action_button}
    Unselect Frame

Select lease actions frame
    ${check}=  Run keyword and Return Status  Wait Until Element Is Visible  ${lease_actions_frame}  20s  Lease actions frame is not displayed
    IF  '${check}'=='True'
        Select frame  ${lease_actions_frame}
        Sleep  20s
    END

Search for the lease action record
    [Arguments]  ${lease_action_number}
    Wait Until Element Is Visible  ${search_lease_action_icon}  60s
    Click Required Element  ${search_lease_action_icon}
    Sleep  5s
    Capture Page Screenshot
    Click Required Element  ${record_number_input}
    Input Text  ${record_number_input}  ${lease_action_number}
    Sleep  5s
    Click Required Element  ${search_lease_action_apply}
    Sleep  3s
    Capture Page Screenshot

Verify the presence of lease action record
    [Arguments]  ${lease_action_number}
    ${lease_action_record_xpath}=  Catenate  SEPARATOR=  //a[text()='${lease_action_number}']
    Wait Until Element Is Visible  xpath: ${lease_action_record_xpath}  10s
    Capture Page Screenshot
