*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ConfigurePlanCycles.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Create Plan Cycle
    [Arguments]  ${name_value}  ${evaluation_period_start_date_value}  ${evaluation_period_end_date_value}  ${plan_access_start_date_value}  ${plan_access_end_date_value}  ${short_name_value}  ${HR_data_extraction_value}
    Wait Until Page Contains  Plan Cycles  20s  Configure Plan Cycles page is not displayed
    Capture Page Screenshot
    Wait And Click Element  ${create_icon}
    Wait Until Page Contains  Create Plan Cycle  20s  Create Plan Cycle pop up is not displayed
    Capture Page Screenshot
    Wait And Input Text From Input  ${name_input_field}  ${name_value}
    Wait And Input Text From Input  ${evaluation_period_start_date_input_field}  ${evaluation_period_start_date_value}
    Wait And Input Text From Input  ${evaluation_period_end_date_input_field}  ${evaluation_period_end_date_value}
    Wait And Input Text From Input  ${plan_access_start_date_input_field}  ${plan_access_start_date_value}
    Sleep  4s
    Wait And Input Text From Input  ${plan_access_end_date_input_field}  ${plan_access_end_date_value}
    Wait And Input Text From Input  ${short_name_input_field}  ${short_name_value}
    Wait And Input Text From Input  ${HR_data_extraction_date_input_field}  ${HR_data_extraction_value}
    Wait And Click Element  ${ok_button}
    Wait Until Page Contains  Save and Close  20s  Save and close button is not displayed
    Wait And Click Element  ${save_and_close_button}
    Sleep  4s

Verify Plan Cycle
    [Arguments]   ${name_value}
    Wait Until Page Contains  Plan Cycles  20s  Configure Plan Cycles page is not displayed
    Capture Page Screenshot

