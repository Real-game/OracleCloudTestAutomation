*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/HomePage.Robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
click on homepage
    click element  ${icon_home}
    Sleep  5s
    Capture Page Screenshot


Go to my team hiring
    wait and click element  ${href_MyTeam}
    Mouse Over  ${href_Hiring}
    Capture Page Screenshot
    Click Link  ${href_Hiring}
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains  Job Requisitions   20s
    IF  '${check}'=='True'
        Wait Until Page Contains  Job Requisitions  20s  Job Requisitions page is not displayed
    END
    Capture Page Screenshot

Go to hiring
#    wait and click element  ${href_MyTeam}
    Sleep  5s
    Mouse Over  ${href_Hiring}
    Capture Page Screenshot
    Click Link  ${href_Hiring}
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains  Job Requisitions   20s
    IF  '${check}'=='True'
        Wait Until Page Contains  Job Requisitions  20s  Job Requisitions page is not displayed
    END
    Capture Page Screenshot


Go to my client group hiring
    wait and click element  ${href_my_client}
    Mouse Over  ${href_Hiring}
    Capture Page Screenshot
    Click Link  ${href_Hiring}
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains  Job Requisitions   20s
    IF  '${check}'=='True'
        Wait Until Page Contains  Job Requisitions  20s  Job Requisitions page is not displayed
    END
    Capture Page Screenshot

Go to my team create job requisition
    wait and click element  ${href_MyTeam}
    Click Link  ${href_CJR}
    Wait Until Page Contains  Create Job Requisition
    Capture Page Screenshot

Go to Current Jobs
    Wait And Click Element  ${href_CJ}
    Wait Until Page Contains  Opportunity Marketplace  40s  Opportunity Marketplace page is not displayed
#    Wait Until Element Contains  ${header}  Current Jobs
    Wait Until Element Contains  ${header_SA}  Opportunity Marketplace
    Capture Page Screenshot

Go to my client group questions
    wait and click element  ${href_my_client}
    Wait And Click Element  ${href_showmore}
    Sleep  5s
    Wait And Click Element  ${href_questions}
    Wait Until Element Contains  ${header}  Questions
    Capture Page Screenshot

Search for Notifications
    [Arguments]  ${value}
    Wait And Click Element  ${home_notifications}
    Sleep  3s
    ${check}=  Run Keyword And Return Status  Page Should Contain  Pending Notifications
    IF  "${check}"=="True"
        Wait And Click Element  ${notifi_dropdown}
        Sleep  2s
        Select Required Value  ${temp}  All Notifications
    END
    ${text}=  getFirstName  ${value}
#    Wait Then Click And Set Text  ${notification_search_text_box}  ${text}
#    Sleep  5s
#    Wait And Click Element  ${notification_search_text_box}
    Sleep  5s
    Wait And Send Keys  ${notification_search_text_box}  ${text}
    Sleep  2s
    Press Keys  ${notification_search_text_box}  ENTER
    Sleep  10s
    IF  "${check}"=="True"
        ${matching}=  Get WebElements  ${notification_temp}
        FOR  ${e}  IN  @{matching}
            ${title}=  Get Element Attribute  ${e}  title
            Log To Console  ${title}
            ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Requires Approval
            Log To Console  ${status}
            IF  "${status}"=="True"
                Wait And Click Element  ${e}
                Exit For Loop
            END
        END
    ELSE
        ${matching}=  Get WebElements  ${notification_temp2}
        FOR  ${e}  IN  @{matching}
            ${title}=  Get Element Attribute  ${e}  title
            Log To Console  ${title}
            ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Requires Approval
            Log To Console  ${status}
            IF  "${status}"=="True"
                Wait And Click Element  ${e}
                Exit For Loop
            END
        END
    END
    Sleep  10s

Review Offer and Take Action
    [Arguments]  ${action}
    ${checker}=  Run Keyword And Return Status   Wait And Click Element  ${take_action_alert}
    IF  "${checker}"=="False"
        Sleep  5s
        Reload Page
        Sleep  5s
        Wait And Click Element  ${take_action_alert}
    END
    Sleep  10s
