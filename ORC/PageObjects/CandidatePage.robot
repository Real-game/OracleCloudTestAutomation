*** Settings ***
Library  Selenium2Library
Resource  ../PageObjects/AddInteraction.robot
Resource  ../PageObjects/MoveCandidate.robot
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CandidatePage.robot

*** Keywords ***
Click on Actions and Select
    [Arguments]  ${data}
    Wait Until Page Contains  Key Highlights  20s  Candidate detail page is not displayed
    IF  "${data}[Offer Action]"=="Delete Job Application"
        Click on Move
        Select State  ${data}[Move to State]
        Click on Save
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Capture Page Screenshot
        Handle Warning  ${data}[Option on Warning]
    ELSE IF  "${data}[Offer Action]"=="Add Interaction"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Capture Page Screenshot
        Set Interaction Type  ${data}[Interaction Type]
    ELSE IF  "${data}[Offer Action]"=="Create Job Offer"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait Until Page Contains  Create Job Offer
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Edit Offer"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Sleep  2s
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait Until Page Contains  Edit Job Offer
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Extend Offer"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Sleep  2s
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Check Duplicates"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait Until Page Contains  Potential Duplicates
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Redraft Offer"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Sleep  2s
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Move to HR"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Wait Until Page Contains  Confirmation  300s
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Preview Offer"
        Sleep  10s
        Wait And Click Element  ${actions_btn}
        Sleep  10s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Wait Until Page Contains  Preview Offer  20
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Accept Offer"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  ${data}[Offer Action]  ')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Add to Linked Requisition"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        Select Required Value  ${actions_table}  ${data}[Offer Action]
        Sleep  3s
        Capture Page Screenshot
    ELSE IF  "${data}[Offer Action]"=="Move to HR"
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        Select Required Value  ${actions_table}  ${data}[Offer Action]
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Wait Until Page Contains  Confirmation  50s
        Capture Page Screenshot
    END

Click on Activity Button
    Wait And Click Element  ${activity_btn}
    Sleep  3s
    Capture Page Screenshot

Select Job Application Filter
    [Arguments]  ${value}
    Wait And Click Element  ${JA_dropdown}
    Sleep  3s
    Select Required Value  ${table}  ${value}
    Capture Page Screenshot

Click on Next
    Wait And Click Element  ${next_btn}
    Sleep  3s
    Capture Page Screenshot

Click on Move
    Wait And Click Element  ${move_btn}
    Wait Until Page Contains  Move Candidate  60s
    Capture Page Screenshot

Handle Warning
    [Arguments]  ${value}
    Wait Until Element Contains  ${popup}  Warning
    Capture Page Screenshot
    IF  '${value}'==''
        Wait And Click Element  ${close_popup}
        Sleep  3s
        Capture Page Screenshot
    ELSE
        Select Required Value  ${popup_option}  ${value}
        Sleep  3s
        Capture Page Screenshot
    END

Click on Attachments
    Wait And Click Element  ${attachments_btn}
    Sleep  3s
    Capture Page Screenshot

Download Attached Files
    Wait And Click Element  ${view_downarrow}
    Sleep  3s
    Wait And Click Element  ${select_list}
    Sleep  3s
    ${matching_elements}=  Get WebElements   ${download_btn}
    FOR  ${element}  IN  @{matching_elements}
        Wait And Click Element  ${element}
    END
    Wait And Click Element  ${view_downarrow}
    Sleep  3s
    Wait And Click Element  ${select_preview}
    Sleep  3s



Upload Internal Docs
    [Arguments]  ${file}
    IF  "${file}"!=""
        Sleep  5s
        Wait And Click Element  ${Attach_img}
#        Wait And Click Element  ${addfile_link}
        Attach File  ${file}
    END

Review personal details
    [Arguments]  ${value}
    Wait And Click Element  ${pd_dropdown}
    Sleep  5s
    scroll element into view  ${pd_firstname}
    Sleep  5s
    Mouse Over  ${pd_firstname}
    ${fname}=  Get Text  ${pd_firstname}
    ${status}=  Run Keyword And Return Status  Should Contain  ${value}  ${fname}
    Mouse Over  ${pd_lastname}
    ${lname}=  Get Text  ${pd_lastname}
    ${status1}=  Run Keyword And Return Status  Should Contain  ${value}  ${lname}
    Run Keyword If  "${status}"=="True" and "${status1}"=="True"  Log  personal Info validation successfull
    Capture Page Screenshot

Click on Questions Button
    Wait And Click Element  ${questions_btn}
    Sleep  3s
    Capture Page Screenshot

