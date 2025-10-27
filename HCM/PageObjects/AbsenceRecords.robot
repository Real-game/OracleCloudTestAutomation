*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AbsenceRecords.robot

*** Keywords ***
Search for a person in Absence Records page
    [Arguments]  ${person_number}
    Wait And Click Element  ${search_for_a_person_input}
    Input Text  ${search_for_a_person_input}  ${person_number}
    Sleep  2s
    Capture Page Screenshot
    ${xpath}=  Catenate  SEPARATOR=  //div[text()='  ${person_number}  ']
    Click Element  xpath: ${xpath}
    Wait Until Page Contains  Manage Absences and Entitlements  20s  Manage Absences and Entitlements page is not displayed
    Capture Page Screenshot

Search And Select Person
    [Arguments]  ${number}
    Wait And Send Keys  ${search_person}  ${number}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Take Existing Absences Screenshot
    mouse over  ${existing_absences_table}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Sleep  3s

Take Plan Balacces Screenshot
    mouse over  ${plan_balances_table}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Sleep  3s

Click Back Arrow
    Wait And Click Element  ${back_arrow}
    Sleep  3s
    Capture Page Screenshot And Retry If Required




