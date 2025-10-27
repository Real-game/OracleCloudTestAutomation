*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/FlowSubmission.robot

*** Keywords ***

Select CA Legislative Data Group
    Wait And Click Element  ${legislative_data_group_input_box}
    Sleep  3s
    Wait And Click Element  ${ca_legislative_data_group}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Search And Select Specific Flow Pattern
    [Arguments]  ${pattern}
    Wait And Set Text  ${flow_pattern_input_box}  ${pattern}
    Sleep  3s
    Wait And Click Element  ${flow_pattern_search_icon}
    Sleep  5s
    Wait And Click Element  link:${pattern}
    Wait And Verify Page Contains Text  Submit a Payroll Flow  30s  Submit a Payroll Flow page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Payroll Flow
    [Arguments]  ${payroll_flow}
    Wait And Set Text  ${payroll_flow_input_box}  ${payroll_flow}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Process Start Date
    [Arguments]  ${start_date}
    Wait And Set Text  ${process_start_date_input_box}  ${start_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Process End Date
    [Arguments]  ${end_date}
    Wait And Set Text  ${process_end_date_input_box}  ${end_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Payroll
    [Arguments]  ${payroll}
    Wait And Click Element  ${payroll_input_box}
    Sleep  3s
    ${checker}=  RUN KEYWORD And Return Status  Wait And Click Element  xpath://td[text()="${payroll}"]
    IF  "${checker}"!="True"
        Wait And Click Element  ${payroll_input_box}
        Sleep  3s
        Wait And Click Element  xpath://td[text()="${payroll}"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Button
    Wait And Click Element  ${submit_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Process Status
    [Arguments]  ${pattern}
    Wait And Click Element  ${refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  3000
        mouse over  xpath: //a[@title="${pattern}"]/following::span[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: //a[@title="${pattern}"]/following::span[1]  Completed
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${refresh_button}
        Sleep  5s
    END
    Capture Page Screenshot And Retry If Required

Select Pattern
    [Arguments]  ${pattern}
    Sleep  3s
    Wait And Click Element  link:${pattern}
    Wait And Verify Page Contains Text  This process is in Completed  30s  Process is not completed
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Payroll Period
    [Arguments]  ${period}
    Wait And Click Element  ${payroll_period_input_box}
    Sleep  3s
    Wait And Click Element  xpath://td[text()='${period}']
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Run Type
    [Arguments]  ${type}
    Wait And Click Element  ${run_type_input_box}
    Sleep  3s
    Wait And Click Element  xpath://td[text()='${type}']

Select Legislative data group as
    [Arguments]  ${legislativedatagroup}
    Wait And Click Element  ${legislative_data_group_dropdown}
    Sleep  2s
    Wait And Click Element  xpath: //td[text()="${legislativedatagroup}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Flow Pattern Value and search
    [Arguments]  ${fLowpattern}
    Wait And Set Text  ${flow_pattern_search}  ${flowpattern}
    Sleep  3s
    Wait And Click Element  ${flow_pattern_search_button}
    Sleep  3s
    Wait And Click Element  xpath: //span[text()="${fLowpattern}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Effective Date
    [Arguments]  ${date}
    Mouse Over  ${effective_date}
    Sleep  3s
    Wait And Set Text  ${effective_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Expand Output And Log Files
    Mouse Over  ${expand_output_and_log_file}
    Sleep  3s
    Wait And Click Element  ${expand_output_and_log_file}
    Sleep  10s
    Capture Page Screenshot And Retry If Required

Get Process Id
    [Arguments]  ${pattern}
    Sleep  5s
    Mouse Over  xpath: //span[text()="${pattern}"]/preceding::span[1]
    Sleep  3s
    ${process_id}=  get text  xpath: //span[text()="${pattern}"]/preceding::span[1]
    Log To Console  ID:${process_id}
    [Return]  ${process_id}
    Sleep  3s

Download Log File
    [Arguments]  ${pattern}  ${process_id}
    Mouse Over  xpath:(//span[text()="${pattern}"]/following::a)[1]
    Sleep  3s
    Wait And Click Element  xpath:(//span[text()="${pattern}"]/following::a)[1]
    Sleep  15s
    Capture Page Screenshot And Retry If Required

Check Successful Submission Status
    Sleep  7s
    ${status}=  Run Keyword And Return Status  element should not be visible  ${submit_error_popup}
    IF  "${status}"!="True"
        Fail  Failed: The payroll flow name already exists. Enter a different name for the payroll flow.
    END

Check Submission Status With Error
    Sleep  7s
    ${status}=  Run Keyword And Return Status  element should be visible  ${submit_error_popup}
    IF  "${status}"!="True"
        Fail  Failed: Pop-up with error should be visible.
    END
    Log To Console  Pop-up with error is visible.
    Capture Page Screenshot And Retry If Required

Select Organization Payment Method
    [Arguments]  ${method}
    Wait And Click Element  ${organization_payment_method_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${method}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Consolidation Group
    [Arguments]  ${group}
    Wait And Click Element  ${consolidation_group_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${group}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Select Start Cheque Number
    [Arguments]  ${start_number}
    Wait And Set Text  ${start_cheque_number_input}  ${start_number}
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Select End Cheque Number
    [Arguments]  ${end_number}
    Wait And Set Text  ${end_cheque_number_input}  ${end_number}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Expand the Output And Log Files
    ${status}=  Run Keyword And Return Status  element should be visible  ${output_log_file_expand_option}
    IF  "${status}"=="True"
        Mouse Over  ${output_log_file_expand_option}
        Sleep  3s
        Wait And Click Element  ${output_log_file_expand_option}
        Sleep  10s
    END
    Capture Page Screenshot And Retry If Required

Input Person Number
    [Arguments]  ${person_number}
    ${status}=  Run Keyword And Return Status  Wait And Set Text  ${person_number_input}  ${person_number}
    IF  "${status}"=="False"
        Wait And Set Text  ${person_number_input}  ${person_number}
    END
    Sleep  1s
    Capture Page Screenshot And Retry If Required


