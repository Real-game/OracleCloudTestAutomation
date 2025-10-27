*** Settings ***
Library  ../Helpers/Helpers.py
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobApplications.robot


*** Keywords ***
Sort
    [Arguments]  ${by}
    Wait And Click Element  ${sort_dropdown}
    Select Required Value  ${sort_list}  ${by}
    Sleep  3s
    Capture Page Screenshot

Select Application
    [Arguments]  ${candidate_name}
    Sleep  4s
    Clear Active Filter
    Click on Load More Items
    ${candidate_name}=  getCandidateName  ${candidate_name}
    ${matching_elements}=  Get WebElements   ${candidate_list}
#    IF  ${matching_elements}==[]
#        Wait And Click Element  xpath: //a[@title="${candidate_name}"]
#        Sleep  2s
#        Wait Until Page contains  Details
#    END
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        ${status}=  Run Keyword And Return Status  should be equal    ${text}  ${candidate_name}
        IF  '${status}'=='True'
            Wait And Click Element  ${element}
            Wait Until Page Contains Element  xpath: //div[text()='Details']  20s
            Exit For Loop
        END
    END
    Capture Page Screenshot

Clear Active Filter
    ${status}=  Run Keyword And Return Status  Page Should contain  ${remove_filter}
    IF  '${status}'=='True'
        Wait And Click Element  ${remove_filter}
        Sleep  3s
    END
    Capture Page Screenshot

Verify no new status application is listed for an hiring manager
    Clear Active Filter
    ${matching_elements}=  Get WebElements   ${application_status}
    FOR  ${element}  IN  @{matching_elements}
    ${requisition_title}=  Get Element Attribute  ${application_status}  innerHTML
        ${status}=  Run Keyword And Return Status  Should Contain  ${requisition_title}  New
        IF  '${status}'=='True'
                Fail  New status candidates are listed for an hiring manager
        END
    END
    Capture Page Screenshot


Send message to the team
    [Arguments]  ${candidate_last_name}  ${message_use}  ${recipient_name}  ${email_subject_text}  ${email_body_text}  ${candidate_name}
    ${xpath}=   Catenate  SEPARATOR=   //a[contains(@title,'  ${candidate_last_name}  ')]//ancestor::td[contains(@id,'Pse:PSEgc')]/following-sibling::td//a[@title='Actions']
    Wait Until Element Is Visible   xpath: ${xpath}   20
    Click Element   xpath: ${xpath}
    Log To Console    Actions link is clicked
    Wait Until Element Is Visible   ${send_message_to_team_link}   20
    Click Element   ${send_message_to_team_link}
    Wait And Click Element   ${use_selection}
    Sleep  2s
    ${use_xpath}=  Catenate  SEPARATOR=  //li[text()[contains(.,'   ${message_use}   ')]]
    Click Element  xpath: ${use_xpath}
    Sleep  4s
    Wait Until Element Is Visible   ${continue_button}   20
    Click Element   ${continue_button}
    Wait And Set Text   ${recipient_text_box}   ${recipient_name}
    Wait And Click Element   xpath: //div[contains(text(),"${recipient_name}")]
    Scroll Element Into View  ${continue_button}
    Wait And Click Element   ${continue_button}
    Wait And Set Text   ${email_subject}   ${email_subject_text}
    Select Frame   ${email_body_frame}
    Sleep  2s
    Input Text  xpath: //body[@dir='ltr']   ${email_body_text}
    Unselect Frame
    Scroll Element Into View  ${continue_button}
    Wait And Click Element   ${continue_button}
    Wait Until Element Is Visible   ${preview_email_subject}   20
    Element Attribute Value Should Be   ${preview_email_subject}  innerHTML     ${email_subject_text}
    ${extracted_text}=  Get Element Attribute   ${preview_email_body}  innerHTML
    Should Not Be Empty   ${extracted_text}
    Sleep  4s
    Wait And Click Element   ${send_button}
    Sleep  5s
    Select Application By Candidate Name   ${candidate_name}

Click on collect Feedback link for the applicant
    [Arguments]  ${candidate_last_name}
    Wait Until Page Contains  Job Applications  20  Job Applications header is not displayed
    Clear Active Filter
    ${xpath}=   Catenate  SEPARATOR=   //a[contains(@title,'  ${candidate_last_name}  ')]//ancestor::td[contains(@id,'Pse:PSEgc')]/following-sibling::td//a[@title='Actions']
    Wait Until Element Is Visible   xpath: ${xpath}   20
    Click Element   xpath: ${xpath}
    Log To Console    Actions link is clicked
    Wait Until Element Is Visible   ${collect_feedback_link}   20
    Capture Page Screenshot
    Click Element   ${collect_feedback_link}

Click on Load More Items
    FOR  ${i}  IN RANGE  0  99
        ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${load_items}
        Log To Console  ${status}
        IF  "${status}"=="False"
            Exit For Loop
        ELSE
            Wait And Click Element  ${load_items}
            Sleep  3s
        END
    END

Select Application By Name
    [Arguments]  ${value}
    Sleep  4s
#    Clear Active Filter
#    Click on Load More Items
    ${candidate_name}=  getName  ${value}
    ${matching_elements}=  Get WebElements   ${candidate_list}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${candidate_name}
        IF  '${status}'=='True'
            Wait And Click Element  ${element}
            Wait Until Page contains  Details
            Exit For Loop
        END
    END
    Capture Page Screenshot
    Sleep  10s

Navigate Back
    Wait And Click Element  ${back}
    Wait Until Page Contains  Overview
    Capture Page Screenshot

Select Candidate in Pool
    [Arguments]  ${candidate_name}
    Sleep  4s
    ${candidate_name}=  getName  ${candidate_name}
    Wait And Set Text  ${candidate_search_box}  ${candidate_name}
    Wait And Click Element  ${search_icon}
    Sleep  2s
    Click on Load More Items
    ${matching_elements}=  Get WebElements   ${candidate_list}
    ${count}=  Get Length  ${matching_elements}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${candidate_name}
        IF  '${status}'=='True'
            Wait And Click Element  ${element}
            Wait Until Page contains  Details
            Exit For Loop
        END
    END
    Capture Page Screenshot

Select Application By Candidate Name
    [Arguments]  ${candidate_name}
    Wait Until Page Contains  Job Applications  20s  Job Applications list is not displayed
    Clear Active Filter
    Click on Load More Items
    ${xpath_value}=  Catenate  SEPARATOR=  //a[text()[contains(.,'  ${candidate_name}   ')]]
    Wait Until Element Is Visible  xpath:${xpath_value}  20s  Applicant name link is not displayed
    Click Element  xpath: ${xpath_value}
    Sleep  5s





