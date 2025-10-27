*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/SubmitPayrollFlow.robot

*** Keywords ***
Enter Payroll flow as
    [Arguments]  ${flow}
    Wait And Set Text  ${payroll_flow}  ${flow}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Payroll from dropdown
    [Arguments]  ${payroll}
    Wait And Click Element  ${payroll_dropdown}
    Sleep  5s
    ${check}=  Run Keyword And Return Status  Page Should Contain  ${payroll}
    IF  '${check}'!='True'
        Wait And Click Element  ${payroll_dropdown}
    END
    Wait And Click Element  xpath: //td[text()="${payroll}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Payroll Period from dropdown
    [Arguments]  ${payrollperiod}
    Wait And Click Element  ${payroll_period_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${payrollperiod}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Run Type from dropdown
    [Arguments]  ${runtype}
    Wait And Click Element  ${run_type_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${runtype}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Submit
    Wait And Click Element  ${submit_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Effective Date as
    [Arguments]  ${effective_date}
    Wait And Set Text  ${effective_date_text_box}  ${effective_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Start Date as
    [Arguments]  ${start_date}
    Wait And Set Text  ${start_date_text_box}  ${start_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter End Date as
    [Arguments]  ${end_date}
    Wait And Set Text  ${end_date_text_box}  ${end_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Process Date as
    [Arguments]  ${process_date}
    Wait And Set Text  ${process_date_text_box}  ${process_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Scope from dropdown
    [Arguments]  ${scope}
    Wait And Click Element  ${scope_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${scope}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Report Category from dropdown
    [Arguments]  ${report_category}
    Wait And Click Element  ${report_category_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${report_category}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Click on Expand Output and Log Files
    Wait And Click Element  ${expand_output_and_log_files}
    Sleep  20s
    Capture Page Screenshot And Retry If Required

Download a Log File
    ${process_id} = Wait And Get Text   ${first_process_id}
    Wait And Click Element  xpath: //a[text()="ESS_L_${process_id}"]

Enter Process Start Date
    [Arguments]  ${process_date}
    Wait And Set Text  ${process_start_date}  ${process_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Process End Date
    [Arguments]  ${process_date}
    Wait And Set Text  ${process_end_date}  ${process_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
