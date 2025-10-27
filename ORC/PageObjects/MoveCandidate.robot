*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/MoveCandidate.robot

*** Keywords ***


Select State
    [Arguments]  ${value}
    IF  "${value}"!=""
        Sleep  2s
        Wait And Click Element  ${state_input}
        Sleep  2s
        Select Required Value  ${table}  ${value}
    END
    Capture Page Screenshot

Select State Reject
    [Arguments]  ${value}  ${reason}
    IF  "${value}"=="Rejected by Employer"
        Sleep  2s
        Wait And Click Element  ${state_input}
        Sleep  2s
        Select Required Value  ${table}  ${value}
        Select Reason   ${reason}

    ELSE IF  "${value}"!=""
        Sleep  2s
        Wait And Click Element  ${state_input}
        Sleep  2s
        Select Required Value  ${table}  ${value}
    END

Click on Save
    Wait And Click Element  ${save_btn}
    Wait Until Page Contains  Details
    Sleep    5s
    Capture Page Screenshot

Select Phase
    [Arguments]  ${value}

    IF  "${value}"!=""
        Sleep  2s
        Wait And Click Element  ${phase_input}
        Sleep  2s
        Select Required Value  ${table}  ${value}

    END

Select Reason
    [Arguments]  ${value}
    Wait And Click Element  ${reason_input}
    Sleep  2s
    Select Required Value  ${table}  ${value}