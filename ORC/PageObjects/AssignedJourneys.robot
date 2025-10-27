*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AssignedJourneys.robot

*** Keywords ***

Search for a pending worker
    [Arguments]  ${pending_worker_name}
    Wait Until Element Is Visible  ${search_for_journeys_input}  20  Search for journeys input text box is not displayed
    Click Element  ${search_for_journeys_input}
    Press keys  ${search_for_journeys_input}  ${pending_worker_name}
    Click Element  ${search_icon_assigned_journeys}
    Sleep  25s
    ${status}=  Run Keyword And Return Status  Page Should Not Contain  We couldn't find anything
        IF  '${status}'!='True'
        Log To Console  No search results
        Fail
        END
    Wait And Click Element  ${active_tile}
    Wait Until Page Contains  tasks  20  Checklist tasks page is not displayed

Click on the internal journey tile for an internal candidate new hire
    Wait until Page Contains  Internal Journeys  20s  Internal candidate new hire page is not displayed
    Capture Page Screenshot
    Click Element  ${internal_journey_title}
    Wait Until Page Contains  Internal Onboarding Process  20s  Internal onboarding process page is not displayed
    Sleep  15s
    Click Element   ${active_tile}
    Wait Until Page Contains  MX Candidate Journeys  20  Candidate Journeys page is not displayed

Validate All E-signatures
    [Arguments]  ${name}
    ${matching}=  Get Webelements  ${completed_tasks}
    FOR  ${e}  IN  @{matching}
        Wait And Click Element  ${e}
        Sleep  3s
        Mouse Over  ${mouse_over}
        Sleep  3s
        Capture Page Screenshot
        ${status}=  Run Keyword And Return Status  Page Should Contain  Display Name
        IF  "${status}"=="True"
            ${text}=  Get Text  ${display_name_validator}
            ${text}=  uppertolower  ${text}
            ${value}=  uppertolower  ${name}
            IF  "${text}"!="${value}"
                Log  E-signature didnot match
                Fail
            END
        END
    END
