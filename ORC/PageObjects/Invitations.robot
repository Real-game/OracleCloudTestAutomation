*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Invitations.robot

*** Keywords ***

Click on the requisition title
    [Arguments]  ${requisition_id}
    Wait Until Element Is Visible  ${requisition_id_input}  20  Requisition id input is not displayed
    Select Required Requisition  ${requisition_id}
    Capture Page Screenshot
    Sleep  2s
    Sleep  3s

 Select Required Requisition
    [Arguments]  ${requisition_id}
    ${matching_elements}=  Get WebElements   ${requisition_link}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Element Attribute  ${element}  innerHTML
        ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${requisition_id}
        IF  '${status}'=='True'
            Wait And Click Element  ${element}
            Wait Until Page contains  Job Info
            Exit For Loop
        END
    END

Click on Done button in Invitations page
    Wait And Click Element  ${invitations_done_button}
    Wait Until Element Is Visible  ${warning_yes_button}    50   Warning message with yes button is not displayed
    Capture Page Screenshot
    Click Element  ${warning_yes_button}

Click on Submit candidate
    Wait Until Page Contains  Submit Candidate  20  Submit candidate button is not displayed
    ${element_list}=  Get WebElements  ${requisition_link}
    Click Element  ${element_list}[0]
    Sleep  4s
    #${submit_candidate_element_list}=  Get WebElements  ${submit_candidate_link}
    Click Element  ${submit_candidate_button}
    Sleep  5s
    Wait Until Page Contains  Create job application on behalf of candidate  20  Submit candidate page is not displayed

