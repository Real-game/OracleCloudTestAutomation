*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ConfigureWorksheet.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Select configure task layout for given task display name
    [Arguments]  ${task_name}
    ${configure_task_xpath}=  Catenate   SEPARATOR=  //input[@value='${task_name}']//ancestor::td[2]//following-sibling::td//a[@title='Configure']
    SCROLL ELEMENT INTO VIEW  ${configure_task_xpath}
    Wait And Click Element  ${configure_task_xpath}
    Wait And Verify Page Contains Element  ${detail_table}  20s  Detail Table in Configure Worksheet page is displayed
    Capture Page Screenshot And Retry If Required

Select Detail Table
    Sleep  5s
    Wait And Click Element  ${detail_table}
    Sleep  10s
    Capture Page Screenshot And Retry If Required

Expand Detail Columns options in Configure Worksheet Page Laoyout
    [Arguments]  ${column_name}
    ${detail_column_xpath}=  Catenate   SEPARATOR=  //span[text()='${column_name}']//preceding-sibling::span/a[@title='Expand']
    scroll element into view  ${detail_column_xpath}
    Wait And Click Element  ${detail_column_xpath}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Dynamic coulmn of user defined column
    [Arguments]  ${user_defined_name}
    ${user_define_column_xpath}=  Catenate   SEPARATOR=  //span[text()='${user_defined_name}']//parent::div//parent::td//following-sibling::td//a[contains(@id,'cil6')]
    Sleep  2s
    scroll element into view  ${user_define_column_xpath}
    mouse over  ${user_define_column_xpath}
    Sleep  2s
    Wait And Click Element  ${user_define_column_xpath}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Modify Column result value
    [Arguments]  ${input}
    Sleep  2s
    ${column_result_xpath}=  Catenate   SEPARATOR=  (//textarea[contains(@id,'txttExprResultDisp::content')])[1]
    mouse over  ${column_result_xpath}
    Wait And Set Text  ${column_result_xpath}  ${input}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Save And Close
    Wait And Click Element  ${save_and_close}
    Sleep  5s
    Capture Page Screenshot And Retry If Required
