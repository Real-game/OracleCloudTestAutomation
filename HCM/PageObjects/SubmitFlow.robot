*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/SubmitFlow.robot

*** Keywords ***

Select Legislative Data Group
    [Arguments]  ${input}
    Wait And Send Keys  ${legislative_data_dropdown_input}  ${input}
    Sleep  2s
    Wait And Click Element  ${legislative_data_dropdown_select}
    Capture Page Screenshot And Retry If Required

Enter Flow Pattern input
    [Arguments]  ${input}
    Wait And Set Text  ${flow_pattern_textinput}  ${input}
    Sleep  2s
    Wait And Click Element  ${flow_name_search_icon}
    Capture Page Screenshot And Retry If Required

Select Flow pattern
    [Arguments]  ${flow_pattern_name}
    ${flow_pattern_name_xpath}=  Catenate  SEPARATOR=  //span[text()='${flow_pattern_name}']//parent::a
    Wait And Click Element  ${flow_pattern_name_xpath}
    Sleep  3s
    Wait And Verify Page Contains Text  Submit a Payroll Flow  20s  Submit a Payroll Flow page is not displayed
    Capture Page Screenshot And Retry If Required

Enter Payroll Flow Name
    [Arguments]  ${input}
    Wait And Set Text  ${payroll_flow_input}  ${input}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Payroll Process value
    [Arguments]  ${process}
    Wait And Send Keys  ${payroll_process_input}  ${process}
    Sleep  2s
    Select Required Value  ${payroll_process_combo_select}  ${process}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Submit
    Wait And Click Element  ${submit_option}
    Sleep  5s
    Capture Page Screenshot