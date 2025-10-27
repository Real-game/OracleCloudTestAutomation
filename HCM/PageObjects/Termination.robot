*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/Termination.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Search Person in Termination page
    [Arguments]   ${person_number}
    Wait And Set Text  ${employment_search}  ${person_number}
    Wait And Click Element  ${employment_search_result}
    Wait until page contains  Terminate   20s   Terminate Page is not displayed
    Capture page screenshot

Select Reverse Termination
    [Arguments]   ${reverse_termination}
    Wait And Click Element  ${reverse}
    Wait Until Page Contains  Reverse Termination   20s  Reverse Termination page is not displayed
    Wait And Click Element  ${What's_the_action_name_drop_down}
    Select Required Value  ${select_action_name}    ${reverse_termination}
    Sleep  3s
    Wait And Click Element  ${submit_button}

Advance Search For Person
    [Arguments]  ${emp_number}  ${emp_name}
    Wait And Send Keys  ${employment_search}  ${emp_number}
    Sleep  3s
    Wait And Click Element  link: Advanced Search:${emp_number}
    Sleep  5s
    Wait And Click Element  link: ${emp_name}
    Wait Until Page Contains  Terminate Work Relationship  20s  Terminate Work Relationship not found
    Sleep  3s
    capture page screenshot

Advance Search For Person With Inactive Assignment Filters
    [Arguments]  ${emp_number}  ${emp_name}
    Wait And Send Keys  ${employment_search}  ${emp_number}
    Sleep  3s
    Wait And Click Element  link: Advanced Search:${emp_number}
    wait until page contains  Hide Filters  20s
    Wait And Click Element  ${inactive_checkbox}
    Sleep  5s
    wait until element is visible  link: ${emp_name}  20s
    Wait And Click Element  link: ${emp_name}
    Wait And Verify Page Contains Text  View Termination  20s  View Termination page not found
    Sleep  3s
    capture page screenshot

Select Reverse Termination Option
    Wait And Click Element  ${reverse}
    Wait Until Page Contains  Reverse Termination   20s  Reverse Termination page is not displayed
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Select Action on Reverse Termination Page
    [Arguments]   ${reverse_termination}
    Wait And Click Element  ${What's_the_action_name_drop_down}
    Select Required Value  ${select_action_name}    ${reverse_termination}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Add Comments on Reverse Termination Page
    [Arguments]  ${comment}
    Sleep  3s
    Wait And Set Text  ${comment_box}  ${comment}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Button
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Select way to terminate employee
    [Arguments]  ${option}
    Wait And Click Element  ${way_to_terminate_dropdown}
    Sleep  2s
    Select Required Value  ${way_to_terminate_value}  ${option}
    Capture Page Screenshot And Retry If Required

Select Continue button
    ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${continue}
    IF  "${checker}"=="True"
        Wait And Click Element  ${continue}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Add Comments on Terminate page
    [Arguments]  ${comment}
    Wait And Set Text  ${comment_box}  ${comment}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Continue Warning Button
    ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${warning_continue}
    IF  "${checker}"=="True"
        Wait And Click Element  ${warning_continue}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Reassign Existing Reports
    [Arguments]  ${input}
    ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${direct_report_all_checkbox}
    IF  "${checker}"=="True"
        Wait And Click Element  ${direct_report_all_checkbox}
        Sleep  2s
        Wait And Set Text  ${direct_report_input}  ${input}
        Sleep  2s
        Wait And Click Element  ${direct_report_select}
    END
    Capture Page Screenshot And Retry If Required
