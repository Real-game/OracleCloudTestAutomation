*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/SendInterviewInvite.robot

*** Keywords ***
Select Schedule and Save
    Wait And Click Element  ${sii_candidate_dropdown}
    Sleep  2s
    Wait And Click Element  ${sii_checkbox}
    Sleep  2s
    Wait And Click Element  ${sii_save}
    Wait Until Page Contains  Details