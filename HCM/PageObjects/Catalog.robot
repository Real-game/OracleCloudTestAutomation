*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  ../Keywords/CommonKeywords.py
Resource  ../Locators/Catalog.robot
Resource  ../Keywords/CommonKeywords.robot
Library  ../Helpers/Excel_Helpers.py
Library  ../Helpers/ExcelReportUtility.py

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
     wait until element contains  ${report_confirmation_message}  Report Completed  500s
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
    Sleep  120s
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

Expand Benefits Interface Folder
    Wait And Click Element  ${benefits_interfaces_folder_expand_icon}
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

Select BEN-INT-01 Folder
    Wait And Click Element  ${ben_int_01_Manulife_folder}
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
    Select frame  xpath: //iframe[contains(@id,'${iframe_path}')][2]
    Sleep  20s
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

Click Expand Payroll Reports Folder
    Wait And Click Element  ${payroll_reports_expand}
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
    [Arguments]  ${start_date}    ${end_date}
    select frame  ${general_object_editor_frame}
    Sleep  3s
    Wait And Set Text  ${termination_start_date_input}  ${start_date}
    Sleep  3s
#    ${current_date} =  get_current_date_dd_mmm_yyyy
    Wait And Set Text  ${termination_end_date_input}  ${end_date}
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
    ${val1}  Excel_Helpers.get_Employee_Number_Search_Validation  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
    IF  "${val1}" == "1"
        Log  Terminated Employee found in the Report
        Log to Console  Terminated Employee found in the Report
    ELSE
        Log  Terminated Employee not found in the Report
        Log to Console   Terminated Employee not found in the Report
    END

Validate Employee Number in StaffList BI Report
    [Arguments]  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
    ${val1}  Excel_Helpers.get_Employee_Number_Search_Validation  ${file_name}  ${first_col_header}  ${required_col_header}  ${validation_value}
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
    Sleep  5s
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

Click Ok Button
    Sleep  3s
    Wait And Click Element  ${ok_button2}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select More Action On Report
    [Arguments]  ${report_name}  ${action}
    Sleep  3s
    Wait And Click Element  xpath://span[text()='${report_name}']/parent::td/parent::tr/following-sibling::tr//a[text()[contains(.,'More')]]
    wait until element is visible  xpath: //span[text()="${action}"]  10s
    Sleep  2s
    Wait And Click Element  xpath: //span[text()="${action}"]
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Schedule Report Job Tab
    [Arguments]  ${tab}
#    Sleep  60s
    IF  "${tab}"=="Output"
        Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[1]
    END
    IF  "${tab}"=="Schedule"
        Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[3]
    END
#    Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[1]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Save Output Check Box
    wait until element is visible  ${save_output_checkbox}
    ${status}=  RUN KEYWORD And Return Status  checkbox should be selected  ${save_output_checkbox}
    IF  ${status}=="True"
        Wait And Click Element  ${save_output_checkbox}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required

Verify Run Now Radio Button
    wait until element is visible  ${run_now_radio_button}
    ${status}=  RUN KEYWORD And Return Status  checkbox should be selected  ${run_now_radio_button}
    IF  ${status}!="True"
        Wait And Click Element  ${run_now_radio_button}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required