#    ${handles}=  Get Window Handles
#    Switch Window  ${handles}[1]
    Capture Page Screenshot
    IF  "${action}"=="Approve"
        Wait Until Element Is Visible  ${approve_btn}  60s
        Wait And Click Element  ${approve_btn}
    ELSE
        Wait Until Element Is Visible  ${reject_btn}  60s
        Wait And Click Element  ${reject_btn}
    END
    Sleep  5s
    Wait And Click Element  ${submit_offer_approval}
#    Switch Window  ${handles}[0]

Click on Notifications Icon
    Wait Until Element Is Visible    ${notifications_icon}      20     Notifications Icon is not displayed
    Capture Page Screenshot
    Click Element   ${notifications_icon}
    Log  Notifications icon is clicked in the home page

Click on the scheduled interview notification
    Sleep  30s
    #Wait Until Element Is Visible    ${pending_notification_drop_down}      20     Show all notification is not displayed
    #Click Element  ${pending_notification_drop_down}
    Wait Until Element Is Visible    ${show_all_notifications_link_home_page}      20     Show all notification is not displayed
    Click Element  ${show_all_notifications_link_home_page}
    Sleep  20s
    Wait Until Element Is Visible    ${interview_schedule_notification}      20     Interview scheduled notification is not displayed
    Capture Page Screenshot
    Click Element   ${interview_schedule_notification}
    Sleep  30s
    Log  Interview scheduled notification is clicked in the home page


Click on the interview calendar link
    Sleep  6s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Wait Until Element Is Visible    ${interview_calendar_link}   20     Interview detail link is not displayed
    Capture Page Screenshot
    Click Element   ${interview_calendar_link}
    Log  Interview detail link is clicked in the Interview scheduled
    Sleep  7s
    Close Window
    Switch Window  ${handles}[0]
    Sleep  3s


Click on the schedule interview notification
    Sleep  15s
    ${check}=  Run Keyword And Return Status  Page Should Contain  Pending Notifications
    IF  "${check}"=="True"
        Wait And Click Element  ${notifi_dropdown}
        Sleep  2s
        Select Required Value  ${temp}  All Notifications
    ELSE
        Click Element  ${show_all_notifications_link_home_page}
    END

#    Wait Until Element Is Visible    ${pending_notification_drop_down}      20     Show all notification is not displayed
#    Click Element  ${pending_notification_drop_down}
#    Wait Until Element Is Visible    ${all_notifications_link}      20     Show all notification is not displayed
#    Click Element  ${show_all_notifications_link_home_page}
    Sleep  20s
    Wait Until Element Is Visible    ${schedule_interview_notification}      20     Interview scheduled notification is not displayed
    Capture Page Screenshot
    Click Element   ${schedule_interview_notification}
    Log  Interview scheduled notification is clicked in the home page


Click on the interview detail link
    Sleep  10s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Wait Until Element Is Visible    ${interview_detail_link}      20     Interview detail link is not displayed
    Capture Page Screenshot
    Click Element   ${interview_detail_link}
    Log  Interview detail link is clicked in the Interview scheduled
    Sleep  20s
    Close Window
    Sleep  6s

Click on Roles & Delegation
    Wait Until Element Is Visible    ${me_link}     20     Me link is not displayed
    Click Element  ${me_link}
    Wait Until Element Is Visible    ${roles_and_delegations_link}     20     Roles and delegation is not displayed
    Scroll Element Into View    ${roles_and_delegations_link}
    Capture Page Screenshot
    Sleep  2s
    Click Element  ${roles_and_delegations_link}

Display All notifications
    ${check}=  Run Keyword And Return Status  Page Should Contain  Pending Notifications
    IF  "${check}"=="True"
        Wait And Click Element  ${notifi_dropdown}
        Sleep  2s
        Select Required Value  ${temp}  All Notifications
    ELSE
        Click Element  ${show_all_notifications_link_home_page}
    END
    Sleep  3s

Search for a notification
    [Arguments]   ${notification_type}
    Wait Until Element Is Visible    ${notification_search_text_box}      20     Notification search text box is not displayed
    Click Element  ${notification_search_text_box}
    Sleep  2s
    Press Keys  ${notification_search_text_box}   ${notification_type}
    Click Element  ${notifications_search_icon}
    Sleep  2s
    Capture Page Screenshot
    Sleep  2s
    Click Element  ${complete_the_questionnaire_notification}

