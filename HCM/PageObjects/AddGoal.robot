*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/AddGoal.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Under Goal Plan dropdown Select
    [Arguments]  ${f_y_year}
    Wait And Click Element  ${goal_plan_dropdown}
    Sleep  3s
    IF  "${f_y_year}"!=""
        Wait And Click Element  xpath: //li[text()="${f_y_year} Goal Plan"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set text Goal Name
    [Arguments]  ${goal}
    Wait And Set Text  ${goal_name}  ${goal}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set text Description
    [Arguments]  ${description_details}
    Wait And Set Text  ${description}  ${description_details}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set text Start Date
    [Arguments]  ${start_date_details}
    Wait And Set Text  ${start_date}  ${start_date_details}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set text Target Completion Date
    [Arguments]  ${target_completion_date_details}
    Wait And Set Text  ${target_completion_date}  ${target_completion_date_details}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Status
    [Arguments]  ${status_details}
    Wait And Click Element  ${addgoal_status_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${status_details}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Comments
    [Arguments]  ${comments_details}
    Wait Until Element Is Visible    ${iframe_add_goal_comments}
    Select Frame    ${iframe_add_goal_comments}
    Sleep  3s
    Wait And Set Text  ${comments_text_box}  ${comments_details}
    unselect frame

