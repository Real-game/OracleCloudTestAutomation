*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CandidateSearch.robot

*** Keywords ***

Search for the candidate
    [Arguments]  ${candidate_name}
    Sleep  5s
    Clear Element Text  ${keyword_search_input_box}
    Wait And Set Text  ${keyword_search_input_box}  ${candidate_name}
    sleep  2s
    Wait And Click Element  ${search_button}
    Sleep  5s
    capture page screenshot
    Log To Console  Candidate is searched in the candidate search page


Click on Add Candidate button
    Wait And Click Element  ${search_button}
    Wait Until Page Contains  Candidates  10s
    Wait And Click Element  ${add_button}
    Sleep  5s
    ${xpath}=  Catenate  SEPARATOR=  //input[contains(@id,'fnEInp')]
    ${checker}=  Run KEYWORD AND RETURN Status  Wait Until Element Is Visible   ${xpath}  20
    IF  "${checker}"=="False"
        Wait And Click Element  ${add_button}
        Sleep  3s
    END
    capture page screenshot



Select Candidate
    [Arguments]  ${id}
    Sleep  3s
    ${matching_elements}=  Get WebElements   ${can_list}
    IF  ${matching_elements}==[]
        Wait And Click Element  xpath: //a[@title="${id}"]
        Sleep  2s
        END
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${id}
        IF  '${status}'=='True'
            Wait And Click Element  ${element}
            Exit For Loop
        END
    END


Verify keyword search feature
    Wait Until Page Contains  Total Candidates   20  Candidates search page is not displayed
    ${count_value}=   Get Element Attribute  ${candidate_search_result_count}  innerHTML
    Clear Element Text  ${keyword_search_input_box}
    Wait And Set Text  ${keyword_search_input_box}  BUSINESS ANALYST
    Sleep  10s
    Click Element  ${keyword_search_input_box}
    Press Keys  ${keyword_search_input_box}  ENTER
    Sleep  15s
    ${count_updated_value}=   Get Element Attribute  ${candidate_search_result_count}  innerHTML
    Should Not Be Equal   ${count_value}    ${count_updated_value}
    Clear Element Text  ${keyword_search_input_box}
    Wait And Set Text  ${keyword_search_input_box}  BUSINESS ANALYST AND BACHELOR
    Sleep  10s
    Click Element  ${keyword_search_input_box}
    Press Keys  ${keyword_search_input_box}  ENTER
    Sleep  15s
    ${count_updated_value_1}=   Get Element Attribute  ${candidate_search_result_count}  innerHTML
    Should Not Be Equal   ${count_updated_value}    ${count_updated_value_1}
    Sleep  15s
    Clear Element Text  ${keyword_search_input_box}

