*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/SubmitCandidate.robot

*** Keywords ***

Submit Candidate
    [Arguments]   ${candidate_name}
    Click Element  ${candidate_search}
    Press Keys  ${candidate_search}  ${candidate_name}
    Press keys  ${candidate_search}   ENTER
    Sleep  3s
    Click Element  ${on_behalf_check_box}
    Sleep  4s
    Click Element  ${submit_button}
    Sleep  5s
    Click Element  ${done_button}
    Wait Until Page Contains  Invitations  20  Invitations page is not displayed
