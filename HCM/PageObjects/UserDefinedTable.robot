*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/UserDefinedTable.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Enter Name in search box
    [Arguments]  ${input}
    Wait And Set Text  ${name_input}  ${input}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Range or Match option
    [Arguments]  ${input}
    Wait And Click Element  ${range_or_match_dropdown}
    Sleep  2s
    Select Required Value  ${range_or_match_value}  ${input}
    Capture Page Screenshot And Retry If Required

Select Search option
    Wait And Click Element  ${search_option}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click a search result
    [Arguments]  ${result}
    ${search_result_xpath}=  Catenate   SEPARATOR=  //a/span[text()='${result}']
    ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${search_result_xpath}
    IF  "${checker}"!="True"
        RELOAD PAGE
        Select Search option
    END
    Wait And Click Element  ${search_result_xpath}
    Wait And Verify Page Contains Text  ${result}  20s  ${result} page is not displayed
    Capture Page Screenshot And Retry If Required

Select Edit option
    Wait And Click Element  ${edit_option_button}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Next option
    Wait And Click Element  ${next_option_button}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pencil icon to edit
    [Arguments]  ${action}
    Wait And Click Element  ${pencil_dropdown}
    ${pencil_edit_xpath}=  Catenate   SEPARATOR=  //div[contains(@id,'ctb2::ScrollBox')]//tr[contains(@id,'${action}')]
    Select Required Value  ${pencil_edit_xpath}  ${action}
    Sleep  2s
    ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${ok_button}
    IF  "${checker}"=="True"
        Wait And Click Element  ${ok_button}
    END
    Capture Page Screenshot And Retry If Required

Select User defined table row
    [Arguments]  ${table_name}
    ${table_name_xpath}=  Catenate   SEPARATOR=  //span[text()='${table_name}']
    element should be visible  ${table_name_xpath}
    Wait And Click Element  ${table_name_xpath}
    Capture Page Screenshot And Retry If Required

Modify value in User defined table
    [Arguments]  ${table_name}  ${value}
    ${table_value_xpath}=  Catenate   SEPARATOR=  //span[text()='${table_name}']//ancestor::td//following-sibling::td//input[contains(@id,'it5::content')]
    Wait And Set Text  ${table_value_xpath}  ${value}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Submit in User defined page
    Wait And Click Element  ${submit_button_link}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

