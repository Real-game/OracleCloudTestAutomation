*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Agents.robot

*** Keywords ***

Add a Agent
    [Arguments]  ${agent_full_name}
    Click Element  ${agents_search_input}
    Press Keys   ${agents_search_input}   ${agent_full_name}
    Click Element  ${agents_search_icon}
    Sleep  3s
    Click Element  ${agent_check_box}
    Capture Page Screenshot
    Sleep  3s
    Click Element  ${save_and_close_button}
