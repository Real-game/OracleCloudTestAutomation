*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/MonitorProcesses.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Verify Progress And Confirm Status
    Wait And Click Element  ${status_refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  30
        mouse over  ${latest_report_status}
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  ${latest_report_status}  Succeeded
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${status_refresh_button}
        Sleep  5s
    END
    Log to console  Process Completed Successfully
    Capture Page Screenshot And Retry If Required

Verify Progress And Confirm Status for SGSR
    Wait And Click Element  ${status_refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  30
        mouse over  ${latest_report_status_sgsr}
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  ${latest_report_status_sgsr}  Succeeded
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${status_refresh_button}
        Sleep  5s
    END
    Log to console  Process Completed Successfully
    Capture Page Screenshot And Retry If Required

Monitor Status Of Process
    [Arguments]  ${process_name}
    Wait And Click Element  ${status_refresh_button}
    FOR  ${i}  IN RANGE  30
        mouse over  xpath: (//span[text()='${process_name}']/following::a[1])[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: (//span[text()='${process_name}']/following::a[1])[1]  Succeeded
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${status_refresh_button}
        Sleep  5s
    END
    Log to console  Process Completed Successfully
    Capture Page Screenshot And Retry If Required

Click refresh untill process status is completed
    [Arguments]  ${process_status_xpath}
#    Wait And Click Element  ${tasks_refresh_button}
    ${xpath}=  Catenate  SEPARATOR=  (//a[@title="${process_status_xpath}"]/following::span)[1]
    Wait And Verify Page Contains Element  ${xpath}  20s  Process Status not displayed
    Sleep  5s
    FOR  ${i}  IN RANGE  90
        mouse over  xpath: (//a[@title="${process_status_xpath}"]/following::span)[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: (//a[@title="${process_status_xpath}"]/following::span)[1]  Completed
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${tasks_refresh_button}
        Sleep  5s
    END
    IF  '${Status}'=='True'
        Log to console  Task Completed Successfully
    ELSE
        FAIL  Task Still Running
    END
    #Log to console  Task Completed Successfully
    Capture Page Screenshot And Retry If Required

select refresh untill process status is completed
    [Arguments]  ${process_status_xpath}  ${time_min}
    ${max_range}=  Evaluate  ${time_min}*${5}
    Log To Console  itr: ${max_range}
    Sleep  5s
    FOR  ${i}  IN RANGE  ${max_range}
        mouse over  xpath: (//a[@title="${process_status_xpath}"]/following::span)[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: (//a[@title="${process_status_xpath}"]/following::span)[1]  Completed
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  12s
        Wait And Click Element  ${tasks_refresh_button}
        Sleep  5s
    END
    IF  '${Status}'=='True'
        Log to console  Task Completed Successfully
    ELSE
        FAIL  Task Still Running
    END
    Capture Page Screenshot And Retry If Required

Monitor Status Of Given Process Name
    [Arguments]  ${process_name}
    Wait And Click Element  ${status_refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  30
        mouse over  xpath: (//span[text()='${process_name}']/following::span[2])[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: (//span[text()='${process_name}']/following::span[2])[1]  Succeeded
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${status_refresh_button}
        Sleep  5s
    END
    IF  "${Status}"!="True"
        Fail  Failed with Status : ${Status}
    END
    Log to console  Process Completed Successfully
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Monitor Status Of Given Process Id
    [Arguments]  ${process_id}
    Wait And Verify Page Contains Text  Manage Scheduled Processes  20s  Manage Scheduled Processes page not found
    Wait And Click Element  ${status_refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  50
        mouse over  xpath: (//span[text()='${process_id}']/following::span[1])[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: (//span[text()='${process_id}']/following::span[1])[1]  Succeeded
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${status_refresh_button}
        Sleep  5s
    END
    IF  "${Status}"!="True"
        Fail  Failed with Status : ${Status}
    END
    Log to console  Process Completed Successfully
    Sleep  3s
    Capture Page Screenshot And Retry If Required