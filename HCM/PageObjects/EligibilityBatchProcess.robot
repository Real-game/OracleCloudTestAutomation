*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/EligibilityBatchProcess.robot

*** Keywords ***

Select Batch Type
    [Arguments]  ${type}
    Wait And Click Element  ${batch_type_dropdown}
    Sleep  2s
    Select Required Value  ${batch_type_value}  ${type}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Current date check box
    Wait And Click Element  ${current_date_checkbox}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Eligibility Review Period
    [Arguments]  ${period}
    Wait And Click Element  ${eligibility_review_period_dropdown}
    Sleep  2s
    Select Required Value  ${eligibility_review_period_value}  ${period}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Performance Document Name
    [Arguments]  ${document_name}
    Wait And Set Text  ${performance_document_name_input}  ${document_name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Eligible Performance Document checkbox
    Wait And Click Element  ${eligible_performance_label}
    Sleep  2s
    Wait And Click Element  ${eligible_performance_check}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Enter Maximum Number of Threads Created
    [Arguments]  ${input}
    Wait And Set Text  ${max_num_threads_input}  ${input}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Purge Historic Performance Management Eligibility Data
    Wait And Click Element  ${eligibility_status_check}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Submit
    Wait And Click Element  ${submit_option}
    Sleep  5s
    Capture Page Screenshot

Select Warning Ok
    Wait And Click Element  ${ok_button}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Ok To Confirm
    Wait And Click Element  ${ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Get And Return Process Id
    Sleep  3s
    ${text}=  Wait And Get Text  ${submission_confirmation_number}
    Log  Confirmation Message: ${text}
    ${id}=  getProcessId  ${text}
    Log  Process ID is ${id}
    [Return]  ${id}

Click Monitor Process Button
    Wait And Click Element  ${monitor_process_button}
    Wait And Verify Page Contains Text  Manage Scheduled Processes  20s  Manage Scheduled Processes page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

