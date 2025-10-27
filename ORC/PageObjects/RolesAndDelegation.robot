*** Settings ***
Library  Selenium2Library
Resource  ../Locators/RolesAndDelegation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Verify roles associated are listed in Roles section
    [Arguments]     ${roles}
    Wait Until Element is Visible    ${roles_section}   20   Roles section is not displayed
    Scroll Element Into View     ${roles_section}
    Log To Console  ${roles}
    ${roles_list}=   Split String  ${roles}  -
    FOR   ${role}  IN  @{roles_list}
        Page Should Contain     ${role}
        Sleep  4s
    END
    Scroll Element Into View   ${role_delegations_section}
    Sleep  3s

Add Role & Delegation
    [Arguments]     ${role_name}    ${start_date_text}   ${end_date_text}   ${delegated_to}
    Log To Console  values are ${role_name} ${start_date_text} ${end_date_text} ${delegated_to}
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Wait Until Element is Visible    ${add_role}   20   Add Role button is not displayed
    Click Element  ${add_role}
    Wait Until Element is Visible    ${role_name_drop_down}   20   Add Role button is not displayed
    Press Keys   ${role_name_text_box}   ${role_name}
    Sleep  2s
    Click Element  ${search_result}
    Clear Element Text  ${start_date}
    Press Keys   ${start_date}   ${start_date_text}
    Sleep  2s
    Press Keys   ${end_date}   ${end_date_text}
    Press Keys   ${delegated_text_box}   ${delegated_to}
    Sleep  2s
    Click Element  ${search_result}
    Capture Page Screenshot
    Sleep  2s
    Click Element  ${save_button}
    Sleep  1s

Verify Role Addition Permission
    [Arguments]     ${role_name}
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Wait Until Element is Visible    ${add_role}   20   Add Role button is not displayed
    Click Element  ${add_role}
    Wait Until Element is Visible    ${role_name_drop_down}   20   Add Role button is not displayed
    Press Keys   ${role_name_text_box}   ${role_name}
    Sleep  2s
    Page Should Contain Element    ${no_results_found}
    Sleep  2s

