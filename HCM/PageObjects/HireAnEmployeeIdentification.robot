*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/HireAnEmployeeIdentification.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Fill Basic Details
    [Arguments]   ${calendar_date}  ${hire_action_value}  ${hire_reason_value}  ${legal_employer_value}
    ######  Hire date selection in calendar
    Wait And Input Text From Input  ${hire_date_input}  ${calendar_date}
    Sleep  2s
    Wait And Click Element  ${hire_action_drop_down}
    Sleep  2s
    Wait And Click Element  ${hire_action_drop_down}
    Sleep  2s
    Wait And Select Value From Input  ${hire_action_options}  ${hire_action_value}
    Wait And Click Element  ${hire_reason_drop_down}
    Sleep  2s
    Wait And Select Value From Input  ${hire_reason_options}  ${hire_reason_value}
    Wait And Click Element  ${legal_employer_drop_down}
    Wait And Click Element  ${legal_employer_metrolinx_option}

Fill Personal Details
    [Arguments]  ${last_name_value}  ${first_name_value}  ${title_value}  ${middle_name_value}  ${gender_value}  ${date_of_birth_value}
    Wait And Input Text From Input  ${last_name_input}  ${last_name_value}
    Wait And Input Text From Input  ${first_name_input}  ${first_name_value}
    Wait And Input Text From Input  ${middle_name_input}  ${middle_name_value}
    Click Element  ${title_drop_down}
    Wait And Select Value From Input  ${title_drop_down_option}  ${title_value}
    Click Element  ${gender_drop_down}
    Wait And Select Value From Input  ${gender_drop_down_option}  ${gender_value}
    Sleep  2s
    Wait And Input Text From Input  ${date_of_birth_input}  ${date_of_birth_value}
    Sleep  2s

Add National ID info
    [Arguments]   ${country_name_value}  ${id_name_value}   ${id_value}
    Wait And Click Element  ${create_national_identifier_icon}
    Wait And Click Element  ${country_drop_down}
    Input Text  ${country_drop_down}  ${country_name_value}
    Wait And Select Value From Input  ${country_option}  ${country_name_value}
    Sleep  1s
    Wait And Click Element  ${national_id_type}
    Sleep  2s
    Wait And Click Element  ${national_id_type}
    Sleep  2s
    Wait And Select Value From Input  ${national_id_type_options}  ${id_name_value}
    Wait And Click Element  ${national_id_input}
    Input Text  ${national_id_input}  ${id_value}
    Sleep  2s
    Capture Page Screenshot


Click on Next button
    Sleep  4s
    Wait And Click Element  ${next_button}
    Log  Next button is clicked in Hire an Employee: Identification page