Click on the submit feedback link
    Sleep  6s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Wait Until Element Is Visible    ${submit_feedback_link}      20     Submit feedback link is not displayed
    Capture Page Screenshot
    Click Element   ${submit_feedback_link}
    Log  Submit Feedback link is clicked in the Complete feedback dialog
    Sleep  6s


Click on Current Jobs link
    Wait Until Element Is Visible    ${me_link}     20     Me link is not displayed
    Click Element  ${me_link}
    Wait Until Element Is Visible    ${current_jobs_link}     20     Current Jobs link is not displayed
    Scroll Element Into View    ${current_jobs_link}
    Capture Page Screenshot
    Sleep  2s
    Click Element  ${current_jobs_link}
    Sleep  4s

Go to my client group agency hiring
#    wait and click element  ${href_my_client}
    Wait Until Element Is Visible  ${agency_hiring_link}
    Capture Page Screenshot
    Click Link  ${agency_hiring_link}
    Wait Until Page Contains    Invitations  20  Invitations link is not displayed
    Capture Page Screenshot

Click on Show All link for notifications
    Sleep  4s
    Wait Until Element Is Visible  ${show_all_notifications_link_home_page}  20  Show all notifications link is not displayed
    Click Element  ${show_all_notifications_link_home_page}

Go to my client group Journeys
    wait and click element  ${href_my_client}
    Wait Until Element Is Visible  ${journeys_link}
    Capture Page Screenshot
    Click Link  ${journeys_link}
    Wait Until Page Contains    Assigned Journeys  40  Invitations link is not displayed
    Capture Page Screenshot

Search for Offer Notifications
    Wait And Click Element  ${home_notifications}
    Sleep  3s
    ${check}=  Run Keyword And Return Status  Page Should Contain  Pending Notifications
    IF  "${check}"=="True"
        Wait And Click Element  ${notifi_dropdown}
        Sleep  2s
        Select Required Value  ${temp}  All Notifications
    ELSE
        Click Element  ${show_all_notifications_link_home_page}
    END
#    Click on Show All link for notifications
    Sleep  20s
    Wait And Send Keys  ${notification_search_text_box}  Congratulations, job offer
    Sleep  2s
    Press Keys  ${notification_search_text_box}  ENTER
    Sleep  10s
    ${notify_check}=  Run Keyword And Return Status  Page Should Contain  Congratulations, job offer

    IF  "${notify_check}"=="True"
        ${matching}=  Get WebElements  ${notification_temp}
        FOR  ${e}  IN  @{matching}
            ${title}=  Get Element Attribute  ${e}  title
            Log To Console  ${title}
            ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Congratulations, job offer
            Log To Console  ${status}
            IF  "${status}"=="True"
                Wait And Click Element  ${e}
                Exit For Loop
            END
        END
    ELSE
        ${matching}=  Get WebElements  ${notification_temp2}
        FOR  ${e}  IN  @{matching}
            ${title}=  Get Element Attribute  ${e}  title
            ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Congratulations, job offer
            IF  "${status}"=="True"
                Wait And Click Element  ${e}
                Exit For Loop
            END
        END
    END
    Sleep  10s

Respond to Job Offer Internal
    [Arguments]  ${action}  ${reason}  ${comments}  ${name}
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Capture Page Screenshot
    Wait And Click Element  ${hmp_respond}
    Close Window
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Wait Until Page Contains  Pending Job Offer  20s
    Wait And Click Element  ${pjo_download}
    Sleep  2s
    IF  "${action}"=="Accept"
        Wait And Click Element  ${pjo_accept}
        Wait Until Page Contains  Accept Job Offer
        Wait And Set Text  ${employee_name_input}  ${name}
        Wait And Click Element  ${do_sub}
        Sleep  3s
        Capture Page Screenshot
        Close Window
        Switch Window  ${handles}[0]
    ELSE
        Wait And Click Element  ${pjo_decline}
        Wait Until Page contains  Decline Offer
        Wait And Click Element  ${dreason_dropdown}
        Sleep  2s
        Select Required Value  ${temp}  ${reason}
        Sleep  2s
        Wait And Send Keys  ${do_comment_input}  ${comments}
        Wait And Click Element  ${do_sub}
        Sleep  3s
        Capture Page Screenshot
        Close Window
        Switch Window  ${handles}[0]
        Search for Decline Offer Notification
    END
    Switch Window  ${handles}[0]

