*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Journeys.robot
Library  ../Helpers/Helpers.py
Resource  ../Locators/HomePage.robot

*** Keywords ***
Click on Open Journeys tab
    Wait Until Page Contains  Open  20s  Open tab is not displayed in My journeys page
    Wait And Click Element  ${open_journeys}

Click on Journey
    [Arguments]  ${journey_name}
    Wait Until Page Contains  ${journey_name}  20s  Journey is listed in the open journeys tab
    Capture Page Screenshot
    ${journey_xpath}=  Catenate  SEPARATOR=  //span[@title='    ${journey_name}  ']
    Click Element  xpath: ${journey_xpath}
    Wait Until Page Contains  Tasks  20s  Journeys list page is not displayed
    Capture Page Screenshot

Verify task status
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${tasks_list}  20s
    IF  '${check}'=='True'
        Log  Tasks list is displayed
        Capture Page Screenshot
    ELSE
        Fail  No tasks are listed in the task list page
    END
    ${total_task_list_count}=   Get Element Count  ${tasks_list}
    Log  Total task count in the page is ${total_task_list_count}
    ${completed_task_list_count}=  Get Element Count  ${completed_task_list}
    Log   Total completed task count in the page is ${completed_task_list_count}

Click on Journeys
    Wait And Click Element  ${journeys_link}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on a Journey Tab
    Sleep  10s
    [Arguments]  ${tab_name}
    ${xpath}=   Catenate  SEPARATOR=  //a//span[text()='${tab_name}']
    Wait And Click Element  ${xpath}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Direct Reports
     Wait And Click Element  ${reports}
     Wait And Click Element  ${direct_reports_radio}
     Wait And Click Element  ${reports_radio_overlay}



Click on Journey Name
    Sleep  5s
    [Arguments]  ${journey_name}
    Wait Until Page Contains  ${journey_name}  20s  Journey is listed in the open journeys tab
    Capture Page Screenshot
    ${journey_xpath}=  Catenate  SEPARATOR=  //span[@title='    ${journey_name}  ']
    Click Element  xpath: ${journey_xpath}
    Wait Until Page Contains  Employee tasks  20s  Task list page is not displayed
    Capture Page Screenshot

Verify Assigned Journey Task Status
    Sleep  10s
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${assigned_journey_tasks_list}  20s
    IF  '${check}'=='True'
        Log  Tasks list is displayed
        ${total_task_list_count}=   Get Element Count  ${assigned_journey_tasks_list}
        Log  Total task count in the page is ${total_task_list_count}
        ${completed_task_list_count}=  Get Element Count  ${completed_task_list}
        Log   Total completed task count in the page is ${completed_task_list_count}
        ${tasks_yet_to_complete}=  Evaluate  ${total_task_list_count}- ${completed_task_list_count}
        Log   Tasks yet to be completed in the page - ${tasks_yet_to_complete}
    ELSE
        Fail  No tasks are listed in the task list page
    END

Get MX Cultural Census Task List
    Sleep  7s
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${cultural_census_task_list}  20s
    IF  '${check}'=='True'
        Log  Cultural Census is present
        ${total_task_list_count}=   Get Element Count  ${cultural_census_task_list}
        Log  Total MX Cultural Census list in the page is ${total_task_list_count}
    ELSE
        Fail  No tasks are listed in the task list page
    END
