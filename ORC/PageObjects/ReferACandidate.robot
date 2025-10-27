*** Settings ***
Library  Selenium2Library
Resource  ../Locators/ReferACandidate.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Refer a Candidate
    [Arguments]  ${email_address}   ${candidate_title}  ${candidate_first_name}  ${candidate_last_name}  ${mobile_number_code}  ${mobile_number_prefix}  ${mobile_number_suffix}
    Wait Until Element Is Visible  ${email_input}   20
    Capture Page Screenshot
    Click Element  ${email_input}
    Press Keys  ${email_input}  ${email_address}
    Sleep  2s
    Click Element  ${continue_button}
    Wait Until Element Is Visible  ${title_input}   20
    Scroll Element Into View  ${title_input}
    Click Element  ${title_input}
    Press Keys  ${title_input}  ${candidate_title}
    Scroll Element Into View  ${first_name_input}
    Click Element  ${first_name_input}
    Press Keys  ${first_name_input}  ${candidate_first_name}
    Scroll Element Into View  ${last_name_input}
    Click Element  ${last_name_input}
    Press Keys  ${last_name_input}  ${candidate_last_name}
    Sleep  15s
    ${element_count}=  Get Element Count  ${endorsement_chk_box_label}
    ${width}  ${height} =   Get Element Size  ${endorsement_chk_box_label}
    Log To Console  Element count is ${element_count} and width is ${width} and height is ${height}
    Scroll Element Into View  ${endorsement_chk_box_label}
    Click Element  ${endorsement_chk_box_label}
    Sleep  5s
    Scroll Element Into View  ${mobile_code}
    Sleep  5s
    Click Element  ${mobile_code}
    Press Keys  ${mobile_code}  ${mobile_number_code}
    Sleep  2s
    Click Element  ${country_code_suggestion_result}
    Sleep  2s
    Click Element  ${mobile_prefix}
    Press Keys  ${mobile_prefix}  ${mobile_number_prefix}
    Click Element  ${mobile_suffix}
    Press Keys  ${mobile_suffix}  ${mobile_number_suffix}
    Capture Page Screenshot
    Scroll Element Into View  ${continue_button}
    Click Element  ${continue_button}
    Sleep  5s


Submit the candidate referral
    Scroll Element Into View  ${submit_button}
    Click Element  ${submit_button}
    Sleep  5s
    Wait Until Page Contains  Jobs  20  Jobs page is not displayed