Search for Decline Offer Notification
    Wait Then Click And Set Text  ${notification_search_text_box}  Decline of your job offer
    Sleep  2s
    Press Keys  ${notification_search_text_box}  ENTER
    Sleep  10s
    ${matching}=  Get WebElements  ${notification_temp}
    FOR  ${e}  IN  @{matching}
       ${title}=  Get Element Attribute  ${e}  title
       Log To Console  ${title}
       ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Decline of your job offer
       Log To Console  ${status}
       IF  "${status}"=="True"
          Wait And Click Element  ${e}
          Exit For Loop
       END
    END
    Sleep  10s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Capture Page Screenshot


Search for Notifications E2E
    [Arguments]  ${value}
    Wait And Click Element  ${home_notifications}
    Sleep  3s
    ${check}=  Run Keyword And Return Status  Page Should Contain  Pending Notifications
    IF  "${check}"=="True"
        Wait And Click Element  ${notifi_dropdown}
        Sleep  2s
        Select Required Value  ${temp}  All Notifications
    ELSE
        Click Element  ${show_all_notifications_link_home_page}
    END
    ${text}=  getFirstName  ${value}
    IF  "${check}"=="True"
        Wait And Send Keys  ${notification_search_text_box}  ${text}
        Sleep  2s
        Press Keys  ${notification_search_text_box}  ENTER
        Sleep  10s
        ${matching}=  Get WebElements  ${notification_temp}
        FOR  ${e}  IN  @{matching}
            ${title}=  Get Element Attribute  ${e}  title
            Log To Console  ${title}
            ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Requires Approval
            Log To Console  ${status}
            IF  "${status}"=="True"
                Wait And Click Element  ${e}
                Exit For Loop
            END
        END
    ELSE
        Wait And Send Keys  ${h_notifi_search}  ${text}
        Sleep  2s
        Press Keys  ${h_notifi_search}  ENTER
        Sleep  10s
        ${matching}=  Get WebElements  ${notification_temp2}
        FOR  ${e}  IN  @{matching}
            ${title}=  Get Element Attribute  ${e}  title
            Log To Console  ${title}
            ${status}=  Run Keyword And Return Status  Should Contain  ${title}  Requires Approval
            Log To Console  ${status}
            IF  "${status}"=="True"
                Wait And Click Element  ${e}
                Exit For Loop
            END
        END
    END
    Sleep  10s

Review Offer and Take Action E2E
    [Arguments]  ${action}
    ${handles}=  Get Window Handles
    ${count}=  Get Length  ${handles}
    ${count}=  Evaluate  ${count}-1
    Switch Window  ${handles}[${count}]
    Capture Page Screenshot
    IF  "${action}"=="Approve"
        Wait And Click Element  ${approve_btn}
    ELSE
        Wait And Click Element  ${reject_btn}
    END
    #Wait And Click Element  ${sub_btn}
    sleep  2s
    Switch Window  ${handles}[0]

Go to me Journeys
#    wait and click element  ${me_tab}
    Wait Until Element Is Visible  ${journeys_link}
    Capture Page Screenshot
    Click Link  ${journeys_link}
#    Wait Until Page Contains    My Journeys  40  My journeys page is not displayed
    Sleep  5s
    Capture Page Screenshot

Go to my client groups show more
    wait and click element  ${href_my_client}
    Sleep  3s
    Mouse Over  ${mcg_show_more}
    Sleep  2s
    Click Link  ${mcg_show_more}
    Sleep  5s
    Capture Page Screenshot

Click on Pending Employees
    Wait And Click Element  ${mcg_pending_employee}
    Wait until Element Contains  ${header}  Pending Employees
    Capture Page Screenshot

Click on Manage Job Offers
    wait until page contains element  ${Manage_job_offer}  10s
    Scroll element into view  ${Manage_job_offer}
    Wait And Click Element  ${Manage_job_offer}
    ${checker}=  RUN KEYWORD And Return Status  Wait until Element Contains  ${header}  Job Offers
    IF  '${checker}' == 'False'
        Wait until Element Contains  ${header}  Job Offers
    END
    Capture Page Screenshot

