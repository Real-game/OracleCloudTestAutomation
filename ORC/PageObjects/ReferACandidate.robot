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
    Sleep    10s
    wait and click element    xpath: //*[text()="Candidate details"]
    Sleep    5s
    Select Refer Candidate Title    ${candidate_title}
#    Wait Until Element Is Visible  ${title_input}   20
#    Scroll Element Into View  ${title_input}
#    Click Element  ${title_input}
#    Press Keys  ${title_input}  ${candidate_title}
    Scroll Element Into View  ${first_name_input}
    Click Element  ${first_name_input}
    Press Keys  ${first_name_input}  ${candidate_first_name}
    Scroll Element Into View  ${last_name_input}
    Click Element  ${last_name_input}
    Press Keys  ${last_name_input}  ${candidate_last_name}
    Sleep  15s
#    ${element_count}=  Get Element Count  ${endorsement_chk_box_label}
#    ${width}  ${height} =   Get Element Size  ${endorsement_chk_box_label}
#    Log To Console  Element count is ${element_count} and width is ${width} and height is ${height}
#    Scroll Element Into View  ${endorsement_chk_box_label}
#    Click Element  ${endorsement_chk_box_label}
#    Sleep  5s
#    Scroll Element Into View  ${mobile_code}
#    Sleep  5s
#    Click Element  ${mobile_code}
    Select Refer Candidate Country Code    ${mobile_number_code}
#    Press Keys  ${mobile_code}  ${mobile_number_code}
    Sleep  2s
#    Click Element  ${country_code_suggestion_result}
#    Sleep  2s
    Click Element  ${mobile_prefix}
    Press Keys  ${mobile_prefix}  ${mobile_number_prefix}
    Sleep    3s
    scroll element into view    xpath: //*[text()="Candidate details"]
    click element    xpath: //*[text()="Candidate details"]
    Sleep    2s
#    wait and send keys    ${mobile_suffix}    ${mobile_number_suffix}
    click element    xpath: //span[text()='Phone Number']
    Sleep    2s
#    Click Element  ${mobile_suffix}
    Press Keys  ${mobile_suffix}  ${mobile_number_suffix}
    Capture Page Screenshot
#    Scroll Element Into View  ${continue_button}
#    Click Element  ${continue_button}
    Sleep  5s

Submit the candidate referral
    Scroll Element Into View  ${submit_button}
    Click Element  ${submit_button}
    Sleep  20s
    Wait Until Page Contains  Job Info  20  Job Info Page is not displayed

Select Refer Candidate Title
    [Arguments]   ${candidate_title}
    Wait Until Element Is Visible  ${title_input}   20
    Scroll Element Into View  ${title_input}
    Click Element  ${title_input}
    Sleep    2s
    ${title_xpath}=  Catenate  SEPARATOR=  //ul/li/div//span[text()="${candidate_title}"]
    wait and click element    ${title_xpath}
    Sleep    2s
    capture page screenshot

Select Refer Candidate Country Code
    [Arguments]    ${cc}
    Sleep  5s
    Scroll Element Into View  ${mobile_code}
    Sleep  5s
    Click Element  ${mobile_code}
    ${cc_xpath}=  CATENATE  SEPARATOR=  //ul/li/div//span[text()="${cc}"]
    FOR  ${i}  IN RANGE  100
        Sleep  1s
        ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${cc_xpath}  10s  Country Code is not visible
        IF  '${checker}' == 'True'
            Wait And Click Element  ${cc_xpath}
            Exit For Loop
        END
        Execute JavaScript    window.document.evaluate("//*[contains(@id,'country')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
    END
    Sleep  3s
    Capture Page Screenshot

Upload Resume
    [Arguments]  ${file}
    Sleep  5s
    wait and click element    xpath: //div[contains(@aria-label,"Drag and Drop")]
    Attach File  ${file}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Sleep    5s
    Capture Page Screenshot