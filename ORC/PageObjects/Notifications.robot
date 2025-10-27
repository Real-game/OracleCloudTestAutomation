*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Notifications.robot

*** Keywords ***

Search for checklist task notification
    [Arguments]  ${candidate_name}
    Wait Until Page Contains   Assigned to Me  20  Assigned to me tab in notifications page is not displayed
    Sleep  5s
    Click Element  ${all_tab}
    Sleep  5s
    Click Element  ${search_input_in_notifications}
    Press Keys  ${search_input_in_notifications}  ${candidate_name}
    Wait Until Element Is Visible  ${search_result}  20  search result is not displayed
    ${element_text}=  Get Element Attribute  ${search_result}  innerHTML
    ${status}=  Run Keyword And Return Status  Should Contain  ${element_text}  ${candidate_name}
    IF  '${status}'=='True'
          Click Element  ${search_result}
    ELSE
        Capture Page Screenshot
        Click Element  ${worklist_button}
        Sleep  5s
        ${handles}=  Get Window Handles
        Switch Window  ${handles}[1]
        Search for the checklist task in worklist  ${candidate_name}
        Sleep  15s
        Validate the task list in checklist
        Switch Window  ${handles}[0]
    END

Search for the checklist task in worklist
    [Arguments]  ${candidate_name}
    Wait Until Page Contains  BPM Worklist  20  Worklist pop up is not displayed
    Sleep  5s
    Click Element  ${administrative_task_link}
    Sleep  5s
    Select From List By Value   ${status_filter}    0
    Sleep  4s
    Click Element  ${search_input_in_bpm_worklist}
    Press Keys  ${search_input_in_bpm_worklist}   ${candidate_name}
    Click Element  ${search_icon_in_bpm_worklist}
    Sleep  6s
    ${task_xpath}=  Catenate  SEPARATOR=  //a[text()[contains(.,'Tasks')]][text()[contains(.,'   ${candidate_name}  ')]]
    ${element_count}=  Get Element Count  xpath: ${task_xpath}
    IF  "${element_count}"=="0"
        Fail
    ELSE
        ${element_list}=  Get WebElements  xpath: ${task_xpath}
        Click Element  ${element_list}[0]
    END

Click on Notifications Done button
    Wait Until Page Contains  Notifications  20  Notifications page is not displayed
    Capture Page Screenshot
    Click Element  ${notifications_done_button}

Validate the task list in checklist
        ${handles}=  Get Window Handles
        Switch Window  ${handles}[2]
        Sleep  4s
        Wait Until Page Contains  Welcome Page - Onboarding  20s
        Wait Until Page Contains  Metrolinx Policies  5s
        Wait Until Page Contains  Conditions Of Employment  5s
        Wait Until Page Contains  ID Picture Request  5s
        Wait Until Page Contains  Internet Acknowledgement  5s
        Wait Until Page Contains  Family and Emergency Details  5s
        Wait Until Page Contains  Direct Deposit  5s
        Wait Until Page Contains  Tax Form Instructions  5s
        Wait Until Page Contains  Tax Forms-TD1ON  5s
        Wait Until Page Contains  Tax Forms-TD1  5s
        Wait Until Page Contains  AODA Training  5s
        Wait Until Page Contains  OHSA Training  5s
        Wait Until Page Contains  Personal Information  5s
        Wait Until Page Contains  MX COVID VACCINATION PROOF  5s
        Wait Until Page Contains  Thank You  5s
        Close Window


Search for checklist notification of a candidate
    [Arguments]  ${candidate_name}
    Wait Until Page Contains   Assigned to Me  20  Assigned to me tab in notifications page is not displayed
    Sleep  5s
    Click Element  ${all_tab}
    Sleep  5s
    Click Element  ${search_input_in_notifications}
    Press Keys  ${search_input_in_notifications}  Checklist Task Summary
    Sleep  5s
    Press Keys  ${search_input_in_notifications}  ENTER
    Wait Until Page Contains  ${candidate_name}  20s  Checklist Task Summary for the searched candidate is not displayed
    Capture Page Screenshot

Search for checklist notification of a internal candidate
    Wait Until Page Contains   Assigned to Me  20  Assigned to me tab in notifications page is not displayed
    Sleep  5s
    Click Element  ${search_input_in_notifications}
    Press Keys  ${search_input_in_notifications}  You have a new journey
    Sleep  5s
    Press Keys  ${search_input_in_notifications}  ENTER
    Wait Until Page Contains  Internal Journeys  20  You have a new journey page is not displayed
    Capture Page Screenshot
