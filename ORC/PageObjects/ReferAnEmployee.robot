*** Settings ***
Library  Selenium2Library
Resource  ../Locators/ReferAnEmployee.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Refer an Employee
    [Arguments]  ${employee_title}  ${notes}
    Wait Until Element Is Visible  ${employee_input}
    Capture Page Screenshot
    Click Element  ${employee_input}
    Press Keys  ${employee_input}  ${employee_title}
    Sleep  3s
    Wait Until Element Is Visible  ${search_result}  20  Search result is not displayed
    Click Element  ${search_result}
    Sleep  5s
#    Click Element  ${continue_button}
    Wait Until Element Is Visible  ${textarea_input}  20
    Scroll Element Into View  ${textarea_input}
    Click Element  ${textarea_input}
    Clear Element Text  ${textarea_input}
    Press Keys  ${textarea_input}  ${notes}
    Scroll Element Into View  ${endorsement_chk_box}
    Click Element  ${endorsement_chk_box}
    Capture Page Screenshot

Submit the Employee referral
    Scroll Element Into View  ${submit_button}
    Click Element  ${submit_button}
    Sleep  5s
    Wait Until Page Contains  Job Info  20  Job Info Page is not displayed
    Capture Page Screenshot

