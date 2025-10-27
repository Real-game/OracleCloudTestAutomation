*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AgencyHiring.robot

*** Keywords ***

Click Invitations link
    Sleep  4s
    Click Element  ${invitations_link}
    Wait Until Page Contains  Requisitions  20  Invitations page is not displayed
    Capture Page Screenshot
    
Click Talent link
    Sleep  4s
    Click Element  ${Talents_link}
    Wait Until Page Contains  Candidates  20  Talents page is not displayed
    Capture Page Screenshot

Click Job Applications link
    Sleep  4s
    Click Element  ${job_applications_link}
    Wait Until Page Contains  Active Job Applications  20  Job Applications page is not displayed
    Capture Page Screenshot

Click Referrals link
    Sleep  4s
    Click Element  ${referrals_link}
    Wait Until Page Contains  Candidates You Referred  20  My Agency Referrals is not displayed
    Capture Page Screenshot