Click Submit Button On Schedule Report Job
    Wait And Click Element  ${schedule_report_job_submit_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Report Job Name And Click Button
    [Arguments]  ${report_name}  ${button_value}
    Wait And Set Text  ${report_job_name}  ${report_name}
    Sleep  3s
    Wait And Click Element  xpath: //button[@id="submitDiv_button"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Termination Start Date
    [Arguments]  ${start_date}
    Wait And Set Text  ${terminated_employee_report_start_date}  ${start_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Termination End Date
    [Arguments]  ${end_date}
    Wait And Set Text  ${terminated_employee_report_end_date}  ${end_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Input Person Number
    [Arguments]  ${person_number}
    Wait And Set Text  ${person_number_input}  ${person_number}
    Sleep  5s

Verify text format
    Wait And Verify Page Contains Element  ${text_format}  60s  The report with file format is not in text format
    Capture Page Screenshot And Retry If Required


Select Text Frame
    Select Frame   ${iframe_window}
    Sleep  3s

Verify Location Presence
    [Arguments]  ${location}  ${on_data}
    Wait And Verify Page Contains Text  ${location}  60s  ${location} location not found in the report
    Wait And Verify Page Contains Text  ${on_data}  10s  ${on_data} not found in the report
    Capture Page Screenshot And Retry If Required

Verify Dependent Presence
    [Arguments]  ${spouse_name}  ${child_name}
    ${report_text}=  Get Text  ${text_format}
    ${Text}=   Replace String   ${report_text}    ${space}   ${empty}
    IF  '${spouse_name}' != '""'
        ${spouse_name_} =  Replace String   ${spouse_name}    ${space}   ${empty}
        Should Contain  ${Text}  ${spouse_name_}  Dependent name ${spouse_name} not found in the report
    END
    IF  '${child_name}' != '""'
        ${child_name_} =  Replace String   ${child_name}    ${space}   ${empty}
        Should Contain  ${Text}  ${child_name_}  Dependent name ${child_name} not found in the report
    END
    Capture Page Screenshot And Retry If Required

Click Analytics Home Option
    Wait And Click Element  ${analytics_home}
    wait until element is visible  link: Report Job History  30s  Page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Status Of Report Job And Select On Success
    [Arguments]  ${job}
    Wait And Click Element  ${analytics_status_refresh_button}
    Sleep  5s
    FOR  ${i}  IN RANGE  30
        mouse over  xpath: (//span[text()="${job}"]/following::td[2])[1]
        ${Status}=  Run Keyword and Return Status  ELEMENT SHOULD CONTAIN  xpath: (//span[text()="${job}"]/following::td[2])[1]  Success
        Log to console  Status : ${Status}
        Exit For Loop If  ${Status}
        Sleep  15s
        Wait And Click Element  ${analytics_status_refresh_button}
        Sleep  5s
        IF  "${i}"=="29"
            Fail  Report Still Running
        END
    END
    Wait And Click Element  xpath:(//span[text()="${job}"])[1]
    Capture Page Screenshot And Retry If Required

Download Report Of Given Format
    [Arguments]  ${format}
    Wait And Click Element  xpath: //td[text()="${format}"]/preceding::span[1]
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Report Under the Folder
    [Arguments]  ${folder}
    ${select_report_xpath}=  Catenate   SEPARATOR=  //span[contains(@id,'${folder}')]
    scroll element into view  ${select_report_xpath}
    Wait And Click Element  ${select_report_xpath}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay Period for Report 052 Run
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${report_pay_period_052}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${report_pay_period_search_052}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${report_pay_period_input_052}  ${period}
    Sleep  2s
    Wait And Click Element  ${report_pay_period_input_search_052}
    Sleep  5s
    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'paramsP_END_DATE_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
#    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'paramsP_PERIOD_NAME_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Report Layout as Excel
    Wait And Click Element  ${report_layout}
    Sleep  2s
    Wait And Click Element  ${report_layout_excel}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Notification 052 Report
    [Arguments]  ${mail_id}  ${tab}
    IF  "${tab}"=="Notification"
        Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[1]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${notification_tab}
    Sleep  3s
    Wait And Click Element  ${notificacation_mail}
    Sleep  3s
    Wait And Set Text  ${email_notification}  ${mail_id}
    Sleep  2s
    Wait And Click Element  xpath: (//a[text()="General"])[4]
    Capture Page Screenshot And Retry If Required

Select Notification
    [Arguments]  ${mail_id}  ${tab}
    IF  "${tab}"=="Notification"
        Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[1]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${notification_tab}
    Sleep  3s
    Wait And Click Element  ${notificacation_mail}
    Sleep  3s
    Wait And Set Text  ${email_notification}  ${mail_id}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Report Format as Excel
    Wait And Click Element  ${report_format}
    Sleep  2s
    ${status}=  RUN KEYWORD And Return Status  page should contain element  ${report_format_excel}
    IF  "${status}"=="True"
        Wait And Click Element  ${report_format_excel}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required

Select Pay Period From and To Report Run
    [Arguments]  ${period_1}   ${period_2}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${pay_period_from}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${report_pay_period_search_from}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${report_pay_period_input_from_tab}   ${period_1}
    Sleep  2s
    Wait And Click Element  ${report_pay_period_input_search_button}
    Sleep  5s
    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'Pay_Period_From_div_input_searchDialog_searchResults')]/div[contains(text(),'${period_1}')]
    Sleep  2s
    wait and click element  ${report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
#    unselect frame
    Sleep  5s
    Capture Page Screenshot And Retry If Required
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  3s
    Wait and click element  ${pay_period_to}
    Sleep  2s
    Wait And Click Element  ${report_pay_period_search_to}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${report_pay_period_input_to}   ${period_2}
    Sleep  2s
    Wait And Click Element  ${report_pay_period_input_search}
    Sleep  5s
    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'Pay_Period_To_div_input_searchDialog_searchResults')]/div[contains(text(),'${period_2}')]
    Sleep  2s
    wait and click element  ${report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_to_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_to_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Schedule
    [Arguments]  ${tab}
    IF  "${tab}"=="Notification"
        Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[1]
    END
    IF  "${tab}"=="Schedule"
        Wait And Click Element  xpath: (//a[text()="General"]/following::a[text()="${tab}"])[3]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Save Output Check_Box in report
    Wait And Click Element     ${save_Output_tab}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Wait until element is visible  ${save_output_checkbox}
    ${status}=  RUN KEYWORD And Return Status  checkbox should be selected  ${save_output_checkbox}
    IF  ${status}=="True"
        Wait And Click Element  ${save_output_checkbox}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required


Select Pay Period for Report Run in PAY costing allocation
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${report_pay_period}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${report_pay_period_search}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${report_pay_period_input}   ${period}
    Sleep  2s
    Wait And Click Element  ${report_pay_period_input_search}
    Sleep  5s
    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'paramsP_PERIOD_NAME_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay Period for Report Run in Payroll Register
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${report_pay_period_register}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${report_pay_period_search_register}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${report_pay_period_input_register}   ${period}
    Sleep  2s
    Wait And Click Element  ${report_pay_period_input_register_search}
    Sleep  5s
    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${report_pay_period_input_register_search}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay Period for Report Run in Arrer_Listing_Report
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${arrear_report_pay_period}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${arrear_report_pay_period_search}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${arrear_report_pay_period_input}   ${period}
    Sleep  2s
    Wait And Click Element  ${arrear_report_pay_period_input_search}
    Sleep  5s
    ${arrear_report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'paramsP_PERIOD_NAME_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${arrear_report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay Period for Report Run in Balance_Report
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${balance_report_pay_period}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${balance_report_pay_period_search}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${balance_report_pay_period_input}   ${period}
    Sleep  2s
    Wait And Click Element  ${balance_report_pay_period_input_search}
    Sleep  5s
    ${balance_report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'paramsP_PERIOD_NAME_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${balance_report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay Period for Report Run in Hours and Dollars Report
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${hr_dr_report_pay_period}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${hr_dr_report_pay_period_search}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Click Element    ${hr_dr_report_remove_all}
    Sleep  3s
    Wait And Set Text  ${hr_dr_report_pay_period_input}   ${period}
    Sleep  2s
    Wait And Click Element  ${hr_dr_report_pay_period_input_search}
    Sleep  5s
    ${hr_dr_report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'paramsP_PERIOD_NAME_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${hr_dr_report_pay_period_input_search_result}
    Sleep  2s
    wait and click element  ${hr_dr_report_move}
    Sleep  2s
    ${hr_dr_report_pay_period_input_selected_result}=  Catenate   SEPARATOR=  //div[contains(@id,'PERIOD_NAME_div_input_searchDialog_selectedSearchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${hr_dr_report_pay_period_input_selected_result}
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay Period for Report Run in WSIB YTD
    [Arguments]  ${period}
    select frame  xpath: //iframe[@title="Report Parameters"]
    Sleep  2s
    Wait And Click Element  ${hr_dr_report_pay_period}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    wait and click element  ${hr_report_pay_period_search}
    Sleep  2s
    unselect frame
    Sleep  2s
    select frame  xpath: //iframe[contains(@id,"generalObjectEditor")]
    Sleep  2s
    Wait And Set Text  ${hr_report_pay_period_input}   ${period}
    Sleep  2s
    Wait And Click Element  ${hr_report_pay_period_input_search}
    Sleep  5s
    ${report_pay_period_input_search_result}=  Catenate   SEPARATOR=  //div[contains(@id,'PAY_PERIOD_NAME_div_input_searchDialog_searchResults')]/div[contains(text(),'${period}')]
    Sleep  2s
    wait and click element  ${report_pay_period_input_search_result}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    scroll element into view  ${report_pay_period_input_search_result_ok}
    Wait And Click Element  ${report_pay_period_input_search_result_ok}
    unselect frame
    Sleep  2s
    Capture Page Screenshot And Retry If Required