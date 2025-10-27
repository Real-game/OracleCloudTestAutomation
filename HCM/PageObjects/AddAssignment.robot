*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddAssignment.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${value}
    Wait And Send Keys  ${search_input_person_name}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    capture page screenshot

Check Payroll Salary And Compensation Then Click Contiue
    Sleep  3s
    Wait And Click Element  ${select_payroll_details}
    Wait And Click Element  ${select_salary}
    Wait And Click Element  ${select_compensation}
    Sleep  3s
    Wait And Click Element  ${selection_continue_button}
    Sleep  3s
    capture page screenshot

Fill Details In When and Why
    [Arguments]  ${date}  ${type}  ${way}  ${reason}
    Wait And Set Text  ${assignment_start_date}  ${date}
    Sleep  3s
    Wait And Set Text  ${assignment_way}  ${way}
    Sleep  3s
    Wait And Send Keys  ${assignment_type}  ${type}
    Sleep  3s
    wait and click element  ${assignment_reason_dropdown}
    Sleep  2s
    wait and click element  xpath://div[text()='${reason}']
    Sleep  3s
    capture page screenshot

Select Position On Assignment Page
    [Arguments]  ${value}
    Wait And Send Keys  ${select_position}  ${value}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Wait And Click Element  ${yes_button}
    Sleep  3s
    capture page screenshot

Select Payroll Details
    [Arguments]  ${unit}  ${time_card}
    Wait And Click Element  ${tax_reporting_unit_dopdown}
    Sleep  2s
    wait and click element  xpath://li[text()='${unit}']
    Sleep  3s
    Wait And Click Element  ${time_card_required_dopdown}
    Sleep  2s
    wait and click element  xpath://li[text()='${time_card}']
    Sleep  3s
    capture page screenshot

Select Salary Details
    [Arguments]  ${salary_type}  ${salary_amount}
    Wait And Send Keys  ${salary_basis}  ${salary_type}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Wait And Click Element  ${select_components}
    Sleep  3s
#    Wait And Click Element  ${temp_assignment}
    Wait And Click Element  ${temp_assignment_field}
    Wait And Click Element  ${apply_button_components}
    Sleep  3s
    Wait And Set Text  ${temp_assignment_value}  ${salary_amount}
    Sleep  3s
    capture page screenshot

Continue
    Wait And Click Element  ${continue}
    Sleep  5s

Submit Details
    Wait And Click Element  ${submit_button}
    Sleep  10s
    capture page screenshot
