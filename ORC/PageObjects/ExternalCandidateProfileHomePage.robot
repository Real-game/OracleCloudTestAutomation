*** Settings ***
Library  Selenium2Library
Resource  ../Locators/ExternalCandidateProfileHomePage.robot
Resource  ../Keywords/CommonKeywords.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot

*** Keywords ***
Change Status
    [Arguments]  ${value}
    IF  "${value}"!=""
        ${req_id}=  Get WebElements  ${reqids}
        ${hover}=  Get WebElements  ${status_hovers}
        ${count}=  Get Length  ${req_id}
        FOR  ${i}  IN RANGE  0  ${count}+1
            ${text}=  Get Text  ${req_id}[${i}]
            IF  "${text}"=="${value}"
                Wait And Click Element  ${hover}[${i}]
                Sleep  10s
#                Wait And Click Element   ${underconsideration_btn}
                Exit For Loop
            END
        END
        Sleep  3s
        Wait And Click Element  ${withdraw_btn}
        Sleep    2s
        Capture Page Screenshot
        Wait And Click Element  ${withdraw_popup}
        Sleep    5s
        capture page screenshot
    END

Delete Profile
    [Arguments]  ${value}
    Wait And Click Element  ${info_n_alerts}
    Sleep  2s
    IF  "${value}"=="Yes"
        Wait And Click Element  ${delete_profile}
        Sleep    2s
        Capture Page Screenshot
        Wait And Click Element  ${delete_popup}
    END
    Sleep  10s

Go back to career site
    Wait And Click Element  ${back_external_site}
    Wait Until Page Contains  All Jobs
    Capture Page Screenshot

Show menu options and select
    [Arguments]  ${data}
    Wait And Click Element  ${menu_options}
    Sleep  2s
    ${matching}=  Get WebElements  ${menu_temp}
    FOR  ${e}  IN  @{matching}
        ${title}=  Get Element Attribute  ${e}  title
        IF  "${title}"=="${data}[Menu Option]"
            Wait And Click Element  ${e}
            Exit For Loop
        END
    END
    IF  "${data}[Menu Option]"=="Edit Personal Information"
        Sleep  5s
        Wait Until Element Contains  ${ver}  Please enter your contact information.
        Capture Page Screenshot
        Update Personal Information  ${data}
    END


Update Personal Information
    [Arguments]  ${data}
    IF  "${data}[Title]"!=""
        Select Title  ${data}[Title]
    END
    IF  "${data}[First Name]"!=""
        Fill First Name  ${data}[First Name]
    END
    IF  "${data}[Last Name]"!=""
        Fill Last Name  ${data}[Last Name]
    END
    IF  "${data}[Country Code]"!=""
        Fill Country Code  ${data}[Country Code]
    END
    IF  "${data}[Phone Number]"!=""
        Fill Phone Number    ${data}[Phone Number]
#        Wait Then Click And Set Text  ${phoneno}  ${data}[Phone Number]
#        Capture Page Screenshot
    END

Click on Update
    Wait And Click Element  ${update_btn}
    Sleep  2s
    Wait Until Page Contains Element  ${profile_update_message}  20s  Your profile not updated
    Capture Page Screenshot

Get Profile Name
    Wait Until Page Contains  Back to career site
    ${name}=  Get Text  ${profile_name}
    RETURN  ${name}

Select Slot
    [Arguments]  ${value}
    Wait Until Page Contains  Back to career site
    Click on Show More Active Applications
    Sleep   10s
    IF  "${value}"!=""
        ${xpath}=  formXpath  ${eph_schedule_btn}  ${value}
        Wait And Click Element  ${xpath}
        Sleep  2s
        Wait Until Page Contains   Schedule Interview
        Capture Page Screenshot
        Wait And Click Element  ${confirm_slot}
        Wait Until Page Contains  Would you like to schedule this interview?
        Wait And Click Element  ${eph_schedule_interview}
        Sleep  5s
        Capture Page Screenshot
    END

Click on Show More Active Applications
    Sleep  5s
    FOR  ${i}  IN RANGE  0  99
        ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${active_show_more}
        IF  "${status}"=="False"
            Exit For Loop
        ELSE
            Mouse Over  ${active_show_more}
            Wait And Click Element  ${active_show_more}
            Sleep  3s
        END
    END

Show menu options and select With Application Submission
    [Arguments]  ${data}
#    Wait And Click Element  ${menu_options}
#    Sleep  2s
#    ${matching}=  Get WebElements  ${menu_temp}
#    FOR  ${e}  IN  @{matching}
#        ${title}=  Get Element Attribute  ${e}  title
#        IF  "${title}"=="${data}[Menu Option]"
#            Wait And Click Element  ${e}
#            Exit For Loop
#        END
#    END
    Wait And Click Element  ${info_n_alerts}
    Sleep  2s
    Wait And Click Element    ${edit_personal_info}
    Sleep    5s
    IF  "${data}[Menu Option]"=="Edit Personal Information"
        Sleep  5s
        Wait Until Element Contains  ${ver}  Please enter your contact information.
        Capture Page Screenshot
        Update Personal Information With Application Submission  ${data}
    END


Update Personal Information With Application Submission
    [Arguments]  ${data}
    IF  "${data}[Updated Title]"!=""
        Select Title  ${data}[Updated Title]
    END
    IF  "${data}[Updated First Name]"!=""
        Fill First Name  ${data}[Updated First Name]
    END
    IF  "${data}[Updated Last Name]"!=""
        Fill Last Name  ${data}[Updated Last Name]
    END
#    IF  "${data}[Updated Country Code]"!=""
#        Fill Country Code  ${data}[Updated Country Code]
#    END
    IF  "${data}[Updated Phone Number]"!=""
        Fill Phone Number    ${data}[Updated Phone Number]
#        Wait Then Click And Set Text  ${phoneno}  ${data}[Updated Phone Number]
#        Capture Page Screenshot
    END

Select Edit Personal Info
    [Arguments]  ${data}
    Wait And Click Element  ${info_n_alerts}
    Sleep  2s
    Wait And Click Element    ${edit_personal_info}
    Sleep    5s
    IF  "${data}[Menu Option]"=="Edit Personal Information"
        Sleep  5s
        Wait Until Element Contains  ${ver}  Please enter your contact information.
        Capture Page Screenshot
        Update Personal Information  ${data}
    END

Select My Application for Status Change
    Wait And Click Element    ${my_application}
    Sleep    3s
    capture page screenshot