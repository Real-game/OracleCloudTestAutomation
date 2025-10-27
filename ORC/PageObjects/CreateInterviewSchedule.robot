*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreateInterviewSchedule.robot

*** Keywords ***
Update Basic Information
    [Arguments]  ${temp}
    IF  "${temp}"!=""
        Wait And Click Element  ${temp_hov}
        Select Required Value  ${list}  ${temp}
        Sleep  30s
        Capture Page Screenshot
        Wait And Click Element  ${cis_continue_btn}
        Sleep  2s
    ELSE
        Log  nothing to be updated in basic information block as there is no input passed
    END

Update Location Details
    Wait Until Page Contains  Web Conference Link  30s  Location Details not found
    Sleep  5s
    ${text}=  Get Element Attribute  ${weblink_input}  value
    IF  "${text}"==""
        Capture Page Screenshot
        Wait And Set Text  ${country_code}  1
        Wait And Click Element  xpath: (//span[text()=1])[1]
        Wait And Set Text  ${phone_number_1}  985
        Wait And Set Text  ${phone_number_2}  5665555
        Wait And Set Text  ${web_conference_link}  www.invalidDetails.com
        Wait And Set Text  ${access_code}  5555
        Sleep  2s
        Capture Page Screenshot
        Wait And Click Element  ${cis_continue_btn}
    ELSE
        Capture Page Screenshot
        Log  web conference link is auto populated
        Wait And Click Element  ${cis_continue_btn}
        Sleep  2s
    END

Update Settings
    Mouse Over  ${cis_continue_btn}
    Capture Page Screenshot
    Wait And Click Element  ${cis_continue_btn}
    Sleep  2s

Update Candidate Info
    ${matching_elements}=  Get WebElements  ${candidateinfo_details}
    FOR  ${element}  IN  @{matching_elements}
        Mouse Over  ${element}
        Capture Page Screenshot
    END
    Wait And Click Element  ${cis_continue_btn}
    Sleep  2s

Update Interview Documents
    Mouse Over  ${cis_continue_btn}
    Capture Page Screenshot
    Wait And Click Element  ${cis_continue_btn}
    Sleep  2s

Update Reminders
    [Arguments]  ${value}
    IF  "${value}"!=""

        Wait And Set Text  ${noo_input}  ${value}
    END
    Mouse Over  ${reminders_title}
    Capture Page Screenshot

Click on Save and Close
    Wait And Click Element  ${inter_saveclose_btn}

Schedule Interview
    [Arguments]  ${data}
    Update Basic Information  ${data}[Template]
    Sleep  10s
    Update Location Details
    Sleep  5s
    Update Settings
    Sleep  5s
    Update Candidate Info
    Sleep  5s
    Update Interview Documents
    Update Reminders  ${data}[Number of openings]
    Click on Save and Close
    Sleep  5s






