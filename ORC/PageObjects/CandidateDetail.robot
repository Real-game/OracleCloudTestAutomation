*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CandidateDetail.robot

*** Keywords ***

Click on the convert to prospect option in the candidate detail page
    Sleep  4s
#    Element Should Be Visible  ${candidate_title}
    Element Should Be Visible  ${activity_link}
    Wait And Click Element  ${activity_link}
    Log To Console  Activity link is clicked
    Sleep  4s
    Scroll Element Into View  ${prospect_expand}
    Sleep  4s
    Wait And Click Element  ${prospect_expand}
    Log To Console  Prospect section is expanded.
    Wait And Click Element  ${back_button}
    Wait And Click Element  ${back_button}
#
#    Wait And Click Element  ${requisition_title}
#    Log To Console  Requisition title is clicked
#    Sleep  4s
#    Execute Javascript   window.scrollTo(0,1000)

Click on Prospects
    Wait And Click Element  ${prospects}
    Sleep  2s
    Wait Until Page Contains  Prospects   20  Prospects page is not displayed

Click on Prospect Candidate
    [Arguments]  ${prospect_candidate}
    Wait And Click Element  xpath: //a[contains(@title,"${prospect_candidate}")]
    Sleep  2s
    Wait Until Page Contains  Key Highlights   20  Candidate Detail page is not displayed

Convert Prospect
    Wait And Click Element  xpath: //a[@title='Actions']
    Wait And Click Element  xpath: //td[text()= "Convert Prospect"]
    Sleep  3s
    Log To Console  Convert prospect link is clicked
    Wait And Click Element  ${warning_yes_button}
    Sleep  20s
#    Wait And Click Element  ${close_pop_up}
    Log To Console  Confirmation pop up is closed
    Wait And Click Element  ${back_button}


Verify Sent Mail Interaction
     [Arguments]    ${recruiter_name_value}
         Wait And Click Element  ${interactions_link}
         Wait And Click Element  ${interactions_drop_down_selection}
         Select Required Value   ${interactions_drop_down_list}  With Hiring Team
         Sleep  3s
         Wait Until Page Contains  Sent E-Mail  20s  Sent Email section is not displayed
#         Element Should Be Visible  ${sent_mail_interaction}
         Wait And Click Element  ${expand_interaction}
         Wait Until Element Is Visible   ${recruiter_name}   20
         Sleep  3s
         Scroll Element Into View  ${recruiter_name}
         Element Attribute Value Should Be   ${recruiter_name}  innerHTML     ${recruiter_name_value}

View Feedback
         Wait Until Element Is Visible   ${feedback_link}   20
         Scroll Element Into View  ${feedback_link}
         Click Element  ${feedback_link}
         Sleep  10s
#         Scroll Element Into View  ${feedbackaction_link}
         Wait And Click Element  ${feedbackaction_link}
         Sleep  3s
         Click Element  ${view_feedback_link}
         Sleep  8s
#         Execute javascript  window.scrollTo(0,document.body.scrollHeight)
         Sleep  4s

Click on Expand Personal Info
    wait until page contains element  ${personal_info_expand}   20  Personal Info is not displayed
    scroll element into view  ${personal_info_expand}
    Wait And Click Element  ${personal_info_expand}
    Sleep  2s
    wait until page contains element  ${personal_info_edit}   20  Edit option is not displayed under Personal Info
    capture page screenshot

Click on Personal Info Edit
    [Arguments]  ${email}
    wait until page contains element  ${personal_info_edit}   20  Personal Info Edit is not displayed
    scroll element into view  ${personal_info_edit}
    Wait And Click Element  ${personal_info_edit}
    Sleep  2s
    wait until page contains element  ${edit_email_personal_info}  20  Email option is not displayed under Personal Info
    scroll element into view  ${edit_email_personal_info}
    capture page screenshot
    Wait And Set Text  ${edit_email_personal_info}  ${email}
    Sleep  2s
    Wait And Click Element  ${personal_info_save}
    Sleep  10s
    element should not be visible  ${personal_info_error}  Error Popup is visible
    Sleep  5s
    capture page screenshot

Select Add Requisition action to the Candidate Page
    Sleep  2s
    Wait And Click Element  ${Candidate_action}
    Capture Page Screenshot
    Sleep  2s
    Wait And Click Element  ${candidate_add_to_requisition}
    Log To Console  Add to Requisition option is clicked.
    Sleep  5s
    capture page screenshot

