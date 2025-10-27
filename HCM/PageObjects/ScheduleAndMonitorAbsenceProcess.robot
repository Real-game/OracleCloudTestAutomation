*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  AutoItLibrary
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ScheduleAndMonitorAbsenceProcess.robot

*** Keywords ***

Click on the homepage
    Wait And Click Element  ${homepage}
    Capture Page Screenshot

Click on update accural plan enrollments run button
    click element   ${update_accural_plan_enrollments}
    Sleep  2s
    click element   ${update_accural_plan_enrollments_run}
    Sleep  10s
    wait until page contains  Update Accrual Plan Enrollments  20s  Update Accrual Plan Enrollments Basic section is not displayed
    Capture Page Screenshot
    Log To Console  Navigated to Submission page.

Select the Effective date
    [Arguments]  ${date}
    Click Element  ${Effective_date}
    ${calendar_value}=  Split String   ${date}  -
    Wait Until Element Is Visible    ${year_input}      30     year input is not displayed
    Sleep  3s
    FOR  ${e}  IN RANGE  0  100
        ${month}=  Get Element Attribute  ${month_drop_down}  title
        ${year}=  Get Element Attribute  ${year_input}  title
        ${status}=  Run Keyword And Return Status  Should Contain  ${month}  ${calendar_value}[1]
        ${status1}=  Run Keyword And Return Status  Should Contain  ${year}  ${calendar_value}[2]
        IF  "${status}"=="True"
            IF  "${status1}"=="True"
                Select Required Value  ${date_value}    ${calendar_value}[0]
                Exit For Loop
            ELSE
                Wait And Click Element  ${next_month}
            END
        ELSE
            Wait And Click Element  ${next_month}
        END
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

New absence Submission for employee
    [Arguments]  ${date}  ${name}
    Wait And Set Text  ${effective_date_inp}  ${date}
    Sleep  3s
    wait then click and set text  ${person_name}  ${name}
    Sleep  2s
    Wait And Click Element  ${submit}
    Wait And Verify Page Contains Element  ${submission_confirmation_number}  10s  Request still submitting
    ${text}=  Wait And Get Text  ${submission_confirmation_number}
    Log  text is ${text}
    ${id}=  getProcessId  ${text}
    Log  ID is ${id}
    Wait And Click Element  ${confirmation_yes}
    wait and verify page contains text  Schedule and Monitor Absence Process  20s  Schedule and Monitor Absence Process page is not displayed
    Sleep  3s
    ${message}=  Set Variable  ${0}
    FOR  ${i}  IN RANGE  100
        ${xpath_value}=  Catenate   SEPARATOR=   //span[text()='${id}']//following::span[1]
        Wait And Verify Page Contains Element  ${xpath_value}  20s  Captured batch request number is not shown in Batch table
        ${status}=  Run Keyword And Return Status  scroll element into view  ${xpath_value}
        LOG  ${status}
        IF  "${status}"=="False"
            scroll element into view  ${xpath_value}
        END
        ${get_text_status}=  Run Keyword And Return Status  ${message}=  get text  xpath: ${xpath_value}
        LOG  ${get_text_status}
        IF  "${get_text_status}"=="False"
            ${message}=  get text  xpath: ${xpath_value}
        END
        LOG  ${message}
        ${message_status}=  Run Keyword And Return Status  Should Contain  ${message}  Succeeded
        LOG  ${message_status}
        IF  "${message_status}"=="True"
            Exit For Loop
        END
        Sleep  5s
        Wait And Click Element  ${refresh_button}
    END
    IF  '${message}'=='Succeeded'
        Log  Batch completed successfully
    ELSE
        FAIL  Batch still running
    END

Click on calculate accurals and balances run button
    Sleep  2s
    click Element  ${calculate_accurals_and_balances}
    Sleep  3s
    Scroll Element Into View  ${calculate_accurals_and_balances_run}
    click element  ${calculate_accurals_and_balances_run}
    Sleep  10s
    wait until page contains  Calculate Accruals and Balances  20s  Calculate Accruals and Balances is not displayed
    Capture Page Screenshot
    Log To Console  Navigated to Calculate Accruals and Balances page.

Select Plan Type
    [Arguments]  ${plan}
    Mouse Over  ${plan_type}
    Sleep  3s
    Wait And Click Element  ${plan_type}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${plan}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Business Unit
    [Arguments]  ${unit}
    Mouse Over  ${business_unit_dropdown}
    Sleep  3s
    Wait And Click Element  ${business_unit_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //span[text()="${unit}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Button
    Wait And Click Element  ${submit}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Get And Return Process Id
    Sleep  3s
    ${text}=  Wait And Get Text  ${submission_confirmation_number}
    Log  Confirmation Message: ${text}
    ${id}=  getProcessId  ${text}
    Log  Process ID is ${id}
    [Return]  ${id}

Click Confirmation Ok Button
    Sleep  3s
    Wait And Click Element  ${confirmation_yes}
    Sleep  3s
    wait and verify page contains text  Schedule and Monitor Absence Process  20s  Schedule and Monitor Absence Process page is not displayed
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Time Range
    [Arguments]  ${time_range}
    Sleep  3s
    Wait And Click Element  ${time_range_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${time_range}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Process Succeeded Status
    [Arguments]  ${process_id}  ${time_min}  ${refresh_time}
    ${max_range}=  Evaluate  ${time_min}*${5}
    Log To Console  itr: ${max_range}
    Wait And Click Element  ${refresh_button}
    FOR  ${i}  IN RANGE  ${max_range}
        Sleep  3s
        ${xpath_value}=  Catenate   SEPARATOR=   //span[text()='${process_id}']//following::span[1]
        scroll element into view  xpath: ${xpath_value}
        Mouse Over  xpath: ${xpath_value}
        ${status1}=  Run Keyword And Return Status  ${message}=  get text  xpath: ${xpath_value}
        IF  "${status1}"!="True"
            ${message}=  get text  xpath: ${xpath_value}
        END
        Log To Console  Status: ${message}
        ${status}=  Run Keyword And Return Status  Should Contain  ${message}  Succeeded
        IF  "${status}"=="True"
            Exit For Loop
        END
        Sleep  ${refresh_time}s
        Wait And Click Element  ${refresh_button}
    END
    IF  "${status}"!="True"
        Fail  Failed with status : ${message}
    END
