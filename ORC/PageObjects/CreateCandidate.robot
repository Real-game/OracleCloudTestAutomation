*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreateCandidate.robot

*** Keywords ***

Add a Candidate
    [Arguments]  ${candidate_first_name_value}  ${candidate_last_name_value}  ${candidate_email_address_value}  ${c_code}  ${a_code}  ${phone}
    Wait Until Page Contains  Create Candidate  20  Create candidate header is not displayed
    Click Element  ${candidate_first_name}
    Press Keys  ${candidate_first_name}  ${candidate_first_name_value}
    Click Element  ${candidate_last_name}
    Press Keys  ${candidate_last_name}  ${candidate_last_name_value}
    Click Element  ${email_input}
    Press Keys  ${email_input}  ${candidate_email_address_value}
    Sleep  3s
    Input Text  ${country_code}  ${c_code}
    Wait And Click Element   ${select value}
    Sleep  3s
    Input Text  ${area_code}   ${a_code}
    Sleep  3s
    Input Text  ${phone_number}  ${phone}
    Sleep  3s
    Click Element  ${save_and_close_button}
    Wait Until Element Is Visible  ${yes_button}  20  Done button is not displayed
    Click Element  ${yes_button}
    Wait Until Element Is Visible  ${done_link}  20  Done button is not displayed
    Sleep  30s
    Click Element  ${done_link}
    Wait Until Page Contains  Talent  20  Talent page is not displayed