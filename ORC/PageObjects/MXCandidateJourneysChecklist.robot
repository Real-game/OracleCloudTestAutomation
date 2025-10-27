*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/MXCandidateJourneysChecklist.robot

*** Keywords ***

Reopen an completed task
    Wait Until Element Is Visible  ${completed_task_label}  20  Completed task label is not displayed
    ${completed_task_label_value}=  Get Element Attribute  ${completed_task_label}  innerHTML
    Log To Console  Task value is ${completed_task_label_value}
    Sleep  15s
    ${element_list}=  Get WebElements  ${completed_check_box}
    ${element_list_length}=  Get Length  ${element_list}
    ${status}=  Run Keyword And Return Status  Should Not Be Empty  ${element_list}
    IF  '${status}'=='True'
        FOR  ${element}  IN  ${element_list}
             Scroll Element Into View  ${element}[0]
             Click Element   ${element}[0]
             Sleep  5s
             Capture Page Screenshot
             Exit For Loop
        END
    END
    Scroll Element Into View  ${reopen_button}
    Sleep  3s
    Click Element  ${reopen_button}
    Sleep  20s
    ${element_list_after_reopen}=  Get WebElements  ${completed_check_box}
    ${element_list_after_reopen_length}=  Get Length  ${element_list_after_reopen}
    IF  "${element_list_length}"=="${element_list_after_reopen_length}"
        Fail  After reopening the completed task number has not reduced
    END


Reassign a open task
    [Arguments]   ${reassignee_name_value}
    Sleep  4s
    ${element_list}=  Get WebElements  ${checklist_menu_icon}
    FOR  ${element}  IN  ${element_list}
        Click Element  ${element}[0]
        Capture Page Screenshot
        Exit For Loop
        Sleep  3s
    END
    ${reassign_element_list}=  Get WebElements  ${reassign_task_link}
    FOR  ${element_reassign}  IN  ${reassign_element_list}
        Click Element  ${element_reassign}[0]
        Capture Page Screenshot
        Exit For Loop
        Sleep  3s
    END
    Sleep  15s
    ${reassigned_task_name}=   Get Element Attribute  ${reassign_task_name}  innerHTML
    Click Element  ${reassignee_name_input}
    Press Keys  ${reassignee_name_input}  ${reassignee_name_value}
    Wait Until Element Is Visible  ${reassignee_highlighted_result}  20s  Reassignee search result is not displayed.
    Click Element  ${reassignee_highlighted_result}
    Sleep  4s
    Capture Page Screenshot
    Click Element  ${reassign_save_button}
    Sleep  4s
    Wait Until Page Contains  ${reassignee_name_value}
    [Return]  ${reassigned_task_name}

Remove a open task
    Sleep  4s
    ${element_list}=  Get WebElements  ${task_list}
    ${element_list_length}=  Get Length  ${element_list}
    ${element_list}=  Get WebElements  ${checklist_menu_icon}
    FOR  ${element}  IN  ${element_list}
        Click Element  ${element}[0]
        Capture Page Screenshot
        Exit For Loop
        Sleep  3s
    END
    ${remove_element_list}=  Get WebElements  ${remove_task_link}
    FOR  ${element_remove}  IN  ${remove_element_list}
        Click Element  ${element_remove}[0]
        Capture Page Screenshot
        Exit For Loop
        Sleep  3s
    END
    Wait Until Element Is Visible  ${remove_confirmation_button}  20
    Click Element  ${remove_confirmation_button}
    Sleep  4s
    Capture Page Screenshot
    Sleep  20s
    ${element_list_after_remove}=  Get WebElements  ${task_list}
    ${element_list_after_remove_length}=  Get Length  ${element_list_after_remove}
    IF  "${element_list_length}"=="${element_list_after_remove_length}"
        Fail  After removing the total task number has not reduced
    END


Send a reminder task
    Sleep  4s
    ${element_list}=  Get WebElements  ${checklist_menu_icon}
    FOR  ${element}  IN  ${element_list}
        Click Element  ${element}[0]
        Capture Page Screenshot
        Exit For Loop
        Sleep  3s
    END
    ${reminder_element_list}=  Get WebElements  ${send_a_reminder_task_link}
    FOR  ${element_reminder}  IN  ${reminder_element_list}
        Click Element  ${element_reminder}[0]
        Capture Page Screenshot
        Exit For Loop
        Sleep  3s
    END
    Sleep  15s

Verify the reassigned task in My Tasks
    [Arguments]   ${reassigned_task_name}   ${candidate_name}
    Wait And Click Element  ${my_tasks_tab}
    Wait Until Page Contains Element  ${my_tasks_header}  20  My tasks tab is not highlighted
    Wait Until Page Contains  Conditions Of Employment  20  Reassigned task name is not displayed
    Wait Until Page Contains  ${candidate_name}  20  Reassigned task tied candidate is not displayed
    Sleep  10s

Remove a open task in My Tasks tab
    Sleep  4s
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Click Element  ${my_tasks_action_button}
    Click Element  ${remove_task_link}
    Wait Until Element Is Visible  ${remove_confirmation_button}  20
    Click Element  ${remove_confirmation_button}
    Sleep  4s
    Capture Page Screenshot
    Sleep  20s

