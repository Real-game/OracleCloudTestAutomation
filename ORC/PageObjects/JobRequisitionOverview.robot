*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobRequisitionOverview.robot
*** Keywords ***
Click on details button
    Wait And Click Element   ${detail_link}
    Wait Until Element Contains  ${basic_info}   Basic Info
    Capture Page Screenshot
    Log To Console  Navigated to Job Requisition detail page.

Click on Active Applications
    Wait And Click Element  ${active_application}
#    Wait Until Page Contains  Job Applications
    Sleep  10s
    Capture Page Screenshot


Click on Actions dropdown
    Sleep  4s
    Wait And Click Element   ${actions_dropdown}
    Capture Page Screenshot

Click on Suspend Job Requisition
    Sleep  3s
    Select Required Value  ${action_on_job_requisition}  Suspend Job Requisition
    Wait Until Element Is Visible  ${warning_pop_up}
    Capture Page Screenshot
    Element Should Be Visible  ${warning_message_suspend}
    Element Should Be Visible  ${warning_message_yes_button}
    Element Should Be Visible  ${warning_message_no_button}
    Sleep  5s
    ${inner_HTML}=  Get Element Attribute  ${warning_message}  innerHTML
    Should Contain  ${inner_HTML}  suspend the job requisition
    Wait And Click Element  ${warning_message_yes_button}
    Sleep  2s

Verify resume requisition option
    Sleep  3s
    Element Should Be Visible  ${resume_job_requisition}
    Log To Console  Resume job requisition option is listed.

Suspend Job Requisition
    Click on Actions dropdown
    Sleep  2s
    Click on Suspend Job Requisition
    Sleep  5s
    Click on Actions dropdown
    Sleep  2s
    Verify resume requisition option
    Sleep  2s
    Wait And Click Element  ${back_button}

Click on Cancel Job Requisition
    Sleep  3s
    Select Required Value  ${action_on_job_requisition}  Cancel Job Requisition
    Wait Until Element Is Visible  ${warning_pop_up}
    Capture Page Screenshot
    Element Should Be Visible  ${warning_message_cancel}
    Element Should Be Visible  ${warning_message_yes_button}
    Element Should Be Visible  ${warning_message_no_button}
    Sleep  5s
#    ${inner_HTML}=  Get Element Attribute  ${warning_message}  innerHTML
#    Should Contain  ${inner_HTML}  cancel the job requisition
    Wait And Click Element  ${warning_message_yes_button}
    Sleep  5s


Verify reopen requisition option
    Sleep  3s
    Element Should Be Visible  ${reopen_job_requisition}
    Log To Console  Reopen job requisition option is listed.

Cancel Job Requisition
    Click on Actions dropdown
    Sleep  2s
    Click on Cancel Job Requisition
    Sleep  5s
    Click on Actions dropdown
    Sleep  2s
    Verify reopen requisition option
#    Wait And Click Element  ${back_button}

Preview Job Requisition
    Click on Actions dropdown
    Click on Preview Job Requisition

Click on Preview Job Requisition
    Sleep  3s
    Select Required Value  ${action_on_job_requisition}  Preview Job Requisition
    Log  Preview Job Requisition link is clicked

Click on Interviews
    Wait And Click Element  ${interview_btn}
    Wait Until Page Contains  Interview Schedules
    Capture Page Screenshot

Click on Posting link
    Sleep  2s
    Wait And Click Element  ${posting_link}
    Capture Page Screenshot
    Log  Posting link is clicked


Click on Job Formatting link
    Sleep  3s
    Wait And Click Element  ${Job_Formatting_drop_down}
    Capture Page Screenshot
    Log  Job formatting link is clicked
    Sleep  3s
#    Wait And Click Element  ${Employer_description_edit_button}
#    Sleep  2s
#   # Wait And Click Element  ${employer_check_box}
#    Wait And Click Element  ${save_button}


Click on Move to Posting
    Sleep  2s
    Select Required Value  ${action_on_job_requisition}  Move to Posting
    Log  Move to posting link is clicked

Click on Reopen Job Requisition
    Sleep  2s
    Select Required Value  ${action_on_job_requisition}  Reopen Job Requisition
    Log  Redraft job requisition link is clicked
    Capture Page Screenshot
    Sleep   4s
    Element Should Be Visible  ${warning_message}
    Element Should Be Visible  ${warning_message_yes_button}
    Element Should Be Visible  ${warning_message_no_button}
    ${inner_HTML}=  Get Element Attribute  ${warning_message}  innerHTML
    Should Contain  ${inner_HTML}  reopen the job requisition
    Wait And Click Element  ${warning_message_yes_button}
    Sleep  2s
    ${count}=   Get Element Count  ${close_pop_up}
#    IF  ${count}>0
#        Wait And Click Element  ${close_pop_up}
#    END
    Sleep  5s

Click on Redraft Job Requisition
    Sleep  2s
    Select Required Value  ${action_on_job_requisition}  Redraft Job Requisition
    Log  Redraft job requisition link is clicked
    Capture Page Screenshot
    Sleep   4s
    Element Should Be Visible  ${warning_message}
    Element Should Be Visible  ${warning_message_yes_button}
    Element Should Be Visible  ${warning_message_no_button}
    ${inner_HTML}=  Get Element Attribute  ${warning_message}  innerHTML
    Should Contain  ${inner_HTML}  redraft the job requisition
    Wait And Click Element  ${warning_message_yes_button}
    Sleep  2s
    ${count}=   Get Element Count  ${close_pop_up}
    IF  ${count}>0
        Wait And Click Element  ${close_pop_up}
    END
    Sleep  5s

Click on the interviews link
    Wait Until Element Is Visible    ${interviews_link}      20     Interviews link is not displayed
    Capture Page Screenshot
    Click Element   ${interviews_link}
    Log  Interviews link is clicked from the requisition side panel

Click on Overview link in the side panel
    Wait Until Element Is Visible    ${overview_link}      30
    Capture Page Screenshot
    Click Element   ${overview_link}

Add a linked requisition
    [Arguments]  ${data}
    Wait Until Element Is Visible  ${linked_requisition_add_button}  20
    Scroll Element Into View  ${linked_requisition_add_button}
    Click Element  ${linked_requisition_add_button}
    Sleep  2s
    Wait And Click Element   ${link_existing_requisition_link}
    Wait Until Element Is Visible  ${linked_requisition_header}  20
    Click Element  ${link_existing_requisition_input}
    Sleep  2s
    Press keys  ${link_existing_requisition_input}  ${data}
    Sleep  2s
    Press Keys  ${link_existing_requisition_input}  ENTER
    Sleep  3s
    Click Element  ${link_save_and_close_button}
    Sleep  4s

Select advanced search in Staffing Agents
    Wait Until Element Is Visible   ${staffing_agent_drop_down}  20  Staffing agent drop down is not displayed
    Scroll Element Into View  ${staffing_agent_drop_down}
    Click Element  ${staffing_agent_drop_down}
    Capture Page Screenshot
    Sleep  3s
    Wait And Click Element  ${advanced_search_link}
    Wait Until Element Is Visible   ${agents_title}  20  Agents title is not displayed

