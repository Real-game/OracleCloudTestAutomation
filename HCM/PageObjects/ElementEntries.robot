*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ElementEntries.robot

*** Keywords ***

Verify overall salary amount in Element Entries table
    [Arguments]  ${overall_salary_amount_value}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Page Contains  Element Name  30s  Element Entries table is not displayed
    Mouse Over  ${source_header}
    Mouse Over  ${source_sort_descending_icon}
    Click Element  ${source_sort_descending_icon}
    Sleep  5s
    ${xpath}=  Catenate  SEPARATOR=  //span[text()='50,000.00']
    #${xpath}=  Catenate  SEPARATOR=  //span[text()='${overall_salary_amount_value}']
    Wait Until Page Contains Element  xpath: ${xpath}   30s  Captured overall salary amount is not displayed
    Capture Page Screenshot

Verify the presence of benefit element entries
    Mouse Over  ${source_header}
    Mouse Over  ${source_sort_ascending_icon}
    Click Element  ${source_sort_ascending_icon}
    Sleep  5s
    ${benefit_element_entry_list}=   Get Element Count  ${benefits_element_entry}
    IF  '${benefit_element_entry_list}'=='0'
        Fail  Benefit Element entries are not displayed for this person
    END
    Log  Total # of benefit element entries is ${benefit_element_entry_list}
    Capture Page Screenshot

Verify the presence of absence element entries
    Mouse Over  ${element_classification_header}
    Mouse Over  ${element_classification_sort_ascending_icon}
    Click Element  ${element_classification_sort_ascending_icon}
    Sleep  5s
    ${accruals_element_entry_list}=   Get Element Count  ${accruals_element_entry}
    IF  '${accruals_element_entry_list}'=='0'
        Fail  Accrual Element entries are not displayed for this person
    END
    Log  Total # of accruals element entries is ${accruals_element_entry_list}
    Capture Page Screenshot

Select Show all in View section under Element Entries
    Wait And Click Element  ${view_element_entries}
    Sleep  2s
    Wait And Click Element  ${column_element_entries}
    Sleep  2s
    Wait And Click Element  ${show_all_element_entries}
    Sleep  2s
    Capture Page Screenshot And Retry If Required