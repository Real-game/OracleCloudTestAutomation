*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/HireAnEmployeeEmployeeInformation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Add Assignment Info
    [Arguments]  ${person_type_value}  ${assignment_status_value}  ${position_value}  ${ATU_initiaton_Fee_Exempt_value}  ${floater_value}  ${salaried_value}
    Wait Until Page Contains  Hire an Employee: Employment Information  20s  Hire an employee: employment information page is not displayed
    Wait And Click Element  ${business_unit_drop_down}
    Sleep  1s
    Wait And Click Element  ${business_unit_option}
    Sleep  2s
    ${person_type_text}=  Get Element Attribute  ${person_type_drop_down}  title
    ${check}=  Run Keyword And Return Status  Should Contain  ${person_type_text}  ${person_type_value}
    IF  "${check}"!="True"
        Wait And Click Element  ${person_type_drop_down}
        Wait And Select Value From Input  ${person_type_options}  ${person_type_value}
        Sleep  2s
    END
    Wait And Click Element  ${assignment_status_drop_down}
    Wait And Select Value From Input  ${assignment_status_options}  ${assignment_status_value}
    Wait And Click Element  ${position_drop_down}
    Wait And Click Element  ${position_search_option}
    Wait And Input Text From Input  ${code_text_box}  ${position_value}
    Wait And Click Element  ${search_button}
    ${xpath_value}=  Catenate  SEPARATOR=   //span[text()='  ${position_value}  ']
    Wait And Click Element  xpath: ${xpath_value}
    Wait And Click Element  ${ok_button_position_dialog}
    Sleep  2s
    ${checker}=  Run Keyword And Return Status  Page Should Contain Element  ${warning_ok_button}
    IF  "${checker}"=="True"
            Wait And Click Element  ${warning_ok_button}
    END
    Sleep  2s
    Wait And Click Element  ${salaried_text_box}
    Wait And Select Value From Input  ${salaried_options}  ${salaried_value}
    Sleep  2s
    Wait And Click Element  ${atu_initiation_fee_exempt_drop_down}
    Sleep  1s
    Wait And Select Value From Input  ${atu_initiation_options}  ${ATU_initiaton_Fee_Exempt_value}
    Sleep  1s
    Wait And Click Element  ${floater_drop_down}
    Sleep  2s
    Wait And Select Value From Input  ${floater_options}  ${floater_value}
    Sleep  2s


Add Payroll Frequency Info
    [Arguments]  ${payroll_frequency_value}
    Wait And Click Element  ${add_payroll_frequency_icon}
    Wait And Click Element  ${payroll_selection_drop_down}
    Sleep  2s
    Wait And Select Value From Input  ${payroll_options}  ${payroll_frequency_value}
    Sleep  1s