Review Questions block
    [Arguments]  ${dic}
    ${ans1}=  Get Text  ${question_sec_1}
    ${ans2}=  Get Text  ${question_sec_2}
    Run Keyword If  "${dic}[Are you at least 18 years of age?]"=="${ans1}" and "${dic}[Are you eligible to work in Canada?]"=="${ans2}"  Log  Questions Validated
    Capture Page Screenshot



Click on Extra Info
    Wait And Click Element  ${extrainfo_btn}
    Sleep  3s
    Capture Page Screenshot

Click on Details
    Wait And Click Element  ${details_btn}
    Sleep  3s
    Capture Page Screenshot

Click on Actions and Select Edit Offer
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        Select Required Value  ${actions_table}  Edit Offer
        Sleep  3s
        Wait Until Page Contains  Edit Job Offer
        Capture Page Screenshot

Click on Back
    Wait And Click Element  ${go_back}
    Wait Until Page Contains  Job Applications
    Capture Page Screenshot

Click on Accept Job Offer
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'Accept Offer')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Capture Page Screenshot

Click on Actions and Select Send Interview Invite
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        Select Required Value  ${actions_table}  Send Interview Invite
        Sleep  3s
        Wait Until Page Contains  Send Interview Invite
        Capture Page Screenshot

Click on Actions and Select Extend Offer
        Wait And Click Element  ${actions_btn}
        Sleep  3s
#        Select Required Value  ${actions_table}  Extend Offer
#        Sleep  3s
#        Wait And Click Element  ${warning_yes}
#        Sleep  2s
#        Capture Page Screenshot
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'Extend Offer')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Sleep  2s
        Capture Page Screenshot

Click on Actions and Select Move to HR
        Wait And Click Element  ${actions_btn}
        Sleep  3s
#        Select Required Value  ${actions_table}  Move to HR
#        Sleep  3s
#        Wait And Click Element  ${warning_yes}
#        Sleep  30s
#        Wait Until Page Contains  Confirmation  20s
#        Capture Page Screenshot
        ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'Move to HR')]]
        Click Element  xpath: ${xpath_value}
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Wait Until Page Contains  Confirmation  300s
        Capture Page Screenshot


Click on Actions and Select Accept Offer
        Wait And Click Element  ${actions_btn}
        Sleep  3s
        Select Required Value  ${actions_table}  Accept Offer
        Sleep  3s
        Wait And Click Element  ${warning_yes}
        Sleep  30s
        Wait Until Page Contains  Confirmation  20s
        Capture Page Screenshot

Click on Interactions
    Wait And Click Element  ${interaction_btn}
    Sleep  3s
    Capture Page Screenshot


Action on candidate in pool
    [Arguments]  ${data}
    Sleep  5s
    IF  "${data}[Action]"=="Send Message"
        Wait And Click Element  ${cp_action}
        Sleep  3s
        Select Required Value with Text  ${actions_table}  ${data}[Action]
        Wait Until Page Contains  Send Message
        Wait And Click Element  ${sm_continue}
        Sleep  2s
        Wait And Click Element  ${sm_use_dropdown}
        sleep  2s
        Select Required Value  ${table}  ${data}[Use]
        Sleep  2s
        Wait And Click Element  ${sm_continue}
        Sleep  5s
        Select Frame  ${cp_frame}
        Wait And Set Text  ${sm_mail_area}  ${data}[Custom Mail]
        Sleep  2s
        Unselect Frame
        Wait And Click Element  ${sm_continue}
        Sleep  2s
        Wait And Click Element  ${sm_send}
        Wait Until Page Contains  Details
    END

Verify linked requisition in job application
    [Arguments]   ${standard_requisition_id}
     Wait Until Page Contains  Job Applications   20  Job Applications page is not displayed
     Select Job Application Filter   All
     ${xpath_value}=  Catenate   SEPARATOR=   //span[contains(@title,'  ${standard_requisition_id}  ')]
     Click Element   xpath: ${xpath_value}
     Sleep  3s
     Wait Until Page Contains  ${standard_requisition_id}  20  Standard requisition id is not displayed

Recruiter Accept Offer from Actions
    Wait Until Page Contains  Key Highlights  20s  Candidate detail page is not displayed
    Wait And Click Element  ${actions_btn}
    Sleep  3s
    ${xpath_value}=  Catenate  SEPARATOR=  //td[text()[contains(.,'  Accept Offer  ')]]
    Click Element  xpath: ${xpath_value}
    Sleep  3s
    Wait And Click Element  ${warning_yes}
    Sleep  5s
    Capture Page Screenshot
