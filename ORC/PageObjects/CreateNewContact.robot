*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreateNewContact.robot

*** Keywords ***

Create New Contact
    [Arguments]   ${last_name}   ${first_name}   ${relationship}    ${relationship_st_date}  ${phone_type}  ${area_code_value}  ${phone_number_value}
    Wait Until Page Contains  Basic Information  20s  Create New Contact page is not displayed
    Click Element  ${last_name_input}
    Press Keys  ${last_name_input}  ${last_name}
    Click Element  ${first_name_input}
    Press Keys  ${first_name_input}  ${first_name}
    Click Element  ${relationship_drop_down}
    Select Required Value  ${relationship_options}  ${relationship}
    Click Element  ${relationship_start_date}
    Press Keys  ${relationship_start_date}  ${relationship_st_date}
    Click Element  ${emergency_contact_label}
    Scroll Element Into View  ${phone_type_drop_down}
    Wait And Click Element  ${phone_type_drop_down}
    Select Required Value  ${phone_type_options}   ${phone_type}
    Sleep  5s
    Click Element  ${area_code_input}
    Press Keys  ${area_code_input}   ${area_code_value}
    Click Element  ${phone_number_input}
    Press Keys  ${phone_number_input}   ${phone_number_value}
    Capture Page Screenshot
    Scroll Element Into View  ${submit_button}
    Click Element  ${submit_button}
    Wait Until Page Contains  My Contacts  20  My contacts page is not displayed

