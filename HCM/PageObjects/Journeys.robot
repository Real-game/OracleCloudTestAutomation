*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Journeys.robot
Library  ../Helpers/Helpers.py
Resource  ../Locators/HomePage.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library           Collections
Library           OperatingSystem

*** Keywords ***
Click on Open Journeys tab
    Wait Until Page Contains  Open  20s  Open tab is not displayed in My journeys page
    Wait And Click Element  ${open_journeys}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click on Journey
    [Arguments]  ${journey_name}
    Wait Until Page Contains  ${journey_name}  20s  Journey is listed in the open journeys tab
    Capture Page Screenshot
    ${journey_xpath}=  Catenate  SEPARATOR=  //span[@title='    ${journey_name}  ']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Scroll To Element  ${journey_xpath}
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
     Sleep  2s
     Wait And Click Element  ${direct_reports_radio}
     Sleep  2s
     Wait And Click Element  ${reports_radio_overlay}
     Sleep  6s
     Capture Page Screenshot And Retry If Required

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
    Capture Page Screenshot And Retry If Required

Select Employee on Journeys
    [Arguments]    ${name}
    wait and set text    ${jouneys_input}    ${name}
    Sleep    2s
    wait and click element    ${journeys_search}
    capture page screenshot

Search Employee on Journeys
    [Arguments]    ${name}
    wait and set text    ${jouneys_input}    ${name}
    Sleep    2s
    wait and click element    ${journeys_search}
    capture page screenshot
    wait and click element    xpath: (//*[text()="${name}"])[1]
#    //span[text()="${name}"]
    Sleep    15s
    capture page screenshot
#    Wait Until Page Contains  xpath: //h2[text()="Employee tasks"]  20s  Employee tasks are listed in the my tasks page
#    Capture page screenshot

Login and Select Employee from Journeys
    [Arguments]    ${input}    ${csv_path}
    Login Using  ${input}[HR Login]
    Log  Step 4
    Set Log Level    NONE
    click on homepage
#    Log  Step 5 - 6
    Go to my client group Journey
#    Log  Step 7 - 9
    Search Employee on Journeys    ${input}[Employee Login Name]

    # 1. Scrape all task names from web UI
    ${actual_tasks}=    Create List
    FOR    ${index}    IN RANGE    1    100
        ${locator}=    Set Variable    (//ul[@aria-label="Employee tasks"]//child::div[contains(@class,"worker-journeys-task-name")])[${index}]
        ${status}=     Run Keyword And Return Status    Element Should Be Visible    ${locator}    timeout=5s
        Exit For Loop If    '${status}' == 'False'
        scroll element into view    ${locator}
        ${task}=    Get Text    ${locator}
        Append To List    ${actual_tasks}    ${task}
    END
    Log To Console    \n Actual Tasks from UI: ${actual_tasks}

    # 2. Read expected tasks from CSV
    ${raw}=          Get File    ${csv_path}
    ${expected_tasks}=    Split To Lines    ${raw}
    remove values from list    ${expected_tasks}     Task Name   # Remove header row

    Log To Console    \n Expected Tasks from CSV: ${expected_tasks}

    # 3. Compare task lists
    ${matched}=       Evaluate    list(set(${expected_tasks}) & set(${actual_tasks}))
    ${missing}=       Evaluate    list(set(${expected_tasks}) - set(${actual_tasks}))
    ${unexpected}=    Evaluate    list(set(${actual_tasks}) - set(${expected_tasks}))

    # 4. Log results
    Log To Console    \n Matched Tasks: ${matched}
    Log To Console    \n Missing Tasks: ${missing}
    Log To Console    \n️ Unexpected Tasks: ${unexpected}
    set log level    INFO
    RETURN    ${matched}    ${missing}    ${unexpected}


#Preboarding
#//ul[@aria-label="Employee tasks"]//child::div[@slot="overline"]

#//oj-list-item-layout[contains(@id,"mgrJourneyEmployeeTasksListItemHeaderLayout-item")]//div[text()="FAQ's"]
