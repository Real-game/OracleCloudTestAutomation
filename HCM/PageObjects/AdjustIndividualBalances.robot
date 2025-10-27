*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AdjustIndividualBalances.robot

*** Keywords ***
Search And Select Element Name
    [Arguments]  ${value}
    Wait And Click Element  ${element_name_dropdown}
    Sleep  3s
    Wait And Click Element  link: Search...
    Sleep  3s
    Wait And Set Text  ${element_name_input}  ${value}
    Wait And Click Element  ${element_name_search_button}
    Sleep  3s
    Wait And Click Element  xpath://span[text()="${value}"]
    Wait And Click Element  ${element_name_search_ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Assignment Input
    [Arguments]  ${assignment}
    Wait And Click Element  ${assignment_number_input}
    Sleep  3s
    Wait And Click Element  xpath: //span[text()="${assignment}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Calculation Component Input
    [Arguments]  ${value}
    Wait And Click Element  ${calculation_component}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${value}"][1]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Rate Input
    [Arguments]  ${value}
    Wait And Set Text  ${rate_input_update}  ${value}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Submit Adjust Individual Balances
    Wait And Click Element  ${click_submit_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Confirmation Message Ok Button
    Wait And Click Element  ${click_ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Adjustment Values
    Wait And Click Element     ${adjustment_values}
    Sleep  5s

Search and Select Adjust Element
    [Arguments]  ${value}
    Wait And Click Element  ${Click_adjust_element}
    Sleep  3s
#    Wait And Click Element  xpath: //li[text()="${value}"][1]
    Wait And Set Text     ${input_value}   ${value}
    Sleep  3s
    Wait And Click Element    ${select_Assigment_value}
    Capture Page Screenshot And Retry If Required

Select Province
    [Arguments]  ${value}
    Wait And Click Element  ${click_province}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Reporting Type
    [Arguments]  ${value}
    Wait And Click Element  ${click_Reporting_type}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Assignment Inputs
    [Arguments]  ${value}
    Wait And Click Element  ${click_Assignment}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${value}"][1]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Save in Adjustment values
    Wait And Click Element  ${save_Adjustment}
    Sleep  5s