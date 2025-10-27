*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/EvaluatePerformance.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Search For Person
    [Arguments]  ${name}
    Wait And Send Keys  ${input_person_name}  ${name}
    Sleep  3s
    Wait And Click Element  ${search_icon}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Dots Beside Given Action
    [Arguments]  ${action}
    Wait And Click Element  xpath: //img[@title="${action}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Action Menu
    [Arguments]  ${action_menu}
    Wait And Click Element  xpath: //td[text()="${action_menu}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Participants
    Wait And Click Element  ${add_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Search And Select Participants
    [Arguments]  ${name}
    Wait And Send Keys  ${search_participants}  ${name}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Send Request
    Wait And Click Element  ${send_request_button}
    Wait And Verify Page Contains Text  Send Request  20s  Send Request page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Due Date
    [Arguments]  ${date}
    Wait And Set Text  ${input_due_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Click 1 of 1 participants responded
    [Arguments]  ${performance_doc}
    Wait And Click Element  xpath: //a[text()="${performance_doc}"]/following::a[text()="1 of 1 participants responded"]
    Wait And Verify Page Contains Text  Manage Participant Feedback:  20s  Manage Participant Feedback: page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click View Feedback
    Wait And Click Element  ${view_feedback}
    Wait And Verify Page Contains Text  Participant Feedback:  20s  Participant Feedback: page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

View Participant Comments
    [Arguments]  ${comment}
    element should be visible  xpath: //div[text()="${comment}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Document
    [Arguments]  ${doc_name}
    Wait And Click Element  link:${doc_name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Action Menu
    [Arguments]  ${action_menu}
    wait until element is visible  xpath: //td[text()="${action_menu}"]  7s
    Sleep  3s
    Capture Page Screenshot And Retry If Required