Go to my team Journeys
    Wait And Click Element  ${href_MyTeam}
    Wait Until Element Is Visible  ${journeys_link}
    Capture Page Screenshot
    Click Link  ${journeys_link}
    Wait Until Page Contains    Assigned Journeys  40  Assigned Journeys page is not displayed
    Capture Page Screenshot

Verify canceled interview notification
    [Arguments]   ${requisition_title}  ${candidate_name}
    Sleep  20s
    Wait Until Element Is Visible    ${show_all_notifications_link_home_page}      20     Show all notification is not displayed
    Click Element  ${show_all_notifications_link_home_page}
    Sleep  20s
    Wait Until Element Is Visible  ${h_notifi_search}  20  Search input text box is not displayed
    Click Element  ${h_notifi_search}
    Press Keys  ${h_notifi_search}   canceled
    Sleep  5s
    Press Keys  ${h_notifi_search}   ENTER
    Capture Page Screenshot
#    Wait Until Page Contains   ${requisition_title}   20  Canceled notification for the requisition is not displayed
#    Wait Until Page Contains   ${candidate_name}   20   Candidate name in the canceled notification is not displayed


Click on the canceled interview notification
    [Arguments]   ${requisition_title}  ${candidate_name}
    Sleep  15s
    ${xpath_value}=  Catenate   SEPARATOR=   //a[contains(@title,'  ${requisition_title}    ')][contains(@title,'   ${candidate_name}    ')][contains(@title,'canceled')]
    Click Element  xpath: ${xpath_value}
    Sleep  15s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Wait Until Page Contains   canceled   20  canceled text is not displayed
    Wait Until Page Contains   ${requisition_title}   20  Requisition title is not displayed
    Wait Until Page Contains   ${candidate_name}   20  Candidate Name is not displayed
    Wait Until Page Contains   Date and Time   20  Interview date and time is not displayed
    Wait Until Page Contains   Interview type   20  Interview type is not displayed
    Wait Until Page Contains   Thank you   20  Thank you is not displayed
    Close Window
    Switch Window  ${handles}[0]


Verify referred notification
    [Arguments]   ${requisition_title}
    Wait Until Page Contains   Assigned to Me   20   Notifications page is not displayed
    Wait Until Element Is Visible  ${h_notifi_search}  20  Search input text box is not displayed
    Click Element  ${h_notifi_search}
    Press Keys  ${h_notifi_search}   referred
    Sleep  5s
    Press Keys  ${h_notifi_search}   ENTER
    Capture Page Screenshot
    Wait Until Page Contains   has referred you to a    20   Referral notification is not displayed
    Wait Until Page Contains   ${requisition_title}     20   Referred position is not displayed

Verify tasklist notification for an employee
    Sleep  20s
    Wait Until Element Is Visible    ${show_all_notifications_btn}   20     Show all notification is not displayed
    Click Element  ${show_all_notifications_btn}
    Sleep  20s
    Wait Until Element Is Visible  ${h_notifi_search}  20  Search input text box is not displayed
    Click Element  ${h_notifi_search}
    Press Keys  ${h_notifi_search}   		Tasks in Cheryl Taylor's MX Hire: Global Onboarding journey on 2022-01-11.
    Sleep  5s
    Press Keys  ${h_notifi_search}   ENTER
    Capture Page Screenshot
    Sleep  5s
    Wait Until Page Contains   		Tasks in Cheryl Taylor's MX Hire: Global Onboarding journey on 2022-01-11.   20   MX Candidate Journeys task notification is not displayed
#    ${matching_elements}=  Get WebElements   ${candidate_list}
#    ${length}=  Get Length   ${matching_elements}
    Click Element   ${notification_item1}
    Sleep  5s
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Wait Until Page Contains  Welcome Onboarding Video  20s
#    Wait Until Page Contains  Metrolinx Policies  5s
    Wait Until Page Contains  Conditions of Employment  5s
    Wait Until Page Contains  Internet Acknowledgement  5s
    Wait Until Page Contains  ID Picture Request  5s
    Wait Until Page Contains  Personal Details  5s
    Wait Until Page Contains  Contacts  5s
    Wait Until Page Contains  Banking Information  5s
    Wait Until Page Contains  TD1 Federal Personal Tax Credits Returns  5s
    Wait Until Page Contains  TD1ON Ontario Personal Tax Credits Returns  5s
    Wait Until Page Contains  Benefits – Non-Union  5s
    Wait Until Page Contains  Benefits – Non-Union Contract Long Term Full Time  5s
    Wait Until Page Contains  Benefits – Manager  5s
    Wait Until Page Contains  OMERS  5s
    Wait Until Page Contains  Vacation Attendance Credit Supplement  5s
