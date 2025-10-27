*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierBoardOrders.robot

*** Keywords ***

Click on Create board orders button
    [Arguments]   ${business_origin_drop_down_value}
    Sleep  20s
    Select frame  ${board_order_frame}
    Sleep  20s
    Wait Until Element Is Visible  ${create_board_order_button}  30s  Create board orders button is not displayed
    Click Element  ${create_board_order_button}
#    Select frame  ${board_order_frame}
    Sleep    10s
    wait and click element    xpath: //div[@id="createdlgbody"]
    Sleep    15s
#    wait and click element    xpath: (//span[text()='Select Business Process Origin']/parent::b/parent::label/parent::div/parent::oj-label/following-sibling::oj-select-single)[1]
    Wait Until Element Is Visible  ${select_business_process_origin_drop_down}  60s  Select business origin drop down is not displayed
    Capture Page Screenshot
    Click Element  ${select_business_process_origin_drop_down}
    Sleep  15s
    ${xpath}=  Catenate   SEPARATOR=  //span[text()='${business_origin_drop_down_value}']
    Sleep  3s
    Click Element  xpath:${xpath}
    Sleep  5s
    Capture Page Screenshot
    Click Element  ${create_new_board_order_record_button}
    Unselect Frame
