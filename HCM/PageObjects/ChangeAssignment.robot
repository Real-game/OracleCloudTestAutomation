*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ChangeAssignment.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${emp_value}  ${assignment_value}
    Wait And Send Keys  ${search_input_person_name}  ${emp_value}
    Sleep  3s
    Wait And Click Element  link: Advanced Search:${emp_value}
    Sleep  5s
    IF  "${assignment_value}"!=""
        Wait And Send Keys  ${search_input_assignment_number}  ${assignment_value}
        Sleep  5s
        Wait And Click Element  ${search_button_assignment_number}
    END
    Sleep  5s
    Wait And Click Element  link: ${emp_value}
    Sleep  3s
    capture page screenshot

Contiue Without Check
    Wait And Click Element  ${selection_continue_button}
    Sleep  3s
    capture page screenshot

Fill Details In When and Why
    [Arguments]  ${date}  ${way}
    wait and click element  ${assignment_way_dropdown}
    Sleep  2s
    wait and click element  xpath://div[text()='${way}']
    Wait And Set Text  ${assignment_start_date}  ${date}
    Sleep  3s
    capture page screenshot

Change Probation Period
    [Arguments]  ${value}  ${unit}
    Wait And Set Text  ${select_probotaion_period_value}  ${value}
    Wait And Click Element  ${select_probotaion_period_unit_dropdown}
    Sleep  2s
    wait and click element  xpath://li[text()='${unit}']
    Sleep  5s
    capture page screenshot

Continue
    Wait And Click Element  ${continue}
    Sleep  5s

Submit Details
    Wait And Click Element  ${submit_button}
    Sleep  60s
    capture page screenshot

Search And Select Person From Result
    [Arguments]  ${person_number}
    Wait And Send Keys  ${search_input_person_name}  ${person_number}
    Sleep  3s
    Wait And Click Element  ${recent_search_result}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify And Select Payroll Details Checkbox
    Sleep  3s
    mouse over  ${Checkbox_payroll_details}
    page should contain element  ${Checkbox_payroll_details}  Payroll Details Option Not Found
    Wait And Click Element  ${Checkbox_payroll_details}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Payroll Details Section
    wait until element is visible  ${payroll_details_action_type_section}  20s  Action Type not found
    wait until element is visible  ${payroll_details_payroll_frequency_section}  20s  Payroll Frequency not found
    wait until element is visible  ${payroll_details_other_info_section}  20s  Other Info not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Action Type
    [Arguments]  ${actiobn}
    Wait And Click Element  xpath://label[text()="${actiobn}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Payroll
    [Arguments]  ${payroll}
    Wait And Click Element  ${dropdown_payroll}
    Sleep  3s
    Wait And Click Element  xpath://li[text()="${payroll}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Time Card
    [Arguments]  ${time_card}
    Wait And Click Element  ${dropdown_time_card}
    Sleep  3s
    Wait And Click Element  xpath:(//li[text()="${time_card}"])[2]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify And Select Maintain Manager Checkbox
    Sleep  3s
    mouse over  ${checkbox_maintain_managers}
    page should contain element  ${checkbox_maintain_managers}  Maintain Managers Option Not Found
    Wait And Click Element  ${checkbox_maintain_managers}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Change Position Code in Change Assignment
    [Arguments]  ${position_id}
    Wait And Input Text From Input  ${position_textbox}   ${position_id}
    ${pos_xpath}=  Catenate  SEPARATOR=  //span[text()='  ${position_id}  ']
    Wait And Click Element  xpath: ${pos_xpath}
    Sleep  5s
    ${checker}=  Run Keyword and Return Status  Page Should Contain Element  ${yes_button_hire_detail}
    IF  "${checker}"=="True"
        Wait And Click Element  ${yes_button_hire_detail}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Maintain Manager has Multiple option
    Wait And Click Element  ${edit_but}
    Sleep  2s
    Wait And Click Element  ${maintain_manager_dropdown}
    ${row_xpath}=  Catenate  SEPARATOR=  //tr[@role='row']
    page should contain element  ${row_xpath}  Manager Details Not Found
    Sleep  3s
    Capture Page Screenshot And Retry If Required