#    Wait Until Page Contains  Occupational Health and Safety Act (OHSA) Training   5s
#    Wait Until Page Contains  Occupational Health and Safety Act (OHSA) Training (Supervisor)   5s
#    Wait Until Page Contains  Mandatory Vaccination Policy  5s
    Close Window
    Switch Window  ${list}[0]


Search for a new job notification
    [Arguments]   ${requisition_id}
    Wait Until Element Is Visible    ${notification_search_text_box}      20     Notification search text box is not displayed
    Click Element  ${notification_search_text_box}
    Sleep  2s
    Press Keys  ${notification_search_text_box}   New Job Requisition  ENTER
    Sleep  2s
    Capture Page Screenshot
    Sleep  2s
    Click Element  ${new_job_notification}
    Sleep  15s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Sleep  3s
    wait until page contains  Hello  20s  Hello is not displayed in popup
    wait until page contains  Sincerely  20s  Sincerely is not displayed in popup
    wait until page contains  Metrolinx Careers  20s  Metrolinx Careers is not displayed in popup
    wait until page contains  Talent Acquisition Team  20s  Talent Acquisition Team is not displayed in popup
    Sleep  2s
    Capture Page Screenshot
    Click Element  ${new_job_requisition_hyperlink}
    Sleep  10s
    wait until page contains  ${requisition_id}  20s  Requisition ID is not displayed in popup
    wait until page contains  Overview  20s  Overview is not displayed in popup
    wait until page contains  Details  20s  Details is not displayed in popup
    Sleep  2s
    Capture Page Screenshot
    close window

Go to Tools Scheduled Processes
    Sleep  5s
    Wait And Click Element  ${tools}
    Sleep  3s
    Wait And Click Element  ${scheduled_processes}
    Sleep  3s
    wait until page contains  Overview  20s  Scheduled Processes page is not displayed
    Capture Page Screenshot

Go to Personal Details Page
    wait and click element  ${personal_details}
    Capture Page Screenshot

store username in csv
    [Arguments]  ${csv_path}  ${Id}  ${header}
    ${text} =  Wait And Get Text  ${personal_details_name}
    appendtocsv  ${csv_path}  ${Id}  ${header}  ${text}

Click on Submitted Applications
    Sleep  2s
    Wait Until Page Contains Element    ${Submitted_applications}  20s   Submitted applications not visible
    Wait And Click Element    ${Submitted_applications}
    Sleep  3s
    Wait And Click Element    ${applied_job}
    Sleep  2s
    Wait And Click Element    ${dropdown_offer}
    Sleep  3s
    Wait And Click Element   ${view_offer}
    Capture Page Screenshot

Click on Accept button
    Wait And Click Element    ${accept_offer}
    Sleep  3s
    Capture Page Screenshot

Sign Employee Signature
    [Arguments]  ${sign}
    Wait And Send Keys  ${sign_Empname}  ${sign}
    Capture Page Screenshot

Click on Submit Accept Offer
    Wait And Click Element  ${sub_offerbutton}
    Capture Page Screenshot

Go to my client group person management
    wait and click element  ${href_my_client}
    Sleep  3s
    Click Element  ${href_person_management}
    Wait And Verify Page Contains Text  Person Management: Search   20s  Person Management page is not displayed
    Capture Page Screenshot

Get Person Number in Person Management Page
    [Arguments]  ${candidate_name}
    Wait and click element  ${search_person_name}
    Input Text  ${search_person_name}  ${candidate_name}
    Sleep  3s
    Wait And Click Element  ${include_terminate_checkbox}
    Sleep  5s
    Wait and click element  ${search_person_management}
    Sleep  5s
    ${Person_number_xpath}=  Catenate  SEPARATOR=  //a[text()='${candidate_name}']/following::span[1]
    Wait Until Page Contains Element  xpath: ${Person_number_xpath}  20s  Person Details is not there
    scroll element into view  ${Person_number_xpath}
    ${person_num_value}=  get text  ${Person_number_xpath}
    [return]  ${person_num_value}