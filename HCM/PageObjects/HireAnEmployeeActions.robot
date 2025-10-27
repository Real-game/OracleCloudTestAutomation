*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/HireAnEmployeeActions.robot

*** Keywords ***

Select an Action in hire an employee page
    Wait And Click Element  ${addresses_action}
    Wait And Click Element  ${citizenship_info_action}
    Wait And Click Element  ${additonal_assignment_info_action}
    Wait And Click Element  ${work_relationship_info_action}
    Wait And Click Element  ${payroll_details_action}
    Wait And Click Element  ${salary_action}
    Sleep  2s
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}

Verify Hire an Employee page has option
    [Arguments]  ${text}
    Wait Until Page Contains  ${text}  20s  ${text} is not displayed
    ${xpath}=   Catenate  SEPARATOR=  //span[text()='${text}']
    Page Should Contain Element  xpath:${xpath}
    scroll element into view  ${xpath}
    Capture Page Screenshot and Retry If Required

Verify Page throws Warning
    ${warning_check}=  Run Keyword and Return Status  wait until element is visible  ${warning_popup}  10s
    IF  '${warning_check}'=='True'
            Capture Page Screenshot And Retry If Required
            Wait And Click Element  ${Warning_span_yes}
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required
