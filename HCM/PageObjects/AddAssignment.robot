*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddAssignment.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${value}
    Wait And Click Element  ${search_input_person_name}
    Sleep  2s
    Wait And Send Keys  ${search_input_person_name}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    capture page screenshot

Check Payroll Salary And Compensation Then Click Contiue
    Sleep  3s
#    Wait And Click Element  ${select_payroll_details}
#    Wait And Click Element  ${select_salary}
#    Wait And Click Element  ${select_compensation}
#    Sleep  3s
    Wait And Click Element  ${selection_continue_button}
    Sleep  3s
    capture page screenshot

Fill Details In When and Why
    [Arguments]  ${date}  ${type}  ${way}  ${reason}  ${assignment_status}
    IF  "${date}"!=""
        Wait And Set Text  ${assignment_start_date}  ${date}
        Sleep  3s
    END
    IF  "${way}"!=""
        Clear Element Text  ${assignment_way}
        Sleep  2s
        Wait And Set Text  ${assignment_way}  ${way}
        Sleep  3s
    END
    IF  "${type}"!=""
        Wait And Send Keys  ${assignment_type}  ${type}
        Sleep  3s
    END
    IF  "${reason}"!=""
        wait and click element  ${assignment_reason_dropdown}
        Sleep  3s
        wait and click element  xpath://div[text()='${reason}']
        Sleep  3s
    END
    IF  "${assignment_status}"!=""
        Wait And Click Element  ${source_assignment_status_dropdown}
        Sleep  3s
        wait and click element  xpath://li[text()='${assignment_status}']
        Sleep  3s
    END
    capture page screenshot

Select Position On Assignment Page
    [Arguments]  ${status}  ${value}
    Wait And Click Element  ${assignment_status_dropdown}
    Sleep  2s
    Wait And Click Element  xpath://li[text()='${status}']
    Sleep  2s
    Wait And Send Keys  ${select_position}  ${value}
    Sleep  5s
    ${pos_xpath}=  Catenate  SEPARATOR=  //span[text()='  ${value}  ']
    Wait And Click Element  xpath: ${pos_xpath}
#    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    ${checker}=  Run Keyword and Return Status  Page Should Contain Element  ${yes_button}
    IF  "${checker}"=="True"
        Wait And Click Element  ${yes_button}
    END
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
    Scroll To Element  ${select_components}
    Sleep  3s
    Wait And Click Element  ${select_components}
    Sleep  3s
#    Wait And Click Element  ${temp_assignment}
    Wait And Click Element  ${temp_assignment_field}
    Wait And Click Element  ${apply_button_components}
    Sleep  3s
    Clear Element Text  ${temp_assignment_value}
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
