*** Settings ***
Library  Selenium2Library
Library  DateTime
Library  ../Helpers/Helpers.py
Resource  ../Locators/Performance.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Current Financial Year Annual Review Manager
    [Arguments]  ${performance_doc}
    Wait And Click Element  link: ${performance_doc}
    Wait And Verify Page Contains Text  : ${performance_doc}  20s  Employee Self-Evaluation: page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Current Financial Year Annual Review Manager As Manager
    [Arguments]  ${performance_doc}
    Wait And Click Element  link: ${performance_doc}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Click Current Financial Year Annual Review Manager For Participant Feedback
    [Arguments]  ${performance_doc}
    Wait And Click Element  link: ${performance_doc}
    Wait And Verify Page Contains Text  Participant Feedback:  20s  Participant Feedback: page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Performance Goals
    Wait And Click Element  ${performance_goals}
    Wait And Verify Page Contains Text  Performance Goals  20s  Performance Goals page not found
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Competencies
    Wait And Click Element  ${competencies}
    Wait And Verify Page Contains Text  Click Here  20s  Competencies page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click On The Goal
    [Arguments]  ${goal}
    Wait And Click Element  link: ${goal}
    Wait And Verify Page Contains Text  Basic Info  20s  PImprove Intake Process for IT Ops work page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Edit Button
    Wait And Click Element  ${edit_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Change Status
    [Arguments]  ${status}
    Wait And Click Element  ${status_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${status}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Save Changes
    Wait And Click Element  ${save_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Click Back Arrow
    Wait And Click Element  ${back_arrow}

Click Back Arrow To Comeback To Performance Goals Page
    Click Back Arrow
    Wait And Verify Page Contains Text  Performance Goals  20s  Performance Goals page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click On Click Here Button
    Wait And Click Element  ${click_here_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Here Button Behind Performance Management Process Stage
    Wait And Click Element  ${click_here_performance_management_process_stage}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Under Each Goal Give Test Comments
    [Arguments]  ${comment}
    ${count}=  get element count  ${iframe_count}
    ${count}=  Evaluate  ${count}+${1}
    Log to console  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Log to console  Comment:${i}
        Sleep  3s
#        select frame  xpath: (//iframe[@class="cke_wysiwyg_frame cke_reset"])[${i}]
        Sleep  3s
        Wait And Set Text  ${comment_input_box}  ${comment}
        unselect frame
        Sleep  3s
        Capture Page Screenshot And Retry If Required
    END

Click Save And Close
    Wait And Click Element  ${save_and_close}
    Sleep  20s
    Capture Page Screenshot And Retry If Required

Click Back Arrow To Comeback To Employee Self Evaluation Page
    Click Back Arrow
    Wait And Verify Page Contains Text  Employee Self-Evaluation:  20s  Employee Self-Evaluation: page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

For Each Competency Select Rating and Give Comments
    [Arguments]  ${rating}  ${comment}
    ${count}=  get element count  ${rating_dropdown}
    ${count}=  Evaluate  ${count}+${1}
    Log to console  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Log to console  Review:${i} And Comment:${i}
        Wait And Click Element  xpath: (//iframe[@class="cke_wysiwyg_frame cke_reset"])[${i}]/preceding::input[1]
        ${status}=  RUN KEYWORD And Return Status  wait until element is visible  xpath: //div[text()="${rating}"]  7s
        IF  ${status}!="True"
            Wait And Click Element  xpath: (//iframe[@class="cke_wysiwyg_frame cke_reset"])[${i}]/preceding::input[1]
        END
        Wait And Click Element  xpath: //div[text()="${rating}"]
        Sleep  3s
        select frame  xpath: (//iframe[@class="cke_wysiwyg_frame cke_reset"])[${i}]
        Sleep  3s
        Wait And Set Text  ${comment_input_box}  ${comment}
        unselect frame
        Sleep  3s
        Capture Page Screenshot And Retry If Required
    END

Click Submit
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Select Performance Review Period
    [Arguments]  ${value}
    IF  "${value}"!=""
        Wait And Click Element  ${review_period_dropdown}
        Select Required Value  ${review_period_value}  ${value}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Employee Self Evaluation Section
    [Arguments]  ${manager}  ${review_section}
    Sleep  3s
    ${document_xpath}=  Catenate   SEPARATOR=  xpath: (//a[text()='${manager}']//ancestor::table)[4]//preceding-sibling::span//child::a[text()='${review_section}']
    click on load more items
    Wait And Click Element  ${document_xpath}
    Wait And Verify Page Contains Text  ${review_section}  20s  Employee Self Evaluation page is not displayed
    Capture Page Screenshot And Retry If Required

Click on share and release
    Wait And Click Element  ${share_and_release}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Submit Button
    Wait And Click Element  ${submit_option}
    Sleep  5s
    Capture Page Screenshot

Select Employee Performance Review Period
    [Arguments]  ${value}
    IF  "${value}"!=""
        Wait And Click Element  ${performance_review_dropdown}
        Wait And Select Containing Value From Input  ${performance_review_value}  ${value}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Employee's Current task
    [Arguments]  ${review_section}  ${task}
    ${current_task_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${review_section}']//following::span[1]
    element should contain  ${current_task_xpath}  ${task}  Current task is not same as "${task}"
    Sleep  2s
    ${review_section_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${review_section}']
    Wait And Click Element  ${review_section_xpath}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Continue Acknowledge Document
    Wait And Click Element  ${continue_acknowledge_document}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Edit Button On Overall Feedback
    Wait And Click Element  ${edit_overall_feedback}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Fill Comments Under Participant Comments Section
    [Arguments]  ${comment}
#    Wait Until Element Is Visible    ${iframe_participant_comments}
#    Select Frame    ${iframe_participant_comments}
    Sleep  3s
    Wait And Set Text  ${comment_input_box}  ${comment}
#    unselect frame
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Give Rating And Comment
    [Arguments]  ${rating}  ${comment}  ${rating_type}
    Sleep  5s
    ${count}=  get element count  xpath: //label[text()="${rating_type}"]
    ${count}=  Evaluate  ${count}+${1}
    Log to console  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Log to console  Review:${i} And Comment:${i}
        Wait And Click Element  xpath: (//input[@class='x1s3'])[${i}]
        ${status}=  RUN KEYWORD And Return Status  wait until element is visible  xpath: //div[text()="${rating}"]  7s
        IF  ${status}!="True"
            Wait And Click Element  xpath: (//input[@class='x1s3'])[${i}]
        END
        Wait And Click Element  xpath: //div[text()="${rating}"]
        Sleep  3s
        select frame  xpath: (//iframe[@class="cke_wysiwyg_frame cke_reset"])[${i}]
        Sleep  3s
        Wait And Set Text  ${comment_input_box}  ${comment}
        unselect frame
        Sleep  3s
        Capture Page Screenshot And Retry If Required
    END

Click Here Button Under Performance Goals
    Wait And Click Element  ${click_here_performance_goals}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Here Button Under Competencies
    Wait And Click Element  ${click_here_competencies}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Setup Maintenance group
    [Arguments]  ${group}
    ${group_xpath}=  Catenate   SEPARATOR=  xpath: //h2[text()='Setup Maintenance']//following::a[text()='${group}']
    Wait And Click Element  ${group_xpath}
    Wait And Verify Page Contains Text  ${group}  20s  ${group} page is not displayed
    Capture Page Screenshot And Retry If Required

Delete Goal Created By Employee
    Sleep  3s
    Wait And Click Element  ${goal_created_by_employee_action}
    Sleep  3s
    Wait And Click Element  ${delete_goal_created_by_employee}
    wait until element is visible  ${warning_yes_button}  20s
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Warning Yes Button
    Wait And Click Element  ${warning_yes_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Current Financial Year Goal Plan
    [Arguments]  ${f_y_year}
    Wait And Click Element  link: ${f_y_year} Goal Plan
#    Wait And Click Element  link: AT23B_${f_y_year} Annual Review Senior Managers
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click On Goal
    [Arguments]  ${goal}
    Wait And Click Element  link: ${goal}
    Wait And Verify Page Contains Text  Test Goal Automation  20s  Test Goal Automation page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Delete Goal
    [Arguments]  ${goal}
    Sleep  3s
    Wait And Click Element  xpath: //a[text()="${goal}"]/following::img[1]
    Sleep  3s
    Wait And Click Element  ${delete_goal_created_by_employee}
    wait until element is visible  ${warning_yes_button}  20s
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Annual Review Managers
    [Arguments]  ${review_time}
    ${review_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${review_time}']
    Wait And Click Element  ${review_xpath}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Add Button
    Wait And Click Element  ${add_button}
    Wait And Verify Page Contains Text  Add Goal  20s  Add Goal page is not displayed
    Capture Page Screenshot And Retry If Required

Select Goal Plan under Basic Info
    [Arguments]  ${value}
    Wait And Click Element  ${goal_plan_dropdown}
    ${goal_plan_value}=  Catenate   SEPARATOR=  xpath: //ul[contains(@id,'sh:gp1Sel')]//following::li[text()='${value}']
    Select Required Value  ${goal_plan_value}  ${value}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Goal Name under Basic Info
    [Arguments]  ${input}
    Wait And Set Text  ${goal_name_input}  ${input}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Goal Description under Basic Info
    [Arguments]  ${description}
    Wait And Set Text  ${goal_description}  ${description}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Goal Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${goal_start_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Goal Target date
    [Arguments]  ${date}
    Wait And Set Text  ${target_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Goal Status
    [Arguments]  ${status}
    Wait And Click Element  ${goal_status_dropdown}
    ${goal_status_value}=  Catenate   SEPARATOR=  xpath: //ul[contains(@id,'ssSel')]//following::li[text()='${status}']
    Select Required Value  ${goal_status_value}  ${status}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Goal Comments
    [Arguments]  ${comment}
#    Wait Until Element Is Visible  ${goal_comment_iframe}
#    select frame  ${goal_comment_iframe}
    Sleep  2s
    Wait And Set Text  ${comment_input_box}  ${comment}
#    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify New Performance Goal Added
    [Arguments]  ${goal}  ${description}  ${status}
    ${goal_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${goal}']
    scroll element into view  ${goal_xpath}
    element should contain  ${goal_xpath}  ${goal}
    Sleep  2s
    ${description_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${goal}']//following::span[text()='${description}'][1]
    mouse over  ${description_xpath}
    element should contain  ${description_xpath}  ${description}
    Sleep  2s
    ${status_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${goal}']//following::span[text()='${status}'][1]
    scroll element into view  ${status_xpath}
    element should contain  ${status_xpath}  ${status}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Search and Select Employee's Current task
    [Arguments]  ${review_section}  ${task}
    IF  "${review_section}"!=""
        IF  "${task}"!=""
            ${current_task_xpath}=  Catenate   SEPARATOR=  xpath: (//a[text()='${review_section}']//following::span[@title='${task}'])[1]
            element should contain  ${current_task_xpath}  ${task}  Current task is not same as in "Completed" Status
            Sleep  2s
            ${review_section_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${review_section}']
            Wait And Click Element  ${review_section_xpath}
            Wait And Verify Page Contains Text  ${review_section}  20s  ${review_section} page is not displayed
        ELSE
            ${completed_task_xpath}=  Catenate   SEPARATOR=  xpath: //span[@title='Completed']
            element should contain  ${completed_task_xpath}  Completed  Performance Document is not same as in "Completed" Status
            Sleep  2s
            ${completed_document}=  Catenate   SEPARATOR=  xpath://span[@title='Completed']//preceding::a[text()='${review_section}']
            element should be visible  ${completed_document}  Current Document is not in Completed status
            Wait And Click Element  ${completed_document}
            Wait And Verify Page Contains Text  ${review_section}  20s  ${review_section} page is not displayed
        END
    ELSE
        ${completed_task_xpath}=  Catenate   SEPARATOR=  xpath: //span[@title='Completed']
        element should contain  ${completed_task_xpath}  Completed  Performance Document is not same as in "Completed" Status
        Sleep  2s
        ${completed_document}=  Catenate   SEPARATOR=  xpath://span[@title='Completed']//preceding::a[1]
        Wait And Click Element  ${completed_document}
        Wait And Verify Page Contains Text  Performance Goals  20s  Performance Goals is not displayed in page
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify the Performance Document is Completed
    element should not be visible  ${click_here_button}  Click Here button under Performance Goal page is not Visible as expected
    Sleep  2s
    element should not be visible   ${add_button}  Add Button under Performance Goal is not visible as expected
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on Performance Templates link
    Wait Until Page Contains  Performance Templates  20s  Performance Templates link is not displayed
    Capture Page Screenshot
    Click Element  ${performance_templates_link}
    Wait Until Page Contains  Search Results  20s  Performance Templates search result page is not displayed
    Capture Page Screenshot

Check Show Filter option
    ${status}=  RUN KEYWORD And Return Status  Wait until element is visible  ${show_filter}  7s
    IF  '${status}'=='True'
        Wait And Click Element  ${show_filter}
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on clear Document status filter
    ${status}=  RUN KEYWORD And Return Status  element should be visible  ${clear_document_status_filter}  7s
    IF  '${status}'!='False'
        Wait And Click Element  ${clear_document_status_filter}
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Manage Participant Feedback of Review Document Section
    [Arguments]  ${manager}  ${review_section}  ${action}
    Sleep  3s
    ${action_xpath}=  Catenate   SEPARATOR=  xpath: (//a[text()='${manager}']//ancestor::table)[4]//preceding-sibling::span//child::a[text()='${review_section}']//following::a[contains(@title,'Actions')][1]
    Click on Load More Items
    scroll element into view  ${action_xpath}
    Wait And Click Element  ${action_xpath}
    ${participant_feedback_xpath}=  Catenate   SEPARATOR=  xpath: //td[text()='${action}']
    wait until element is visible  ${participant_feedback_xpath}  5s
    Wait And Click Element  ${participant_feedback_xpath}
    Wait And Verify Page Contains Text  ${action}  20s  ${action} page is not displayed
    Capture Page Screenshot And Retry If Required

Click Add on Manage Participant Feedback page
    Wait And Click Element  ${add_button}
    Wait And Verify Page Contains Text  Add Participants  20s  Add Participants page is not displayed
    Capture Page Screenshot And Retry If Required

Select Participant name
    [Arguments]  ${input}
    Wait And Set Text  ${add_person_dropdown}  ${input}
    wait until element is visible  ${add_person_value}  5s
    Wait And Click Element  ${add_person_value}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify Checkbox is enabled for employee selected
    [Arguments]  ${name}
    ${employee_checkbox_xpath}=  Catenate   SEPARATOR=  xpath: //span[text()='${name}']//ancestor::td//input[@type='checkbox']
    mouse over  ${employee_checkbox_xpath}
    checkbox should be selected  ${employee_checkbox_xpath}
    Capture Page Screenshot And Retry If Required

Click on Send Request
    Wait And Click Element  ${send_request}
    Wait And Verify Page Contains Element  ${due_date}  20s  Send Request page is not displayed
    Capture Page Screenshot And Retry If Required

Enter Due Date for Send request
    ${date}=  Get incremented Date  30
    Log to console  Incremented date: ${date}
    Wait And Set Text  ${due_date}   ${date}
    Capture Page Screenshot And Retry If Required

Enter Message to Participant
    [Arguments]  ${message}
    Wait And Set Text  ${message_to_participant}  ${message}
    Sleep  2s
    capture page screenshot and retry if required

Click submit for send request
    Wait And Click Element  ${submit_send_request}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Show Additional Info
    Wait And Click Element  ${show_additional_info}
    Sleep  2s
    capture page screenshot and retry if required

Verify Participant Feedback given by participant
    [Arguments]  ${participant}  ${participant_comment}
    ${participants_feedback_xpath}=  Catenate   SEPARATOR=  xpath: //h2[text()='Participant Feedback']/following::span[text()='${participant}']/following::div[contains(@id,'rte2Rte::c')]
    scroll element into view  ${participants_feedback_xpath}
    element should be visible  ${participants_feedback_xpath}
    ${comments_check}=    Get Text  ${participants_feedback_xpath}
    IF  '${comments_check}'=='${participant_comment}'
        Log  Verification Completed Successfully for the Comments Provided by Participant
    ELSE
        FAIL  Participant Comment not matched
    END
    Capture Page Screenshot And Retry If Required

Verify participant feedback added
    [Arguments]  ${name}
    ${feedback_add_xpath}=  Catenate   SEPARATOR=  xpath:  //h2[text()='Participants']//following::span[text()='${name}']
    scroll element into view    ${feedback_add_xpath}
    element should be visible  ${feedback_add_xpath}
    Capture Page Screenshot And Retry If Required

Select Employee's Performance Document
    [Arguments]  ${review_section}
    ${review_section_xpath}=  Catenate   SEPARATOR=  xpath: //a[text()='${review_section}']
    scroll element into view  ${review_section_xpath}
    Wait And Click Element  ${review_section_xpath}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Click Here
    Wait And Click Element  ${click_here}
    Wait And Verify Page Contains Text  Questionnaire  20s  Questionnaire page is not displayed
    Capture Page Screenshot And Retry If Required

Select met with your manager dropdown
    [Arguments]  ${input}
    Wait And Click Element  ${met_with_manager_dropdown}
    ${met_with_manager_value}=  Catenate   SEPARATOR=  xpath: //ul[contains(@id,'dc_soc1::pop')]//li[text()='${input}']
    Wait And Click Element  ${met_with_manager_value}
    capture page screenshot and retry if required

Enter Comments for performance document by Employee
    [Arguments]  ${comments}
    IF  '${comments}'!=''
#        Wait Until Element Is Visible  ${iframe_provide_performance_comments}
#        select frame  ${iframe_provide_performance_comments}
        Sleep  3s
        scroll element into view  ${comments_text_box}
        Sleep  2s
        Wait And Click Element   ${comments_text_box}
        Sleep  2s
        Wait And Set Text  ${comments_text_box}  ${comments}
#        unselect frame
    END
    Capture Page Screenshot And Retry If Required

Expand Performance Documents Manager Comments section
    scroll element into view  ${manager_comments_expand}
    Wait And Click Element  ${manager_comments_expand}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Check Manager Comments in performance document
    [Arguments]  ${manager_comments}
    Sleep  2s
    scroll element into view  ${checkin_comments}
    element should be visible  ${checkin_comments}
    ${manager_comments_check}=  get text  ${checkin_comments}
    IF  '${manager_comments_check}'=='${manager_comments}'
        Log  Verification Completed Successfully for the Comments Provided by Manager
    ELSE
        FAIL  Manager Comments not matched
    END
    Log  Comments given by Manager: ${manager_comments_check}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Expand Performance Documents Employee Comments section
    ${employee_Comments}=  Catenate   SEPARATOR=  xpath: //h2[contains(text(),'Employee Comments')]//following::a/img[@title='Expand']
    scroll element into view  ${employee_Comments}
    Wait And Click Element  ${employee_Comments}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Employee Comments in performance document
    [Arguments]  ${meeting_check_in}  ${comments}
    ${employee_Comments_xpath}=  Catenate   SEPARATOR=  xpath: //h2[contains(text(),'Employee Comments')]//following::label[contains(text(),'Check-In comments')]//preceding-sibling::div/p[1]
    ${employee_check_in_xpath}=  Catenate   SEPARATOR=  xpath: //h2[contains(text(),'Employee Comments')]//following::span[text()='${meeting_check_in}']
    scroll element into view  ${employee_Comments_xpath}
    element should be visible  ${employee_check_in_xpath}
    ${employee_check_in}=  get text  ${employee_check_in_xpath}
    IF  '${employee_check_in}'=='${meeting_check_in}'
        Log  Verification Completed Successfully for the Employee Check In the Meting
    ELSE
        FAIL  Employee Check In details not displayed
    END
    Log  Comments given by Employee : ${employee_check_in}
    Sleep  2s
    ${employee_comment}=  get text  ${employee_Comments_xpath}
    IF  '${employee_comment}'=='${comments}'
        Log  Verification Completed Successfully for the Comments Provided by Employee
    ELSE
        FAIL  Manager Comments not matched
    END
    Log  Comments given by Employee : ${employee_comment}
    Capture Page Screenshot

Select Option About Your Meeting
    [Arguments]  ${value}
    Wait And Click Element  ${did_you_meet_dropdown}
    Sleep  2s
    Wait And Click Element  xpath://li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Add Comment To Questionnaire
    [Arguments]  ${comment}
#    wait until element is visible  ${iframe_count}  20s
#    select frame  ${iframe_count}
    Sleep  3s
    Wait And Set Text  ${comment_input_box}  ${comment}
    unselect frame
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Manager Mid Year Check In
    mouse over  ${submit_button}
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Set Check In Date
    [Arguments]  ${date}
    Wait And Set Text  ${check_in_date_input}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Load More Items
    FOR  ${i}  IN RANGE  0  99
        ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${load_more_option}
        Log To Console  ${status}
        IF  "${status}"=="False"
            Exit For Loop
        ELSE
            Wait And Click Element  ${load_more_option}
            Sleep  3s
        END
    END

Click on Document status filter as Completed
    ${status}=  RUN KEYWORD And Return Status  element should be visible  ${document_filter_completed}  7s
    IF  '${status}'!='False'
        Wait And Click Element  ${document_filter_completed}
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on the performance document of the employee to provide feedback
    [Arguments]  ${person_name}  ${document_name}
    ${employee_xpath}=  Catenate  SEPARATOR=  //div[text()='    ${person_name}    ']/parent::div//ancestor::table//a
    Wait Until Page Contains  ${person_name}  20s  Feedback request form for the employee is not listed
    Capture Page Screenshot and Retry If Required
    Element Text Should Be  xpath:${employee_xpath}  ${document_name}
    Scroll Element Into View  xpath:${employee_xpath}
    Click Element  xpath:${employee_xpath}
    Wait Until Page Contains  Document Details  20s  Feedback detail page is not listed
    Capture Page Screenshot and Retry If Required

Select Review Period
    [Arguments]  ${period}
    Wait And Click Element  ${performance_review_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${period}"]

Click on Performance Documents Link
    Wait Until Page Contains  Performance Documents  20s  Performance Documents link is not displayed
    Capture Page Screenshot
    Click Element  ${performance_documents_link}
    Wait Until Page Contains  Search Performance Documents  20s  Search Performance Documents page is not displayed
    Capture Page Screenshot

Add Overall Feedback
    [Arguments]  ${comment}
    Sleep  5s
    select frame  xpath: (//iframe[@class="cke_wysiwyg_frame cke_reset"])
    Sleep  3s
    Wait And Set Text  ${comment_input_box}  ${comment}
    unselect frame
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Save Button
    Wait And Click Element  ${overall_feedback_save_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Submit Manager Employee Evaluation
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Verify Transferred Performance Document
    [Arguments]  ${person_name}  ${document_name}
    ${document_xpath}=  Catenate  SEPARATOR=  //a[text()='${person_name}']//ancestor::table[1]/preceding-sibling::span//a[text()='${document_name}']
    Wait And Verify Page Contains Element  ${document_xpath}  20s  Transeferred Performance Document ${document_name} of Employee ${person_name} is visible
    Capture Page Screenshot And Retry If Required