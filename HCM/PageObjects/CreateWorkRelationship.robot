*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreateWorkRelationship.robot

*** Keywords ***
Advance Search For Person With Filters
    [Arguments]  ${emp_number}  ${emp_name}
    Wait And Send Keys  ${employment_search}  ${emp_number}
    Sleep  3s
    Wait And Click Element  link: Advanced Search:${emp_number}
    wait until page contains  Hide Filters  20s
    Wait And Click Element  ${inactive_checkbox}
    Sleep  3s
#    Wait And Click Element  ${calender_icon}
#    Sleep  3s
#    Wait And Click Element  ${select_current_date}
    Sleep  3s
    mouse over  link: ${emp_name}
    Wait And Click Element  link: ${emp_name}
    Wait Until Page Contains  What info do you want to manage?  20s  What info do you want to manage? page not found
    Sleep  3s
    capture page screenshot

Select Manage Info Checkbox
    Wait And Click Element  ${checkbox_work_relationship}
    Wait And Click Element  ${checkbox_payroll_details}
    Wait And Click Element  ${checkbox_salary}
    Wait And Click Element  ${checkbox_compensation}
    Sleep  3s
    capture page screenshot

Manage Info Continue Button
    Wait And Click Element  ${manage_info_continue_button}
    wait until page contains  When and Why  20s
    capture page screenshot

Fill When And Why Details For Create Work Relationship
    [Arguments]  ${start_date}  ${legal_employer}  ${Way}  ${Why_adding}
    Wait And Set Text  ${relationship_start_date}  ${start_date}
    Sleep  3s
    Wait And Send Keys  ${legal_employer_input}  ${legal_employer}
    Sleep  5s
    Wait And Click Element  ${legal_employer_drpdown}
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
#    Wait And Click Element  xpath://div[text()='${legal_employer}']
#    Sleep  3s
    Wait And Click Element  ${way_to_create_relashionship_dropdown}
    Wait And Click Element  xpath://div[text()='${Way}']
    Sleep  3s
    IF  "${Why_adding}"!=""
        Wait And Click Element  ${why_adding_relashionship_dropdown}
        Wait And Click Element  xpath://div[text()='${Why_adding}']
    END
    Sleep  3s
    capture page screenshot

Fill Employment Details For Create Work Relationship
    [Arguments]  ${BU}  ${position_id}
    Wait And Send Keys  ${business_unit}  ${BU}
    Sleep  5s
    Wait And Set Text  ${select_position}  ${position_id}
    Sleep  5s
#    Wait And Click Element  xpath:(//a[@class='xdv'])[2]
    Wait And Send Keys  ${select_position}  ${position_id}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Wait And Click Element  ${yes_button}
    Sleep  3s
    capture page screenshot

Fill Payroll Details For Create Work Relationship
    [Arguments]  ${tax_unit}  ${time_card}
    mouse over  ${tax_reporting_unit}
    Wait And Click Element  ${tax_reporting_unit}
    Wait And Click Element  xpath://li[text()='${tax_unit}']
    Sleep  5s
    mouse over  ${time_card_required}
    Wait And Click Element  ${time_card_required}
    Wait And Click Element  xpath://li[text()='${time_card}']
    Sleep  3s
    capture page screenshot

Select Salary Details For Create Work Relationship
    [Arguments]  ${currency}  ${salary_basis_type}  ${amount}
    Wait And Click Element  ${select_currency}
    Sleep  3s
    Wait And Click Element  xpath://li[text()='${currency}']
    Sleep  3s
#    Wait And Send Keys   ${salary_basis}  ${salary_basis}
    Wait And Click Element  ${salary_basis}
    Sleep  3s
    Wait And Click Element  xpath://div[text()='${salary_basis_type}']
    Sleep  3s
    Wait And Set Text  ${salary_amount}  ${amount}
    Sleep  3s
    capture page screenshot

Fill Basic Details
    [Arguments]  ${action}  ${action_reason}  ${legal_employer}
    Wait And Click Element  ${action_dropdown_click}
    Sleep  3s
    Wait And Click Element  xpath://li[text()='${action}']
    Sleep  3s
    IF  "${action_reason}"!=""
        Wait And Click Element  ${action_reason_dropdown_click}
        Sleep  3s
        Wait And Click Element  xpath://li[text()='${action_reason}']
    END
    Sleep  3s
    Wait And Click Element  ${legal_employer_dropdown_click}
    Sleep  3s
    Wait And Click Element  xpath://span[text()='${legal_employer}']
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Fill Assignment Details
    [Arguments]  ${bu_name}  ${position_id}  ${payroll}
    Wait And Send Keys  ${business_unit}  ${bu_name}
    Sleep  3s
    Wait And Click Element  ${position_dropdown_click}
    Sleep  3s
    Wait And Click Element  ${search_position_link}
    Wait And Send Keys  ${position_code_input}  ${position_id}
    Sleep  3s
    Wait And Click Element  ${search_button}
    Wait And Click Element  xpath: //td[@class='xen' and contains(.,'${position_id}')]
    Sleep  3s
    Wait And Click Element  ${ok_button}
    Sleep  3s
    ${checker}=  RUN KEYWORD And Return Status  wait until element is visible  ${warning_ok_button}  5s
    log to console  Status : ${checker}
    IF  '${checker}' == 'True'
        Wait And Click Element  ${warning_ok_button}
        Sleep  5s
    END
    mouse over  ${icon_create_payroll}
    Wait And Click Element  ${icon_create_payroll}
    Sleep  3s
    Wait And Click Element  ${search_and_select_payroll_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //span[text()='${payroll}']
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Fill Compensation Details
    [Arguments]  ${salary_basis}  ${amount}
    Wait And Click Element  ${salary_basis_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //span[text()='${salary_basis}']
    Sleep  3s
    mouse over  ${salary_amount}
    Wait And Set Text  ${salary_amount}  ${amount}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Review Page
    Wait And Verify Page Contains Text  Create Work Relationship: Review  20s  Page Not Found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Continue Button
    Wait And Click Element  ${continue_button}
    Sleep  3s
    capture page screenshot

Click Submit Button
    mouse over  ${submit_button}
    Wait And Click Element  ${submit_button}
    Sleep  7s
    capture page screenshot

Select Warning Yes
    Sleep  5s
    page should contain button  ${warning_button_Yes}
    Wait And Click Element  ${warning_button_Yes}
    Sleep  5s
    Capture Page Screenshot

Confirm Message
    Wait And Click Element  ${confirm_button}
    Sleep  5s
    Capture Page Screenshot

Click Next
    Wait And Click Element  ${next_button}
    Sleep  3s
    Capture Page Screenshot