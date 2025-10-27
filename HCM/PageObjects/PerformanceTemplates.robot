*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/PerformanceTemplates.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Unlock Annual Performance Review Document
    [Arguments]  ${performance_review_document_name}
    Click Element  ${performance_doc_input}
    Input Text  ${performance_doc_input}  ${performance_review_document_name}
    Sleep  5s
    ${check}=  Run Keyword And Return Status  Click Element  ${performance_template_search_button}
    IF  '${check}'!='True'
        Click Element  ${performance_template_search_button}
    END
    Wait Until Page Does Not Contain  No Search Conducted  20s  Search Results are not listed
    Capture Page Screenshot
    Sleep  1s
    ${performance_doc_xpath}=  Catenate   SEPARATOR=  //a[contains(@title,'  ${performance_review_document_name}   ')][1]
    Click Element  xpath: ${performance_doc_xpath}
    Wait Until Page Contains  Document Periods  20s  Performance template for the searched performance document is not displayed
    Click Element  ${document_periods_link}
    Wait Until Page Contains  Lock Manager Share Task  20s  Document periods page check box is not displayed
    Sleep  6s
    Click Element  ${lock_manager_share_task}
    Sleep  3s
    Click Element  ${save_and_close_button}
    Sleep  10s

Click Search Button
    Wait And Click Element  ${search_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Performance Template
    [Arguments]  ${template_name}
    Wait And Set Text  xpath: //label[text()="Name"]/following::input[1]  ${template_name}
    Sleep  3s
    Click Search Button
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  xpath: //a[text()="${template_name}"]
    Wait And Verify Page Contains Text  Performance Template: ${template_name}  30s  Template not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Icon In Document Periods
    Sleep  3s
    Wait And Click Element  ${add_document_period}
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Add Document Period Name
    [Arguments]  ${name}
    Sleep  3s
    ${idx}=  Get New Document Periods Name Locator Index
    Wait And Set Text  xpath://h2[text()="Document Periods"]/following::input[${idx}]  ${name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Get New Document Periods Name Locator Index
    ${count}=  get element attribute  ${document_period_table_row_count}  _rowcount
    IF  "${count}"!=1
        ${multiplier}=  Evaluate  ${count}-${1}
        ${skip_index}=  Evaluate  ${multiplier}*${6}
        ${index}=  Evaluate  ${skip_index}+${1}
    ELSE
        ${index}=  Evaluate  ${count}
    END
    [Return]  ${index}

Add Document Review Period
    [Arguments]  ${period}
    Sleep  3s
    ${idx}=  Get New Document Periods Name Locator Index
    ${idx}=  Evaluate  ${idx}+${1}
    Wait And Set Text  xpath: //h2[text()="Document Periods"]/following::input[${idx}]  ${period}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Add Document Period Short Name
    [Arguments]  ${short_name}
    Sleep  3s
    ${idx}=  Get New Document Periods Name Locator Index
    ${idx}=  Evaluate  ${idx}+${4}
    Wait And Set Text  xpath: //h2[text()="Document Periods"]/following::input[${idx}]  ${short_name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Icon In Questionnaires For The Period
    Sleep  3s
    Wait And Click Element  ${add_questionnaires_icon}
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Add Role In Questionnaires
    [Arguments]  ${role}
    ${index}=  Get Questionnaires For The Period Row Count
    Wait And Click Element  ${questionnaires_role}
    ${check}=  Run Keyword and Return Status  Wait And Click Element  xpath: (//li[text()="${role}"])[${index}]
    IF  '${check}'!='True'
        Wait And Click Element  ${questionnaires_role}
        Sleep  3s
        Wait And Click Element  xpath: (//li[text()="${role}"])[${index}]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Add Questionnaires
    [Arguments]  ${question}
    Wait And Click Element  ${questionnaires_dropdown}
    Wait And Click Element  xpath: //span[text()="${question}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Get Questionnaires For The Period Row Count
    ${row_count}=  get element attribute  ${questionnaires_table_row_count}  _rowcount
    [Return]  ${row_count}

Click Save And Close Performance Template
    Wait And Click Element  ${save_and_close_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required