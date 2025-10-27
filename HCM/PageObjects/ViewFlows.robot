*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ViewFlows.robot

*** Keywords ***

Click on Show Filters
    Wait And Click Element  ${show_filter_link}
    Capture Page Screenshot


#Apply filter on legislative data group and Flow pattern
#    [Arguments]  ${legislative_drop_down_value}  ${flow_pattern_value}
#    ${checker}=  Run Keyword And Return Status  Wait And Click Element  ${legislative_drop_down}
#    IF  '${checker}'=='False'
#    Wait And Click Element  ${legislative_drop_down}
#    END
#    ${legislative_xpath}=  Catenate  SEPARATOR=  //div[text()='  ${legislative_drop_down_value}  ']
#    ${checker1}=  Run Keyword And Return Status  Wait And Click Element  xpath: ${legislative_xpath}
#    IF  '${checker1}'=='False'
#    Wait And Click Element  xpath: ${legislative_xpath}
#    END
#    Wait And Click Element  ${flow_pattern_drop_down}
#    ${flow_pattern_xpath}=  Catenate  SEPARATOR=  //div[text()='  ${flow_pattern_value}  ']
#    Wait And Click Element  xpath: ${flow_pattern_xpath}
#    Sleep  2s
#    Wait And Click Element  ${flow_name_search_icon}

#Click on the payslip flow name
#    [Arguments]  ${payslip_name}
#    Sleep  5s
#    ${checker}=  Run Keyword and Return Status  Wait Until Page Contains  ${payslip_name}  5s  Required payslip is not displayed
#    IF  '${checker}'=='False'
#    ${payslip_xpath}=  Catenate  SEPARATOR=  //a[text()='  ${payslip_name}  ']
#    ${checker}=  Run Keyword and Return Status  Wait And Click Element  xpath: ${payslip_xpath}
#    IF  '${checker}'=='False'
#        Wait And Click Element  xpath: ${payslip_xpath}
#    END
#    Sleep  30s

Select filter on legislative data group
    [Arguments]  ${legislative_value}
    Wait And Send Keys  ${legislative_data_input}  ${legislative_value}
    Sleep  2s
    Wait And Click Element  ${select_value}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select filter on Flow Pattern
    [Arguments]  ${flow_pattern_value}
    Wait And Send Keys  ${flow_pattern_input}  ${flow_pattern_value}
    Sleep  2s
    Wait And Click Element  ${select_value}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click search icon on flow name
    Wait And Click Element  ${flow_name_search_icon}
    Sleep  2s
    Capture Page Screenshot And Retry If Required


Click on the flow name
    [Arguments]  ${name}
    Sleep  5s
    ${cheque_xpath}=  Catenate  SEPARATOR=  //a[text()="${name}"]
    FOR  ${i}  IN RANGE  0  99
        ${checker}=  Run Keyword and Return Status  Wait And Click Element  xpath: ${cheque_xpath}
        IF  "${checker}"=="False"
            ${status}=  Run Keyword And Return Status  Element Should Be Visible  ${view_more_items_link}
            IF  "${status}"=="True"
                Wait And Click Element  ${view_more_items_link}
            ELSE
                Fail  Required ${name} is not listed
            END
        ELSE
            Exit For Loop
        END
    END
    Sleep  5s
    Wait And Verify Page Contains Text  ${name}  20s  Payroll Checklist page is not displayed
    Capture Page Screenshot And Retry If Required


Click on Actions button
    Wait And Click Element  ${actions_button}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on Rollback all
    Wait And Click Element  ${rollback_all}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on Warning Confirmation OK
    Wait And Click Element  ${payroll_checklist_confirmation_ok}
    Sleep  2s
    capture page screenshot and retry if required

