*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddInteraction.robot

*** Keywords ***
Set Interaction Type
    [Arguments]  ${type}
    Wait Until Element Contains  ${header}  Add Interaction
    Wait And Click Element  ${dropdown_btn}
    Select Required Value  ${type_table}  ${type}
    Capture Page Screenshot
    Wait And Click Element  ${save_btn}
    Sleep  5s
    Wait Until Page Contains  Details