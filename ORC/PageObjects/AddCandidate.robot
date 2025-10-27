*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddCandidate.robot

*** Keywords ***

Add a Candidate
    [Arguments]  ${test_data}
    Wait Until Element Is Visible  ${legal_first_name}
    Input Text  ${legal_first_name}     ${test_data}[Candidate First Name]
    Input Text  ${legal_last_name}     ${test_data}[Candidate Last Name]
    Input Text  ${email_address}     ${test_data}[Candidate Email Address]
    sleep  5s
    Input Text  ${country_code}  ${test_data}[country code]
    Wait And Click Element   ${select value}
    Sleep  3s
    Input Text  ${area_code}  ${test_data}[area code]
    Sleep  3s
    Input Text  ${phone_number}  ${test_data}[Phone]
    Sleep  3s
    Capture Page Screenshot
    Scroll Element Into View    ${save_and_close_button}
    Click Element  ${save_and_close_button}
    Wait Until Element Is Visible  ${error_pop_up}  20s
    Element Should Be Visible   ${error_pop_up}
    Element Should Be Visible   ${error_message}
    Element Should Be Visible   ${ok_button}
    Click Element  ${ok_button}


Add a unique Candidate
    [Arguments]  ${test_data}
    Wait Until Element Is Visible  ${legal_first_name}
    ${time}=   Get Time  epoch
    ${candidate_name_with_timestamp}=   Catenate    ${test_data}[Candidate First Name] ${time}
    Log To Console  candidate name is ${candidate_name_with_timestamp}
    Clear Element Text   ${legal_first_name}
    Input Text  ${legal_first_name}     ${candidate_name_with_timestamp}
    Input Text  ${legal_last_name}     ${test_data}[Candidate Last Name]
    ${email_address_value}=  Catenate   SEPARATOR=	 abc7890  ${time}    @mailinator.com
    Input Text  ${email_address}     ${email_address_value}
    Sleep  3s
    Input Text  ${country_code}  ${test_data}[country code]
    Wait And Click Element   ${select value}
    Sleep  3s
    Input Text  ${phone_number}  ${test_data}[Phone]
    Sleep  3s
    Capture Page Screenshot
    Scroll Element Into View    ${save_and_close_button}
    Click Element  ${save_and_close_button}
    Wait Until Element Is Visible  ${confirmation_title}
    Element Should Be Visible   ${confirmation_message}
    Element Should Be Visible   ${yes_button}
    Click Element  ${yes_button}
    Sleep  5s






