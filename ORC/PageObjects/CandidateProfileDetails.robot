*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CandidateProfileDetails.robot

*** Keywords ***
Select Actions
    [Arguments]  ${value}
    Wait And Click Element  ${actions_btn}
    Select Required value  ${action_temp}  ${value}
    Wait Until Page Contains  Potential Duplicates
