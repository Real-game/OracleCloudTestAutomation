*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  ../Keywords/CommonKeywords.py
Resource  ../Locators/Catalog.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Expand Shared Folders
     Wait And Click Element  ${shared_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot And Retry If Required

Expand Custom
     Wait And Click Element  ${custom_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot And Retry If Required

Expand Metrolinx
     Wait And Click Element  ${metrolinx_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot And Retry If Required

Expand Reports
     Wait And Click Element  ${reports_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot

Expand Payroll Reports
     Wait And Click Element  ${payroll_report_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot

Select PAY-REP-017_MX_Accrual Banks validation for BEE Timecards_v2
     Wait And Click Element  ${pay_rep_017_expand_icon}
     Sleep  2s
     Capture Page Screenshot

Select And Open MX_Accrual Banks validation for BEE Report
     Wait And Click Element  ${mx_accrual_bank_report_open_link}
     Sleep  5s
     page should contain  MX_Accrual Banks Valida...
     Capture Page Screenshot

Click Apply
     Select Frame   ${apply_form}
     Sleep  3s
     Wait And Click Element  ${apply_button}
     Sleep  5s
     select frame  ${bank_validation_frame}
     wait until element contains  ${report_confirmation_message}  Report Completed  300s
     Sleep  3s
     Capture Page Screenshot And Retry If Required

Expand Absence Reports
    Wait And Click Element  ${absence_report_folder_expand_icon}
    Sleep  5s
    capture page screenshot

Select ABS-REP-125 MX_Delta Absence report
    Wait And Click Element  ${absence_rep_125_folder}
    Sleep  5s
    capture page screenshot

Select And Open ABS_REP-125 MX_Delta Absence Report
    Wait And Click Element  ${mx_delta_absence_report_open_link}
    Sleep  45s
    page should contain  ABS_REP-125 MX_Delta Absence Report
    capture page screenshot

Expand HR Reports
    Wait And Click Element  ${hr_report_folder_expand_icon}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select HR-REP-007 - MX_Position Occupancy and Vacancy Report
    Wait And Click Element  ${hr_rep_007_mx_expand_icon}
    Sleep  5s
    capture page screenshot

Select HR-REP-134_MX Departures Report
    Wait And Click Element  ${hr_rep_134_mx_departure_expand_icon}
    Sleep  5s
    capture page screenshot

Select And Open MX_Position_Occupancy_and_Vacancy
    Wait And Click Element  ${mx_position_occupancy_and_vacancy_open_link}
    Sleep  5s
    capture page screenshot

Select Parameter
    [Arguments]  ${value1}  ${value2}  ${value3}  ${value4}
    Sleep  5s
    @{param_list}=  Create List  ${value1}  ${value2}  ${value3}  ${value4}
    Log To Console   ${param_list}
    Wait And Click Element  ${division_dropdown}
    ${class_value}=  get element attribute  xpath://li[contains(@id,'xdo:xdo:_paramsP_DIVISION_div_li_0')]  class
    IF  "${class_value}"=="selected"
        Wait And Click Element  xpath://li[contains(@id,'DIVISION')]//span[text()='All']
    END
    FOR  ${param}  IN  @{param_list}
        Wait And Click Element  xpath://li[contains(@id,'DIVISION')]//span[text()='${param}']
        Sleep  3s
    END
    Sleep  3s
    mouse over  ${apply_button}
    capture page screenshot

Select Aplly Button Frame
    Select Frame   ${apply_form}
    Sleep  3s

Click Apply Button
    Wait And Click Element  ${apply_button}
    Sleep  5s
    Capture Page Screenshot

Verify Report Completed Message
    select frame  ${bank_validation_frame}
    wait until element contains  ${report_confirmation_message}  Report Completed  300s
    Capture Page Screenshot

Select PAY-REP-024_Payroll Retro generated Entries Report
    Wait And Click Element  ${payq_rep_024_payroll_expand_icon}
    Sleep  5s
    capture page screenshot

Select PAY-REP-049_Payroll Retro generated Entries Report
    Wait And Click Element  ${payq_rep_049_payroll_expand_icon}
    Sleep  5s
    capture page screenshot

Select And Open Report
    [Arguments]  ${report_name}
    Sleep  3s
    Wait And Click Element  xpath://span[text()='${report_name}']/parent::td/parent::tr/following-sibling::tr//a[text()[contains(.,'Open')]]
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Set Retro Flow Name
    [Arguments]  ${report_name}
    Sleep  3s
    select frame  ${general_object_editor_frame}
    Wait And Click Element  ${retro_flow_name_dropdown}
    Sleep  3s
#    Wait And Click Element  xpath: //div[text()='${report_name}']
    Wait And Click Element  ${search_link}
    Sleep  5s
    Wait And Set Text  ${search_box}  ${report_name}
    Sleep  3s
    Wait And Click Element  ${search_button}
    Sleep  3s
    Wait And Click Element  xpath: //div[@value="${report_name}"]
    Sleep  3s
    Wait And Click Element  ${ok_button}
    Sleep  3s
    unselect frame
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Expand Interface Folder
    Wait And Click Element  ${interfaces_folder_expand_icon}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Expand HR Interface Folder
    Wait And Click Element  ${hr_interfaces_folder_expand_icon}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select LRN-INT-01 Folder
    Wait And Click Element  ${lrn_int_01_folder}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select LRN-INT-02 Folder
    Wait And Click Element  ${lrn_int_02_folder}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set P_LAST_RUN_DATE And Click Apply
    [Arguments]  ${date}
    select frame  ${general_object_editor_frame}
    Sleep  3s
    Wait And Set Text  ${p_last_run_date_input}  ${date}
    Sleep  3s
    Wait And Click Element  ${apply_button}
    Sleep  3s
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Document Frame
    [Arguments]  ${doc_frame_locator}  ${text_value}
    Select frame  ${doc_frame_locator}
    Sleep  3s
    Wait And Verify Page Contains Text  ${text_value}  50s  Report not visible
    unselect frame
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select HR-REP-108 Folder
     Wait And Click Element  ${hr_rep_108_hdl_loader_report_expand_icon}
     Sleep  2s
     Capture Page Screenshot

Extract the report content
    [Arguments]  ${iframe_path}
    Select frame  xpath: //iframe[contains(@id,'${iframe_path}')]
    Sleep  2s
    ${text}=  Get Element Attribute  xpath: //body/pre  innerHTML
    [return]  ${text}

Set Effective End Date And Click Apply
    [Arguments]  ${date}
    select frame  ${general_object_editor_frame}
    Sleep  3s
    Wait And Set Text  ${effective_end_date_input}  ${date}
    Sleep  3s
    Wait And Click Element  ${apply_button}
    Sleep  3s
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Shared Folder
    Wait And Click Element  ${shared_folder}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Expand Custom Folder
    Wait And Click Element  ${custom_folder_expand}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Expand Metrolinx Folder
    scroll element into view  ${metrolinx_folder_expand}
    Wait And Click Element  ${metrolinx_folder_expand}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Expand Reports Folder
    Wait And Click Element  ${reports_expand}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Expand HR Reports Folder
    Wait And Click Element  ${hr_reports_expand}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify HR Reports contains Open,Edit and More options
    scroll element into view  ${open_link}
    Verify Page Has Hyperlink  Open
    Verify Page Has Hyperlink  Edit
    Verify Page Has Hyperlink  More
    Wait And Verify Page Contains Element  ${open_link}  10s  Open option is not displayed in this page
    Wait And Verify Page Contains Element  ${edit_link}  10s  Edit option is not displayed in this page
    Wait And Verify Page Contains Element  ${more_link}  10s  More option is not displayed in this page
    Capture Page Screenshot And Retry If Required

Select Folder
    [Arguments]  ${folder_name}
    Wait And Click Element  xpath: //span[contains(@id,'${folder_name}')]
    Sleep  5s
    capture page screenshot

Set Termination Start and End Date
    [Arguments]  ${start_date}
    select frame  ${general_object_editor_frame}
    Sleep  3s
    Wait And Set Text  ${termination_start_date_input}  ${start_date}
    Sleep  3s
    ${current_date} =  get_current_date_dd_mmm_yyyy
    Wait And Set Text  ${termination_end_date_input}  ${current_date}
    Sleep  3s

Click Expand Absence Reports Folder
    Wait And Click Element  ${absence_reports_expand}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Expand option under the Folder
    [Arguments]  ${folder}
    ${folder_expand_xpath}=  Catenate   SEPARATOR=  //span[text()='${folder}']//parent::td//parent::tr//following-sibling::tr//a[text()='Expand']
    scroll element into view  ${folder_expand_xpath}
    Wait And Click Element  ${folder_expand_xpath}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click open under the report
    [Arguments]  ${report}
    ${open_report_xpath}=  Catenate   SEPARATOR=  //span[text()='${report}']//parent::td//parent::tr//following-sibling::tr//a[text()='Open']
    Wait And Click Element  ${open_report_xpath}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Enter Report From Date
    [Arguments]  ${from_date}
    select frame  ${reports_frame}
    Wait And Set Text  ${report_from_date}  ${from_date}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Enter Report To Date
    [Arguments]  ${to_date}
    Wait And Set Text  ${report_to_date}  ${to_date}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Report Apply Button
    Wait And Click Element  ${report_apply}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select View Report as excel
    Wait And Click Element  ${view_report}
    Sleep  2s
    wait until element is visible  ${excel_report}
    Wait And Click Element  ${excel_report}

Verify Report Completed
    select frame  ${bank_validation_frame}
    Wait until element contains  ${report_confirmation_message}  Report Completed  600s
    Sleep  2s
    Capture Page Screenshot

Validate Employee Number in Departure Report
    [Arguments]  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
    ${val1}  get_Employee_Number_Search_Validation  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
    IF  "${val1}" == "1"
        Log  Terminated Employee found in the Report
        Log to Console  Terminated Employee found in the Report
    ELSE
        Log  Terminated Employee not found in the Report
        Log to Console   Terminated Employee not found in the Report
    END

Validate Employee Number in StaffList BI Report
    [Arguments]  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
    ${val1}  get_Employee_Number_Search_Validation  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
    IF  "${val1}" == "1"
        Log  Hired Employee found in the Report
        Log to Console  Hired Employee found in the Report
    ELSE
        Log  Hired Employee not found in the Report
        Log to Console   Hired Employee not found in the Report
    END

Click on Create and Select an Option
    [Arguments]  ${option_name}
    Wait And Click Element  ${create_button}
    ${xpath} =  Catenate  SEPARATOR=  //a[text()='${option_name}']
    Wait And Verify Page Contains Element  ${xpath}  10s  Option ${option_name} is not found
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${xpath}
    Wait And Verify Page Contains Element  ${analysis_subject_area_list}  10s  Subject Area List is not displayed on clicking Analysis Option
    Capture Page Screenshot And Retry If Required

Click on Salary Details Real Time Link
    Wait And Click Element  ${compensation_Salary_details_real_time}
    Wait And Verify Page Contains Element  ${untitled_report}  20s  Untitled Report is not opened
    Capture Page Screenshot And Retry If Required

Click Grade Ladder Folder
    Wait And Click Element  ${grade_ladder_folder}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Add Grade Ladder Column
    Wait Until Element Is Visible  ${grade_ladder_column}  20s
    Double Click Element  ${grade_ladder_column}
    Wait And Verify Page Contains Element  ${grade_ladder_column_selected_Columns}  20s  Grade Ladder Column is not added in selected columns section
    Capture Page Screenshot And Retry If Required

Click on Results Tab
    Wait And Click Element  ${results_tab}
    Wait Until Element Is Visible  ${results_tab_compound_layout_element }  15s
    ${column_Val_List} =  Get Element Count  ${grade_ladder_column_value_list}
    Capture Page Screenshot And Retry If Required
    IF  ${column_Val_List} > 0
        Log  Grade Ladder Column is having values
    ELSE
        Log  Grade Ladder Column is not having values
    END

Select Report Or Data Frame
    select frame  ${bank_validation_frame}
    Sleep  3s